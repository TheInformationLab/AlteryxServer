#-----networking/vars.tf
variable "VPC_CIDR" {}
variable "PRIVATE_CIDRS" {}
variable "ALLACCESSIPS" {}
variable "ALLOWEDIPS" {
    type = "list"
}
variable "AWS_AVAILABILITY_ZONE" {}