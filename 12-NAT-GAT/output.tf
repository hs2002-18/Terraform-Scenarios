output "nat_gt_id"{
    value = aws_nat_gateway.nat_gw.id
}

output "nat_public_ip"{
    value = aws_eip.nat_ip.public_ip
}

output "nat_private_ip"{
    value = aws_eip.nat_ip.private_ip
}

