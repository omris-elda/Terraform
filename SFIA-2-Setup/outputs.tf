output "EC2_Node_1_IP" {
  value = "sudo ssh -i ~/.ssh/${module.Node_1.KeyName}.pem ubuntu@${module.Node_1.PublicEC2IP}"
}
# Outputs the command to SSH into the Node_1 resource that was just created


# The following should create a new Ansible inventory file

resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.cfg",
  {
    public-ip = module.Node_1.*.PublicEC2IP,
    public-id = module.Node_1.*.id
  }
  )
  filename = "inventory.cfg"
}
