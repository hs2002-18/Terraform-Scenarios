output "public_ips" {
  value = {
    for name, instance in aws_instance.web :
    name => instance.public_ip
  }
}