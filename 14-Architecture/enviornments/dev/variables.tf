variable "aws_region" { type = string }
variable "env" { type = string }
variable "vpc_cidr" { type = string }
variable "instance_type" { type = string }
variable "enable_ng" { type = bool }
variable "asg_min" { type = string }
variable "asg_desired" { type = string }
variable "asg_max" { type = string }
variable "create_rds" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}