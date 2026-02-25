
resource "azurerm_kubernetes_cluster" "aks" {
name = "k8s"
kubernetes_version = "1.33.5"
location = var.location
resource_group_name = azurerm_resource_group.rg.name
dns_prefix = "aks-cluster"
default_node_pool {
  name = "system"
  node_count = "1"
  vm_size = "Standard_D2s_v3"
type = "VirtualMachineScaleSets"

}
identity {
  type = "SystemAssigned"
}
network_profile {
load_balancer_sku = "standard"
network_plugin = "kubenet"
}

}