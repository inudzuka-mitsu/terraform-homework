data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_data[0].type
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("apache-ubuntu.sh")
  tags = {
    Name = var.ec2_data[0].name
  }
}


resource "aws_instance" "web1" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.ec2_data[1].type
  subnet_id              = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("apache-linux.sh")
  tags = {
    Name = var.ec2_data[1].name
  }
}
