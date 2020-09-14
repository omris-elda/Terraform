variable "ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80, 443]
}

variable "centos-ami-id" {
  description = "The CentOS ami ID for AWS"
  # For the purposes of this exercise it's not actually CentOS, 
  # but an older version of Ubuntu.
  value = "ami-09b49c48928db765c"
}