ami  = "ami-04137ed1a354f54c4"
type = "t2.micro"

# This assigns values to the variables that are defined in the variables.tf file.

# AWS Variables with the -var option:
# To pass variables into the command using the -var options, you need to do something like:
# terraform plan -var="ami=amigoeshere" -var="type=typegoeshere"
# You'll have to add these -var arguments to the plan and apply commands.

# Environment Variables:
# To pass these through as an environment variable:
# export TF_VAR_ami="amigoeshere"
# export TF_VAR_type="typegoeshere"
# Then the variables will be read. It should be noted that if there are other variables in play,
# such as this file or variables passed into the command arguments, then they will overwrite these env variables.