output "rds_endpoint"{
    value = aws_db_instance.my_sql.endpoint
}

output "rds_db_name"{
    value = aws_db_instance.my_sql.db_name
}


output "db_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.name
}