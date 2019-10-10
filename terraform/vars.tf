variable "ALLACCESSIPS" {
  type = list(string)
}

variable "ALLOWEDIPS" {
  type = list(string)
}

variable "AMIS" {
  type = map(string)
  default = {
    us-west-2 = "ami-0b32cfb7b4e1c1d23"
  }
}

variable "AWS_ACCESS_KEY" {
}

variable "AWS_INSTANCE" {
}

variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AWS_SECRET_KEY" {
}

variable "KEY_NAME" {
}

variable "PRIVATE_CIDRS" {
}

variable "VOLUME_SIZE" {
}

variable "VOLUME_TYPE" {
  default = "gp2"
}

variable "VPC_CIDR" {
}

variable "AWS_AVAILABILITY_ZONE" {
  default = "us-west-2b"
}

variable "admin_password" {
  default = "SuperStar!"
}

