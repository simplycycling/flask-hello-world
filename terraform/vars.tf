variable "vpc_cidr" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "Subnet CIDR Blocks"
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}