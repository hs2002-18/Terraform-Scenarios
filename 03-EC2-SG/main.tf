provider "aws"{
    region = var.aws_region
}

resource "aws_security_group" "ssh_sg"{
    name = var.sg_name
    description = "Allow only my IP to SSH"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.sg_name
    }
}

resource "aws_instance" "web_server"{
    instance_type = var.instance_type
    ami = var.ami_id
    security_groups = [aws_security_group.ssh_sg.id]
    tags = {
        name = var.instance_name
    }
}

