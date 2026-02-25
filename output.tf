/*output "bastion_public_ip" {
  value = azurerm_public_ip.bastion_pip.ip_address
}

output "vm_private_ips" {
  value = azurerm_network_interface.vm_nic[*].private_ip_address
}

output "Win_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}*/