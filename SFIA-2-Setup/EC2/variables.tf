variable "ami" {
  description = "AMI ID of ubuntu 18.04LTS eu-west-1"
  default     = "ami-04137ed1a354f54c4"
}

variable "instance-type" {
  description = "Type of instance to be started up"
  default     = "t2.micro"
}

variable "ssh-key" {
  description = "SSH Key Pair name"
  default     = "Ed-Home-PC"
}

variable "subnet_id" {
  # value = module.subnet.public_subnetA_id
  description = "Required default value, will be added in the primary main.tf"
  default     = "Null"
}

variable "associate_public_ip_address" {
  description = "Should this EC2 instance have a public ip addresss"
  default     = true
}

variable "tags" {
  description = "Tags to be applied to the EC2 Instances"
  default = {
    Name        = "Default Instance Name"
    Description = "Default Instance Description"
  }
}

variable "vpc_security_group_ids" {
  description = "IDs of the security groups that this instance will belong to."
  default     = "Pull from main.tf"
}