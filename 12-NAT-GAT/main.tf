provider "aws"{
    region = "ap-south-1"
}

resource "aws_vpc" "myVPC"{
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "NAT-VPC"
    }
}

resource "aws_subnet" "public_1"{
    vpc_id = aws_vpc.myVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public-1"
    }
}

resource "aws_internet_gateway" "myigw"{
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "IGW"
    }
}

resource "aws_eip" "nat_ip"{
    domain = "vpc"
    tags = {
        Name = "NAT-IP"
    }
}

resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = aws_subnet.public_1.id

    tags = {
        Name = "NAT-GW"
    }
    depends_on = [aws_internet_gateway.myigw]
}