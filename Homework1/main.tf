
# declared variable blocks
# using 'set' here, since users in aws have to have unique names

variable "blackpink_users" {
  type    = set(string)
  default = ["jenny", "rose", "lisa", "jisoo", "miyeon"]  # --> "miyeon" added in second part of the task
}

variable "twice_users" {
  type    = set(string)
  default = ["jihyo", "sana", "momo", "dahyun", "mina"] # --> "mina" added in second part of the task
}

variable "user_groups" {
  type    = set(string)
  default = ["blackpink", "twice"]
}

# created users, split them in two blocks for readability 

resource "aws_iam_user" "blackpink_create_user" {
  for_each = var.blackpink_users
  name     = each.value
}

resource "aws_iam_user" "twice_create_user" {
  for_each = var.twice_users
  name     = each.value
}

# created groups

resource "aws_iam_group" "required_groups" {
  for_each = var.user_groups
  name     = each.value
}

# added users to their respective groups

resource "aws_iam_group_membership" "blackpink_group_membership" {
  name = "blackpink-membership"
  users = [for user in aws_iam_user.blackpink_create_user : user.name]
  group = aws_iam_group.required_groups["blackpink"].name
}

resource "aws_iam_group_membership" "twice_group_membership" {
  name = "twice-membership"
  users = [for user in aws_iam_user.twice_create_user : user.name]
  group = aws_iam_group.required_groups["twice"].name
}

# Create two users manually in AWS Console (attach 0 policies): miyeon and mina and import them to Terraform. (provide terraform import commands in main.tf file as a comment)

# 1. terraform import 'aws_iam_user.blackpink_create_user["miyeon"]' miyeon --> import command

# 2. terraform import 'aws_iam_user.twice_create_user["mina"]' mina

# Modify Terraform configuration file to add user miyeon to the blackpink group and user mina to the twice group and apply changes.

# 1. Modified config file by adding users to their respective users variable blocks.  
# 2. Ran 'terraform apply'

# Finally, run terraform destroy to confirm you can delete all resources: created by Terraform and manually created.

/**



**/