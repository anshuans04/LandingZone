resource "azurerm_network_interface" "landing_nic" {
  for_each = var.landingNICvar
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_name

  ip_configuration {
    name                          = each.value.ip_configuration.ipConfig
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id
  }
}

# output "nic_ids" {
#   description = "List of NIC resource IDs created by the NIC module"
#   value       = [for nic in azurerm_network_interface.landing_nic : nic.id]
# }

output "nic_ids" {
  description = "Map of NIC keys to their IDs"
  value = {
    for key, nic in azurerm_network_interface.landing_nic : key => nic.id
  }
}

