resource "aws_key_pair" "bast-key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}