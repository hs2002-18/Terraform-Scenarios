variable "aws_region"{}
variable "ami_id"{}
variable "instance_type"{}
variable "my_ip"{}
variable "subnet_ids"{
    type = list(stirng)
}
variable "desired_capacity"{}
variable "min_size"{}
variable "max_size"{}