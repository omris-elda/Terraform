provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_vpc" {
  source = "./VPC"
}

module "aws_webserver_sg" {
  source        = "./SecurityGroup"
  name          = "WebServerSG"
  vpc_id        = module.aws_vpc.vpc_id
  ingress_ports = var.HTTP-ports # This will hopefully overwrite the value of ingress_ports in the SecurityGroup file
}

module "Node_1" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  tags = {
    Name = "WebServer_Node_1"
  }
  associate_public_ip_address = true
}

module "Node_2" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  ami                    = var.centos-ami-id
  tags = {
    Name = "WebServer_Node_2"
  }
}

module "Jenkins_Master" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id

  # Configuring the instance with an ansible-playbook
  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./Ed-Home-PC.pem -i '${aws_instance.jenkins_master.public_ip},' master.yaml"
  }
  # As a breakdown:
  # Sleep for 2 mins (120 secs) to give the instance a chance to boot up
  # Set ANSIBLE_HOST_KEY_CHECKING env variable to false so that Ansible will trust this new instance
  # Run the ansible-playbook command with user ubuntu, a specified private key,
  # and a specified Ansible inventory that automatically populates with the IP address of the created instance
}