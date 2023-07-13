resource "azurerm_virtual_network" "main_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr
  location            = var.location
  dns_servers         = var.dns_servers
  tags                = var.tags
}

