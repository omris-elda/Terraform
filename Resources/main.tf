provider "aws" {
    region = "eu-west-1"
    alias = "aws-ireland"
}

# Begin local variables

variable "ami-ireland" {
    description = "Machine image for Ireland"
    default = "ami-04137ed1a354f54c4"
}

variable "type" {
    default = "t2.micro"
}

variable "zone" {
    description = "Map of availability zones for eu-west-1"
    default = {
        1 = "eu-west-1a"
        2 = "eu-west-1b"
    }
}

# End local variables

resource "aws_instance" "example_name" {
    provider = "aws.aws-ireland"
    for_each = var.zone # For each sub-variable in the zone variable this will run
    availability_zone = each.value # Looks at the values in the zone variable
    ami = var.ami-ireland
    instance_type = var.type

    lifecycle {
        prevent_destroy = false # Allows these instances to be destroyed by Terraform
    }

    timeouts {
        create = "5m"
        delete = "2h"
        # If it takes longer than these times to do the specified action, it will time out and skip the
        # creation of this resource
    }
}