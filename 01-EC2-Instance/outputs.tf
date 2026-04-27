output "public_ip"{
    value = aws_instance.web_server.public_ip
}
output "private_ip"{
    value = aws_instance.web_server.private_ip
}
output "public_dns"{
    value = aws_instance.web_server.public_dns
}