provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "web" {
  ami               = "ami-07a00cf47dbbc844c"
  instance_type     = "t3.micro"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "ubuntu-ec2"
  }
}


resource "aws_ebs_volume" "extra_volume" {
  availability_zone = "ap-south-1a"
  size              = 10

  tags = {
    Name = "ubuntu-extra-ebs"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.extra_volume.id
  instance_id = aws_instance.web.id
}

output "instance_id" {
  value = aws_instance.web.id
}

output "volume_id" {
  value = aws_ebs_volume.extra_volume.id
}
