variable "env" {type=string}
variable "vpc_id" {type=string}
variable "subnet_ids" { type = list(string) }
variable "instance_type" {type=string}
variable "min" {type=string}
variable "desired" {type=string}
variable "max" {type=string}