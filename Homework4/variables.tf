variable "region" {
  description = "region name"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "bastion key name"
  type        = string
  default     = "bastion-key"
}

variable "ports" {
  description = "available ports"
  type        = list(number)
}

variable "az" {
  description = "az to deploy to"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "ec2 type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ami of the instance"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "number of instances to deploy"
  type        = number
  default     = 1
}