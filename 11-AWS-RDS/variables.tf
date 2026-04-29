variable "aws_region"{
    type=string
}
variable "vpc_cidr"{
    type=string
}
variable "private_sub_1"{
    type=string
}
variable "private_sub_2"{
    type=string
}
variable "az_1"{
    type=string
}
variable "az_2"{
    type=string
}
variable "allowed_cidr_blocks"{
    type=list(string)
}
variable "db_identifier"{
    type=string
}
variable "db_name"{
    type=string
}
variable "db_username"{
    type=string
}
variable "db_password"{
    type=string
    sensitive = true
}