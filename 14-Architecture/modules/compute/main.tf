resource "aws_security_group" "app" {
  vpc_id = var.vpc_id
  egress { 
    from_port=0 
    to_port=0 
    protocol="-1" 
    cidr_blocks=["0.0.0.0/0"] 
    }
}
resource "aws_launch_template" "lt" {
  name_prefix="app-"
  image_id="ami-07a00cf47dbbc844c"
  instance_type=var.instance_type
  vpc_security_group_ids=[aws_security_group.app.id]
}
resource "aws_autoscaling_group" "asg" {
  min_size=var.min
  max_size=var.max
  desired_capacity=var.desired
  vpc_zone_identifier=var.subnet_ids
  launch_template { 
    id=aws_launch_template.lt.id
    version="$Latest" 
    }
}