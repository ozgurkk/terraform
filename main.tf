## Resources to Create || main.tf ##

# Nonprod- ResourceGroup - If created
resource "azurerm_resource_group" "bbnonprod" {
  count    = var.environment == "NRPD" ? 1 : 0
  name     = "bb-nprd-resources"
  location = var.resource_group_location
}

# Prod ResourceGroup
resource "azurerm_resource_group" "bbprod" {
  count    = var.environment == "PRD" ? 1 : 0
  name     = "bb-prd-resources"
  location = var.resource_group_location
}

# Nonprod AKS Cluster
resource "azurerm_kubernetes_cluster" "bbnonprod" {
  depends_on = [
    azurerm_resource_group.bbnonprod
  ]
  count               = var.environment == "NPRD" ? 1 : 0
  name                = "${var.prefix}-nprd"
  location            = var.resource_group_location
  resource_group_name = "bb-nprd-resources"
  dns_prefix          = "${var.prefix}-nprd"

  default_node_pool {

	name           = "system"
    node_count     = 1
    vm_size        = "Standard_B2s"
    zones          = [1, 2]

	node_labels = {
      "nodepool-type" = "System"
      "environment"   = "NPRD"
      "nodepoolos"    = "linux"
  }
    tags = {
      "nodepool-type" = "System"
      "environment"   = "NPRD"
      "nodepoolos"    = "linux"
  }
}

  identity {
    type = "SystemAssigned"
  }
  
}


# Prod AKS Cluster
resource "azurerm_kubernetes_cluster" "bbprod" {
    depends_on = [
    azurerm_resource_group.bbprod
  ]
  count               = var.environment == "PRD" ? 1 : 0
  name                = "${var.prefix}-prd"
  location            = var.resource_group_location
  resource_group_name = "bb-prd-resources"
  dns_prefix          = "${var.prefix}-prd"
 

  default_node_pool {
    name           = "systemprd"
    node_count     = 3
    vm_size        = "Standard_D2s_v2"
    zones          = [1, 2]
	
    node_labels = {
      "nodepool-type" = "System"
      "environment"   = "NPRD"
      "nodepoolos"    = "linux"
  }
    tags = {
      "nodepool-type" = "System"
      "environment"   = "PRD"
      "nodepoolos"    = "linux"
  }
}

  identity {
    type = "SystemAssigned"
  }
}

# Nonprod Userpool

resource "azurerm_kubernetes_cluster_node_pool" "usernprd" {
    depends_on = [
    azurerm_resource_group.bbnonprod
  ]
  count                 = var.environment == "NPRD" ? 1 : 0
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.bbnonprod[count.index].id
  vm_size               = "Standard_B2s"
  node_count            = 1
  zones                 = [1, 2]
  
  node_labels = {
    "nodepool-type" = "User"
    "environment"   = "NPRD"
    "nodepoolos"    = "linux"
  }
  tags = {
    "nodepool-type" = "User"
    "environment"   = "NPRD"
    "nodepoolos"    = "linux"
  }
}

# Prod  Userpool
resource "azurerm_kubernetes_cluster_node_pool" "userprd" {
    depends_on = [
    azurerm_resource_group.bbprod
  ]
  count                 = var.environment == "PRD" ? 1 : 0
  name                  = "userprd"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.bbprod[count.index].id
  vm_size               = "Standard_D2s_v2"
  node_count            = 3
  zones    = [1, 2]
  
  node_labels = {
    "nodepool-type" = "User"
    "environment"   = "PRD"
    "nodepoolos"    = "linux"
  }
  tags = {
    "nodepool-type" = "User"
    "environment"   = "NPRD"
    "nodepoolos"    = "linux"
  }
}