resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-rg"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "my-aks-cluster"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2ds_v4"
  }

  identity {
    type = "SystemAssigned"
  }
}