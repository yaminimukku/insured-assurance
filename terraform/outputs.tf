output "dev_vm_public_ip" {
  value = aws_instance.dev_vm.public_ip
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/terraform.pem ubuntu@${aws_instance.dev_vm.public_ip}"
}