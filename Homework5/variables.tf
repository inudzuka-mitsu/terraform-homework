variable "region" {
  type        = string
  description = "Provide region"
}

variable "route_table_names" {
  type        = list(string)
  description = "Provide route table names"
}

variable "ig_name" {
  type        = string
  description = "Provide internet gateway name"
}

variable "vpc_data" {
  type = list(object({
    cidr                     = string
    is_dns_support_enabled   = bool
    is_dns_hostnames_enabled = bool
    name                     = string
    }
  ))
}

variable "subnets_data" {
  description = "Subnet names and cidr"
  type = list(object({
    name = string
    cidr = string
  }))
}

variable "ec2_data" {
  description = "Provide ec2 name and type"
  type = list(object({
    name = string,
    type = string
  }))
}

variable "ports" {
  type        = list(number)
  description = "Provide ports"
}