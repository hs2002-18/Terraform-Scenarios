output "vpc_id" { value = aws_vpc.myVPC.id }
output "private_app_subnet_ids" { value = [aws_subnet.app1.id, aws_subnet.app2.id] }
output "private_db_subnet_ids" { value = [aws_subnet.db1.id, aws_subnet.db2.id] }