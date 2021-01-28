provider "azurerm" {
  version = "=2.13.0"

  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rgroup
  location = var.location
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name       = "aksjonasiac"
  location   = azurerm_resource_group.rg.location
  dns_prefix = "aksjonasiac"

  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "1.18.10"

  default_node_pool {
    name       = "aksjonasiac"
    node_count = "1"
    vm_size    = "standard_ds1_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
}
