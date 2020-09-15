output "vpc_id" {
  value = aws_vpc.Main_VPC.id
}

output "public_subnetA_id" {
  value = aws_subnet.publicA.id
}