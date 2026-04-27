provider "aws"{
    region = var.aws_region
}

resource "aws_iam_user" "devops_user"{
    name = var.user_name
}

resource "aws_iam_access_key" "access_key"{
    user = aws_iam_user.devops_user.name
}