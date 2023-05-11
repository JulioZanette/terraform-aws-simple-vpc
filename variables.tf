variable "name_prefix" {
  description = "(Required) Prefix to use for all resource names created by this module."
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the VPC Resources."
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}