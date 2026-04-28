provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  for_each = {
    server1 = "t3.micro"
    server2 = "t3.micro"
    server3 = "t3.micro"
  }

  ami           = "ami-07a00cf47dbbc844c"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
