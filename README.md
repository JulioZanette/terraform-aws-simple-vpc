# Terraform AWS Simple VPC Module

This Terraform module creates a simple VPC with public and private subnets, NAT gateways, route tables, and security groups.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 0.12 |
| AWS provider | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
module "my_vpc" {
  source = "../"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones = ["us-west-1a", "us-west-1b"]
}

```


In the example above, the `vpc_cidr_block` variable specifies the CIDR block for the VPC, `public_subnet_cidr_blocks` specifies the CIDR blocks for the public subnets, `private_subnet_cidr_blocks` specifies the CIDR blocks for the private subnets, and `availability_zones` specifies the availability zones for the subnets.

## Variables

The following variables are available for use in this module:

| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `vpc_cidr_block` | The CIDR block for the VPC | `string` | n/a |
| `public_subnet_cidr_blocks` | The CIDR blocks for the public subnets | `list(string)` | n/a |
| `private_subnet_cidr_blocks` | The CIDR blocks for the private subnets | `list(string)` | n/a |
| `availability_zones` | The availability zones for the subnets | `list(string)` | n/a |

## Outputs

The following outputs are available from this module:

| Output | Description |
|--------|-------------|
| `vpc_id` | The ID of the VPC |
| `public_subnet_ids` | The IDs of the public subnets |
| `private_subnet_ids` | The IDs of the private subnets |
| `nat_gateway_ids` | The IDs of the NAT gateways |
| `route_table_ids` | The IDs of the route tables |
| `security_group_ids` | The IDs of the security groups |

## License

This module is licensed under the Apache 2.0 license. See the LICENSE file for more details.

## Authors

This module was created by Julio Zanette and ChatGPT May 3 Version
