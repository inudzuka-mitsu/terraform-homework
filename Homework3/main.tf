provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "aws-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

data "aws_availability_zones" "azs" {}

resource "aws_instance" "web" {
  ami           = data.aws_ami.aws-linux-2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  key_name = aws_key_pair.bast-key.key_name
  associate_public_ip_address = true
  user_data = file("apache.sh")
  user_data_replace_on_change = true
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  count         = 3

  tags = {
    Name = "web-${count.index}"
  }
}

output ec2 {
  value = aws_instance.web[*].public_ip
}
