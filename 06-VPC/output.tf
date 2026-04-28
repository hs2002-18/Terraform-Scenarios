# outputs.tf

output "vpc_id" {
  value = aws_vpc.myVPC.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "route_table_id" {
  value = aws_route_table.rt.id
}