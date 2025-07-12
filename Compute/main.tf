resource "azurerm_network_interface" "azurerm_network_interface" {
    name                = "${var.vm_name}-nic"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
  
}
resource "azurerm_linux_virtual_machine" "linux_VM" {
    name = var.vm_name
    location = var.location
    resource_group_name = var.resource_group_name
    size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.nic.id]

    os_disk {
        caching = "ReadWrite"
        storage_account_type = var.os_disk_storage_account_type
        name = "${var.vm_name}-osdisk"
    }
    source_image_reference {
        publisher = var.image_publisher
        offer = var.image_offer
        sku = var.image_sku
        version = var.image_version
    }
  
}
