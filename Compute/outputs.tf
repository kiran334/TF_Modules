output "vm_names" {
  description = "The names of the created virtual machines"
  value       = azurerm_linux_virtual_machine.vm[*].name
  
}
output "nic_ids" {
  description = "The IDs of the created network interfaces"
  value       = azurerm_network_interface.nic[*].id
  
}
