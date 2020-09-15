output "EC2_Node_1_IP" {
  value = "sudo ssh -i ~/.ssh/${module.Node_1.KeyName}.pem ubuntu@${module.Node_1.PublicEC2IP}"
}
# Outputs the command to SSH into the Node_1 resource that was just created


# The following should create a new Ansible inventory file

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.cfg",
<<<<<<< HEAD
  {
    public-ip = module.Node_1.*.public_ip
    public-id = module.Node_1.*.id
  }
=======
    {
      public-ip = module.aws_instance.Node_1.*.public_ip
      public-id = module.aws_instance.Node_1.*.id
    }
>>>>>>> 563d21c1e0f18583c57066bc833b8ac3edd63e56
  )
  filename = "inventory.cfg"
}
