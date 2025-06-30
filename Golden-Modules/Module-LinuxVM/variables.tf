variable "resource_group_name" {
  description = "The name of the resource group in which the Linux VM will be created."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "East US"
  
}
variable "vm_name" {
  description = "The base name for the Linux virtual machines."
  type        = string
  default     = "linux-vm"
  
}
variable "vm_count" {
  description = "The number of Linux virtual machines to create."
  type        = number
  default     = 1
  
}
variable "vm_size" {
  description = "The size of the Linux virtual machines."
  type        = string
  default     = "Standard_DS1_v2"
  
}

variable "admin_username" {
  description = "The administrator username for the Linux virtual machines."
  type        = string
  default     = "padmin"
}
variable "admin_password" {
  description = "The administrator password for the Linux virtual machines."
  type        = string
  sensitive   = true
  
}
variable "os_disk_storage_account_type" {
  description = "The storage account type for the OS disk of the Linux virtual machines."
  type        = string
  default     = "Standard_LRS"
  
}
variable "image_publisher" {
  description = "The publisher of the base image for the Linux virtual machines."
  type        = string
  default     = "Canonical"
  
}

variable "image_offer" {
  description = "The offer of the base image for the Linux virtual machines."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  
}

variable "image_sku" {
  description = "The SKU of the base image for the Linux virtual machines."
  type        = string
  default     = "22_04-lts"
  
}

variable "image_version" {
  description = "The version of the base image for the Linux virtual machines."
  type        = string
  default     = "latest"    
  
}

variable "vnet_name" {
  description = "The name of the virtual network to create."
  type        = string
  default     = "test-vnet-1"
  
}
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0/16"]
}
variable "subnet_name" {
  description = "The name of the subnet to create within the virtual network."
  type        = string
  default     = "test-subnet-1"
  
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
  default     = ["10.0.0/24"]
}   
variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {
    Environment = "dev"
    CreatedBy   = "Terraform-dev"
  }
}