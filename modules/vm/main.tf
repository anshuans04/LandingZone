resource "azurerm_linux_virtual_machine" "landing-vm" {
    for_each = var.landingVMvar
  name                = each.value.vm_name
  resource_group_name = each.value.resource_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = "adminuser"
  admin_password = "Password1234!"
  disable_password_authentication = false # Use a secure password or consider using SSH keys instead
  # network_interface_ids = [var.nicvarModule[each.value.nic_index]]

  network_interface_ids = [var.nicvarModule[local.index_to_key[each.value.nic_index]]]
  

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
}
}

locals {
  index_to_key = {
    0 = "nic1"
    1 = "nic2"
  }
}