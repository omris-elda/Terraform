provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "example" {
    ami = ami
    instance_type = type
}

# This pulls the information from the variables defined in the variables.tf file, instead of typing them out manually here.
# This allows for greater code re-usability and less time wasted on typing out things such as ami ids.
