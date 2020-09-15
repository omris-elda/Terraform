output "EC2_Node_1_IP" {
  value = "sudo ssh -i ~/.ssh/${module.Node_1.KeyName}.pem ubuntu@${module.Node_1.PublicEC2IP}"
}
# In testing