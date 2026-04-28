variable "aws_region" {
  type=string
  default = "ap-south-1"
}
variable "vpc_cidr"{
    type = string
    default = "10.0.0.0/16"
}
variable "public_subnet_cidr"{
    type = string
    default = "10.0.1.0/24"
}
variable "availability_zone"{
    type = string
    default = "ap-south-1a"
}
variable "vpc_name"{
    type = string
    default = "my-vpc"
}
variable "subnet_name" {
  type = string
  default = "my-subnet"
}
variable "igw_name"{
    type=string
    default = "my-igw"
}
variable "rt-name"{
    type=string
    default="my-rt"
}