output "PublicEC2IP" {
    value = aws_instance.Instances.public_ip
    # Outputs the public IP address of the created instances
}

output "KeyName" {
    value = aws_instance.Instances.key_name
    # Outputs the name of the ssh key
}