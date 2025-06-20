resource "azurerm_public_ip" "landing-pip" {
    for_each = var.landingPIPvar
  name                = each.value.pip_name
  resource_group_name = each.value.resource_name
  location            = each.value.location
  allocation_method   = "Static"
}