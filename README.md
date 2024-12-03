# tf-az-module-azure-bastion-host
Terraform module that creates/manages an Azure Bastion Host.


Manages a Bastion Host.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#example-usage)

This example deploys an Azure Bastion Host Instance to a target virtual network.

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "examplevnet" address_space = ["192.168.1.0/24"] location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_subnet" "example" { name = "AzureBastionSubnet" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["192.168.1.224/27"] } resource "azurerm_public_ip" "example" { name = "examplepip" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name allocation_method = "Static" sku = "Standard" } resource "azurerm_bastion_host" "example" { name = "examplebastion" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name ip_configuration { name = "configuration" subnet_id = azurerm_subnet.example.id public_ip_address_id = azurerm_public_ip.example.id } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#name-2) - (Required) Specifies the name of the Bastion Host. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#resource_group_name-2) - (Required) The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#location-2) - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. Review [Azure Bastion Host FAQ](https://docs.microsoft.com/azure/bastion/bastion-faq) for supported locations.
    
-   [`copy_paste_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#copy_paste_enabled-1) - (Optional) Is Copy/Paste feature enabled for the Bastion Host. Defaults to `true`.
    
-   [`file_copy_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#file_copy_enabled-1) - (Optional) Is File Copy feature enabled for the Bastion Host. Defaults to `false`.
    

-   [`sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#sku-1) - (Optional) The SKU of the Bastion Host. Accepted values are `Developer`, `Basic`, `Standard` and `Premium`. Defaults to `Basic`.

-   [`ip_configuration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#ip_configuration-1) - (Optional) A `ip_configuration` block as defined below. Changing this forces a new resource to be created.
    
-   [`ip_connect_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#ip_connect_enabled-1) - (Optional) Is IP Connect feature enabled for the Bastion Host. Defaults to `false`.
    

-   [`kerberos_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#kerberos_enabled-1) - (Optional) Is Kerberos authentication feature enabled for the Bastion Host. Defaults to `false`.

-   [`scale_units`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#scale_units-1) - (Optional) The number of scale units with which to provision the Bastion Host. Possible values are between `2` and `50`. Defaults to `2`.

-   [`shareable_link_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#shareable_link_enabled-1) - (Optional) Is Shareable Link feature enabled for the Bastion Host. Defaults to `false`.

-   [`tunneling_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#tunneling_enabled-1) - (Optional) Is Tunneling feature enabled for the Bastion Host. Defaults to `false`.

-   [`session_recording_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#session_recording_enabled-1) - (Optional) Is Session Recording feature enabled for the Bastion Host. Defaults to `false`.

-   [`virtual_network_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#virtual_network_id-1) - (Optional) The ID of the Virtual Network for the Developer Bastion Host. Changing this forces a new resource to be created.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#tags-2) - (Optional) A mapping of tags to assign to the resource.
    
-   [`zones`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#zones-1) - (Optional) Specifies a list of Availability Zones in which this Public Bastion Host should be located. Changing this forces a new resource to be created.
    

___

A `ip_configuration` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#name-3) - (Required) The name of the IP configuration. Changing this forces a new resource to be created.
    
-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#subnet_id-1) - (Required) Reference to a subnet in which this Bastion Host has been created. Changing this forces a new resource to be created.
    

-   [`public_ip_address_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#public_ip_address_id-1) - (Required) Reference to a Public IP Address to associate with this Bastion Host. Changing this forces a new resource to be created.

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#id-2) - The ID of the Bastion Host.
    
-   [`dns_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#dns_name-1) - The FQDN for the Bastion Host.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#create-2) - (Defaults to 30 minutes) Used when creating the Bastion Host.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#update-2) - (Defaults to 30 minutes) Used when updating the Bastion Host.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#read-2) - (Defaults to 5 minutes) Used when retrieving the Bastion Host.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#delete-2) - (Defaults to 30 minutes) Used when deleting the Bastion Host.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/disk_encryption_set#import)

Bastion Hosts can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_bastion_host.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/bastionHosts/instance1
```