variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  
}
variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0/16"]
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  
}
variable "subnet_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1/24"]
}
variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
  
}
variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  
}   
variable "environment" {
  description = "The environment for tagging resources"
  type        = string
  default     = "Development"
}
variable "owner" {
  description = "The owner of the resources for tagging"
  type        = string
  default     = "spk54"
}   
variable "project" {
  description = "The project name for tagging resources"
  type        = string
  default     = "TF_Modules"
}
