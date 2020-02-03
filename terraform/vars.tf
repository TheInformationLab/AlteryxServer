variable "ALLACCESSIPS" {
  # FIXME:  how does the list() function/mapping apply? why is it not working in this? Does it need a default?
  type = list(string)
}

variable "ALLOWEDIPS" {
  type = list(string)
}

variable "AMIS" {
  type = map(string)
  default = {
    #FIXME: currently set to default windows ami for testing.
    #TODO: develop packer script to create base image and deploy into tf script
    us-west-2 = "ami-0a1d405ce719bebfd" 
  }
}

variable "AWS_INSTANCE" {
}

variable "AWS_REGION" {
  default = "us-west-2"
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

