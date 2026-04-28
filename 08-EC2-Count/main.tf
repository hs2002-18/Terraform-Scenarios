provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server"{
    count = 3
    ami = "ami-07a00cf47dbbc844c"
    instance_type = "t3.micro"

    tags = {
        Name = "web-server-${count.index+1}"
    }
}