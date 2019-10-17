#----networking/outputs.tf
#----Output Security Group ID
output "security_group_id_out" {
  value = aws_security_group.ayx_public_sg.id
  # value = "${aws_vpc.tf_vpc.default_security_group_id}"
}

output "subnet_id_out" {
  value = aws_subnet.ayx_public_subnet.id
}

