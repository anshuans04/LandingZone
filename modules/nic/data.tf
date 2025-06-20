data "azurerm_subnet" "subnet_data" {
  for_each = var.landingNICvar

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_name
}

data "azurerm_public_ip" "pip_data" {
  for_each = var.landingNICvar

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_name
}