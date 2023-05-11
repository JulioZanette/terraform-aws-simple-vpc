# Example 1: Basic VPC with default values

```terraform
provider "aws" {
  region = "us-west-1"
}

module "my_vpc" {
  source = "../"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones = ["us-west-1a", "us-west-1b"]
}

```
In this example, we're creating a basic VPC with the default values for all variables except for the VPC CIDR block, public and private subnet CIDR blocks, and availability zones.

# Example 2: VPC with custom security groups

```terraform
provider "aws" {
  region = "us-west-1"
}

module "my_vpc" {
  source = "../"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones = ["us-west-1a", "us-west-1b"]
  security_group_ingress_rules = [
    {
      description = "Allow inbound SSH traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
    },
    {
      description = "Allow inbound HTTP traffic"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

```
In this example, we're creating a VPC with custom security group rules. The security_group_ingress_rules variable is used to specify the inbound rules for the default security group that's created by the module. In this case, we're allowing SSH traffic from the public subnets and HTTP traffic from any IP address.