variable "prefix" {
  description = "A prefix used for all resources."
}

variable "resource_group_location" {
  description = "Region name  of the resource group. Valid region names could be : eastus
eastus2
southcentralus
westus2
southeastasia
northeurope
uksouth
westeurope
centralus
northcentralus
westus
southafricanorth
centralindia
eastasia
japaneast
koreacentral
canadacentral
francecentral
germanywestcentral
norwayeast
switzerlandnorth
uaenorth
brazilsouth
asia
asiapacific
australia
brazil
canada
europe
global
india
japan
uk
unitedstates
westcentralus
southafricawest
australiacentral
australiacentral2
australiaeast
australiasoutheast
japanwest
koreasouth
southindia
westindia
canadaeast
francesouth
germanynorth
norwaywest
switzerlandwest
ukwest
uaecentral
brazilsoutheast
germanynortheast
germanycentral
chinanorth
chinaeast
chinaeast2
chinanorth2
chinaeast3
chinanorth3

"
}

variable "environment" {
  description = "The Azure Resource Environment in which all resources. You must type PRD to create a producton grade cluster or type NPRD for creating a test/dev grade AKS cluster. Names are CASE-SENSITIVE "
}
