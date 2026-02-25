resource "azurerm_resource_group" "rg" {
  name     = "Landing-zone"
  location = var.location
}
