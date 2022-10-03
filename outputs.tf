output "id" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].id : azurerm_kubernetes_cluster.bbnonprod[*].id
}

output "kube_config" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].kube_config_raw : azurerm_kubernetes_cluster.bbnonprod[*].kube_config_raw
  sensitive = true
}

output "client_key" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].kube_config.0.client_key : azurerm_kubernetes_cluster.bbnonprod[*].kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].kube_config.0.client_certificate : azurerm_kubernetes_cluster.bbnonprod[*].kube_config.0.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].kube_config.0.cluster_ca_certificate : azurerm_kubernetes_cluster.bbnonprod[*].kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value = var.environment == "PRD" ? azurerm_kubernetes_cluster.bbprod[*].kube_config.0.host : azurerm_kubernetes_cluster.bbnonprod[*].kube_config.0.host
  sensitive = true
}
