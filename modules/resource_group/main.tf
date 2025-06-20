resource "azurerm_resource_group" "landingZone-rg" {
    for_each = var.landingZone_resource_groups
    name = each.value.resource_name
    location = each.value.location
  
}