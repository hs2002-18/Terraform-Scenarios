data "aws_availability_zones" "az" {}
resource "aws_vpc" "myVPC" { 
    cidr_block = var.vpc_cidr 
    enable_dns_hostnames = true 
 }
resource "aws_internet_gateway" "igw" { vpc_id = aws_vpc.myVPC.id }
resource "aws_subnet" "public1" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.1.0/24" 
    availability_zone=data.aws_availability_zones.az.names[0] 
    map_public_ip_on_launch=true 
    }
resource "aws_subnet" "public2" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.2.0/24" 
    availability_zone=data.aws_availability_zones.az.names[1] 
    map_public_ip_on_launch=true 
    }
resource "aws_subnet" "app1" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.11.0/24" 
    availability_zone=data.aws_availability_zones.az.names[0] 
    }
resource "aws_subnet" "app2" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.12.0/24" 
    availability_zone=data.aws_availability_zones.az.names[1] 
    }
resource "aws_subnet" "db1" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.21.0/24" 
    availability_zone=data.aws_availability_zones.az.names[0] 
    }
resource "aws_subnet" "db2" { 
    vpc_id=aws_vpc.myVPC.id 
    cidr_block="10.0.22.0/24" 
    availability_zone=data.aws_availability_zones.az.names[1] 
    }
resource "aws_eip" "nat" { 
    count = var.enable_ng ? 1 : 0 
    domain="vpc"
     }
resource "aws_nat_gateway" "nat" { 
    count = var.enable_ng ? 1 : 0 
    allocation_id=aws_eip.nat[0].id 
    subnet_id=aws_subnet.public1.id 
    }