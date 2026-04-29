provider "aws"{
    region = var.aws_region
}
resource "aws_vpc" "myvpc"{
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "RDS-VPC"
    }
}

resource "aws_subnet" "private_1"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.private_sub_1
    availability_zone = var.az_1

    tags = {
        Name = "RDS-Private-1"
    }
}
resource "aws_subnet" "private_2"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.private_sub_2
    availability_zone = var.az_2

    tags = {
        Name = "RDS-Private-2"
    }
}

resource "aws_security_group" "mysg" {
    name = "RDS_SG"
    description = "Allow RDS"
    vpc_id = aws_vpc.myvpc.id

    ingress{
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = var.allowed_cidr_blocks
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_db_subnet_group" "db_subnet_group"{
    name = "my-db-subnet-group"
    subnet_ids = [
        aws_subnet.private_1.id,
        aws_subnet.private_2.id
    ]

    tags = {
        Name = "my-db-subnet-group"
    }
}

resource "aws_db_instance" "my_sql"{
    identifier = var.db_identifier
    allocated_storage = 20
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    db_name = var.db_name
    username = var.db_username
    password = var.db_password
    port = 3306
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.mysg.id]
    publicly_accessible    = false
    skip_final_snapshot    = true
    multi_az               = false

  tags = {
    Name = "mysql-rds"
  }
}