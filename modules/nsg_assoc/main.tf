resource "azurerm_network_interface_security_group_association" "attach" {
  for_each = var.nic_nsg_map

  network_interface_id      = var.nic_ids[each.key]
  network_security_group_id = var.nsg_ids[each.value]
}