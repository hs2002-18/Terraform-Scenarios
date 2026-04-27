output "iam_user_name" {
  value = aws_iam_user.devops_user.name
}
output "access_key_id"{
    value = aws_iam_access_key.access_key.id

}

output "access_key_secret"{
    value = aws_iam_access_key.access_key.secret
    sensitive = true
}

