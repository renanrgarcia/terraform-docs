terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "k8s-${var.env}-${var.project_name}"
  location = "South Africa North"
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "k8s-${var.env}-${var.project_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "k8s-${var.env}-${var.project_name}"

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.k8s_node_count
    vm_size    = var.k8s_node_vm_size
    os_disk_size_gb = var.k8s_node_os_disk_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control_enabled = true

  tags = {
    Environment = var.env
  }
  
  # identity {
  #   type = "SystemAssigned"
  # }
}

# Create RBAC
# az ad sp create-for-rbac --name k8s --role Contributor --scopes /subscriptions/sub
# Change sub to your subscription id

# Cluster AKS credentials
# az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)