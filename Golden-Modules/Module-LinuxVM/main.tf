# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name                       # Name of the virtual network
    address_space       = var.vnet_address_space              # Address space for the VNet
    location            = var.location                        # Azure region
    resource_group_name = var.resource_group_name             # Resource group name
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name                    # Name of the subnet
    resource_group_name  = var.resource_group_name            # Resource group name
    virtual_network_name = azurerm_virtual_network.vnet.name  # Reference to the VNet
    address_prefixes     = var.subnet_prefixes                # Address prefixes for the subnet
}

# Create network interfaces for each VM
resource "azurerm_network_interface" "nic" {
    count               = var.vm_count                        # Number of NICs to create
    name                = "${var.vm_name}-nic-${count.index}" # NIC name with index
    location            = var.location                        # Azure region
    resource_group_name = var.resource_group_name             # Resource group name

    ip_configuration {
        name                          = "internal"              # Name of the IP configuration
        subnet_id                     = azurerm_subnet.subnet.id # Reference to the subnet
        private_ip_address_allocation = "Dynamic"               # Dynamic private IP allocation
    }
}

# Create Linux virtual machines
resource "azurerm_linux_virtual_machine" "vm" {
    count                           = var.vm_count                        # Number of VMs to create
    name                            = "${var.vm_name}-${count.index}"     # VM name with index
    location                        = var.location                        # Azure region
    resource_group_name             = var.resource_group_name             # Resource group name
    size                            = var.vm_size                         # VM size
    admin_username                  = var.admin_username                  # Admin username
    admin_password                  = var.admin_password                  # Admin password
    disable_password_authentication = false                                # Enable password authentication
    network_interface_ids           = [azurerm_network_interface.nic[count.index].id] # Attach NIC

    os_disk {
        caching              = "ReadWrite"                                  # Disk caching type
        storage_account_type = var.os_disk_storage_account_type             # Storage account type for OS disk
        name                 = "${var.vm_name}-osdisk-${count.index}"       # OS disk name with index
    }

    source_image_reference {
        publisher = var.image_publisher                                     # Image publisher
        offer     = var.image_offer                                         # Image offer
        sku       = var.image_sku                                           # Image SKU
        version   = var.image_version                                       # Image version
    }

    computer_name      = "${var.vm_name}-${count.index}"                  # Computer name
    provision_vm_agent = true                                             # Enable VM agent
    tags               = var.tags                                         # Resource tags
}
