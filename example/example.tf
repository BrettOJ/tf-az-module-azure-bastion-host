resource "azurerm_resource_group" "bastion-test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "bastion-test" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.bastion-test.location
  resource_group_name = azurerm_resource_group.bastion-test.name
}

resource "azurerm_subnet" "bastion-test" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.bastion-test.name
  virtual_network_name = azurerm_virtual_network.bastion-test.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_public_ip" "bastion-test" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.bastion-test.location
  resource_group_name = azurerm_resource_group.bastion-test.name
  allocation_method   = var.public_ip_address_allocation
  sku                 = var.public_ip_address_sku
}

module "azure_bastion_host" {
  source = "git::https://github.com/BrettOJ/tf-az-module-azure-bastion-host"
  location            = azurerm_resource_group.bastion-test.location
  resource_group_name = azurerm_resource_group.bastion-test.name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = azurerm_subnet.bastion-test.id
    public_ip_address_id = azurerm_public_ip.bastion-test.id
  }
}