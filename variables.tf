# variable file for Azure Bastion Host module

variable "name" {
  description = "Specifies the name of the Bastion Host. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. Review Azure Bastion Host FAQ for supported locations."
  type        = string
}

variable "copy_paste_enabled" {
  description = "Is Copy/Paste feature enabled for the Bastion Host. Defaults to true."
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "Is File Copy feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "sku" {
    description = "(Optional) The SKU of the Bastion Host. Accepted values are Basic and Standard. Defaults to Basic."
    type = string
    default = "Basic"
}

variable "ip_configuration" {
    description = "(Required) A ip_configuration block as defined below. Changing this forces a new resource to be created."
    type = list(object({
        name = string
        subnet_id = string
        public_ip_address_id = string
    }))
}
  
variable "ip_connect_enabled" {
    description = "(Optional) Is IP Connect feature enabled for the Bastion Host. Defaults to false."
    type = bool
    default = false
}

variable "scale_units" {
    description = "(Optional) The number of scale units with which to provision the Bastion Host. Possible values are between 2 and 50. Defaults to 2."
    type = number
    default = 2
}

variable "shareable_link_enabled" {
    description = "(Optional) Is Shareable Link feature enabled for the Bastion Host. Defaults to false."
    type = bool
    default = false
}

variable "tunneling_enabled" {
    description = "(Optional) Is Tunneling feature enabled for the Bastion Host. Defaults to false."
    type = bool
    default = false
}

variable "tags" {
    description = "(Optional) A mapping of tags to assign to the resource."
    type = map(string)
    default = {}
}



