output "linux_vm_ip" {
  value = azurerm_public_ip.linux_pip.ip_address
}

output "windows_vm_ip" {
  value = azurerm_public_ip.windows_pip.ip_address
}