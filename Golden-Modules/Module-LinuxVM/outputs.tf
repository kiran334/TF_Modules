output "vm_private_ips" {
  description = "Private IP addresses of the created Linux virtual machines."
  value       = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
  
}

output "subnet_id" {
  description = "ID of the created subnet."
  value       = azurerm_subnet.subnet.id
  
}

output "vnet_id" {
  description = "ID of the created virtual network."
  value       = azurerm_virtual_network.vnet.id
  
}