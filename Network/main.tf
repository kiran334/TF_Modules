resource "azurerm_virtual_network" "az_vnet" {
    name = var.vnet_name
    location=var.location
    resource_group_name = var.resource_group_name
    address_space = var.vnet_address_space
    tags = local.tags
}

resource "azurerm_subnet" "az_subnet" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.az_vnet.name
    address_prefixes = var.subnet_prefixes
}