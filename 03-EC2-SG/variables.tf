variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "sg_name"{
    type = string
    default = "allow-ssh-for-my-ip"
}

variable "my_ip"{
    type = string
    default = "203.xxx.xx.xx"  #Please enter your IP
}

variable "instance_type"{
    type = string
    default = "t3.micro"
}

variable "ami_id"{
    type = string
    default = "ami-05d2d839d4f73aafb"
}

variable "instance_name"{
    type = string
    default = "SSH-EC2"
}