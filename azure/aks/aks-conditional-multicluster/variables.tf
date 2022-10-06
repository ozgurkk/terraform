variable "prefix" {
  description = "A prefix used for all resources."
}

variable "resource_group_location" {
  description = "Region name  of the resource group. Valid region names could be : eastus, eastus2, southcentralus,westus2, southeastasia"
} 

variable "environment" {
  description = "The Azure Resource Environment in which all resources. You must type PRD to create a producton grade cluster or type NPRD for creating a test/dev grade AKS cluster. Names are CASE-SENSITIVE "
}
