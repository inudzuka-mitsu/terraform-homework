variable "s3_bucket_names" {
  type    = set(string)
  default = ["kaizen-valeriiab", "kaizen-valeriia-27", "kaizen-valeriia-272"]
}

variable "user_names" {
    type = set(string)
    default = [ "jenny", "rose", "lisa", "jisoo" ]
}

# Create a key.

resource "aws_key_pair" "bastion-key" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Create 2 S3 buckets: 1st with the name: kaizen-yourname, 2nd with the name: kaizen and add prefix.

resource "aws_s3_bucket" "create-s3-with-predefined-names" {
  for_each = var.s3_bucket_names
  bucket   = each.value
}

resource "aws_s3_bucket" "create-s3-with-prefix" {
  bucket_prefix = "kaizen"
}

/*
Create manually two more buckets (with any names) and import them to terraform code.
Provide import commands as a comment in the file
Confirm you can delete them running terraform destroy.

Import commands:

terraform import 'aws_s3_bucket.create-s3-with-predefined-names["kaizen-valeriia-27"]' kaizen-valeriia-27

terraform import 'aws_s3_bucket.create-s3-with-predefined-names["kaizen-valeriia-272"]' kaizen-valeriia-272

*/


/* 
creates users: jenny,  rose, lisa, jisoo with for_each
create group blackpink
add users: jenny,  rose, lisa, jisoo to the blackpink group with for loop
*/

resource "aws_iam_user" "create_iam_users" {
  for_each = var.user_names
  name = each.value
}

resource "aws_iam_group" "blackpink_group" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "bp-membership" {
  name = "blackpink-membership"
  users = [
    for user in aws_iam_user.create_iam_users : user.name
  ]
  group = aws_iam_group.blackpink_group.name
}