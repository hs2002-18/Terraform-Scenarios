provider "aws"{
    region = "ap-south-1"
}

resource "aws_security_group" "sgw"{
    name = "web-sgw"
    description = "Allows SSH and HTTP"

    ingress{
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.my_ip
    }
    
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_launch_template" "web"{
    name_prefix = "web-server-"
    image_id = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sgw.id]

    user_data = base64encode(<<EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl enable nginx
    systemctl start nginx
    EOF
    )
}

resource "aws_autoscaling_group" "web_sg"{
    name = "web-sg"
    desired_capacity = var.desired_capacity
    min_size = var.min_size
    max_size = var.max_size
    vpc_zone_identifier = var.subnet_ids
    health_check_type   = "EC2"

    launch_template {
         id      = aws_launch_template.web_lt.id
         version = "$Latest"
    }

    tag {
        key                 = "Name"
        value               = "asg-web-server"
        propagate_at_launch = true
    }

} 