variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}

variable "azs" {
  description = "list of Availability Zones"
  type        = list(string)


}

variable "private_subnet" {
  description = "list of private subnets"
  type        = list(string)

}

variable "public_subnet" {
  description = "list of public subnets"
  type        = list(string)

}
