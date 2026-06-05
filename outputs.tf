output "public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "ssh_command" {
  description = "SSH command (use your private key matching azure-rsa-public)"
  value       = "ssh -i <path-to-private-key> ivansto@${azurerm_public_ip.pip.ip_address}"
}
