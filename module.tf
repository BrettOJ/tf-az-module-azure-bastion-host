# module file for Azure Bastion Host module base on the variables.tf file

resource "azurerm_bastion_host" "bastion" {
    name                = module.bastion_name.naming_convention_output[var.naming_convention_info.name].names.0
    resource_group_name = var.resource_group_name
    location            = var.location
    sku                 = var.sku
    ip_configuration    = var.ip_configuration
    scale_units         = var.scale_units
    tags                = var.tags
    
    copy_paste_enabled     = var.copy_paste_enabled
    file_copy_enabled      = var.file_copy_enabled
    ip_connect_enabled     = var.ip_connect_enabled
    shareable_link_enabled = var.shareable_link_enabled
    tunneling_enabled      = var.tunneling_enabled


}

