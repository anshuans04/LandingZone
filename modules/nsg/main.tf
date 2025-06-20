resource "azurerm_network_security_group" "landing_nsg" {
    for_each = var.landing_nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_name

  security_rule {
    name                       = each.value.security.name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


output "nsg_ids" {
  value = {
    for k, nsg in azurerm_network_security_group.landing_nsg : k => nsg.id
  }
}


