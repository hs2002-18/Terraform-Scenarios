variable "create_rds" {type=string}
variable "env" {type=string}
variable "vpc_id" {type=string}
variable "subnet_ids" { type = list(string) }
variable "db_password" { 
    type=string
    sensitive = true 
    }