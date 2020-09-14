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
  ingress_ports = var.ports # This will hopefully overwrite the value of ingress_ports in the SecurityGroup file
}

module "webserver_node_1" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  tags = {
    Name = "WebServer_Node_1"
  }
  associate_public_ip_address = true
}

module "webserver_node_2" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  ami = var.centos-ami-id
  tags = {
    Name = "WebServer_Node_2"
  }
}