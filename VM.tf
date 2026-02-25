/*resource "azurerm_network_interface" "vm_nic" {
  count               = 3
  name                = "vm-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = 3
  name                = "spoke-vm-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.vm_nic[count.index].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }


custom_data = count.index == 0 ? base64encode(<<EOF
#cloud-config
package_update: true
packages:
  - software-properties-common
  - python3
  - python3-pip

runcmd:
  - apt-add-repository --yes --update ppa:ansible/ansible
  - apt install -y ansible
  - ansible --version
  - usermod -aG sudo ${var.admin_username}
  - mkdir -p /home/${var.admin_username}/.ssh
  - ssh-keygen -t rsa -b 4096 -f /home/${var.admin_username}/.ssh/id_rsa -N ""
  - chown -R ${var.admin_username}:${var.admin_username} /home/${var.admin_username}/.ssh
EOF
) : null


}



resource "azurerm_network_interface" "nic" {
  name                = "win-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  
}
}
resource "azurerm_windows_virtual_machine" "winvm"{
 name                = "win-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v4"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
}


}
resource "azurerm_virtual_machine_extension" "iis_install" {
  name                 = "install-iis"
  virtual_machine_id   = azurerm_windows_virtual_machine.winvm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
{
  "commandToExecute": "powershell -ExecutionPolicy Unrestricted -Command Install-WindowsFeature -Name Web-Server -IncludeManagementTools"
}
SETTINGS
}
*/
