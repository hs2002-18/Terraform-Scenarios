variable "aws_region"{
    description  = "AWS Region"
    type = string
    default = "ap-south-1"
}

variable "ami_id"{
    description = "AMI ID of Ec2 instance"
    type = string
    default = "ami-05d2d839d4f73aafb"
}

variable "instance_type"{
    description = "EC2 Instance type"
    type = string
    default = "t3.micro"
}

variable "instance_name"{
    description = "EC2 instance name"
    type = string
    default = "MyWebServer"
}