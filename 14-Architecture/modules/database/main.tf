resource "aws_security_group" "db" {
  count = var.create_rds ? 1 : 0
  vpc_id = var.vpc_id
}
resource "aws_db_subnet_group" "db" {
  count = var.create_rds ? 1 : 0
  name = "${var.env}-db-subnet"
  subnet_ids = var.subnet_ids
}
resource "aws_db_instance" "mysql" {
  count = var.create_rds ? 1 : 0
  identifier = "${var.env}-mysql"
  engine = "mysql"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username = "admin"
  password = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db[0].name
  skip_final_snapshot = true
}