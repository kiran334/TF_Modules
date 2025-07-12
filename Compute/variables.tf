variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}
variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
}
variable "vm_name" {
  description = "The base name for the virtual machines"
  type        = string
  default     = "myVM"
}
variable "vm_count" {
  description = "The number of virtual machines to create"
  type        = number
  default     = 1
}
variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string
  default     = "Standard_DS1_v2"
}
variable "admin_username" {
  description = "The administrator username for the virtual machines"
  type        = string
}
variable "admin_password" {
  description = "The administrator password for the virtual machines"
  type        = string
  sensitive   = true
}
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}
variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machines"
  type        = string
  default     = "Canonical"
}
variable "image_offer" {
  description = "The offer of the image to use for the virtual machines"
  type        = string
  default     = "UbuntuServer"
}
variable "image_sku" {
  description = "The SKU of the image to use for the virtual machines"
  type        = string
  default     = "18.04-LTS"
}
variable "image_version" {
  description = "The version of the image to use for the virtual machines"
  type        = string
  default     = "latest"
}

