resource "azurerm_virtual_network" "landingZone-vnet" {
    for_each = var.landingVarModule
    name = each.value.vnet_name
    resource_group_name =each.value.resource_name
    location = each.value.location
    address_space = each.value.address_space

    dynamic "subnet" {
        for_each = contains(keys(each.value), "Dynamic_subnets") ? each.value.Dynamic_subnets : {}
    content {
      name           = subnet.key
      address_prefixes = subnet.value.address_prefix
    }
      
    }
  
}