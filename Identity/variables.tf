variable "identity_name" {
  description = "The name of the user assigned identity"
  type        = string
  default     = "myIdentity"
  
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