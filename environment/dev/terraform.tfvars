landingZone_resource_groups_parent = {
  rg1 = {
    resource_name = "landing-rg-dev"
    location      = "brazilsouth"
  }
}

landingZone_networking = {
  vnet1 = {
    vnet_name     = "landingZone-vnet-dev"
    resource_name = "landing-rg-dev"
    location      = "brazilsouth"
    address_space = ["10.0.0.0/16"]
    Dynamic_subnets = {
      frontend_subnet = {
        address_prefix = ["10.0.0.0/24"]
      }
      backend_subnet = {
        address_prefix = ["10.0.1.0/24"]
      }
    }
  }
  
}

landingZone_PIPparent = {
  pip1 = {
    pip_name      = "landing-pip-dev-frontend"
    resource_name = "landing-rg-dev"
    location      = "brazilsouth"
  }
  pip2 = {
    pip_name      = "landing-pip-dev-backend"
    resource_name = "landing-rg-dev"
    location      = "brazilsouth"
  }
}


landingZone_NICparent = {
  "nic1" = {
    nic_name       = "nic-frontend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    subnet_name    = "frontend_subnet"
    vnet_name      = "landingZone-vnet-dev"
    public_ip_name = "landing-pip-dev-frontend"

    ip_configuration = {
      ipConfig = "ipconfig-frontend"
    }
  }

  "nic2" = {
    nic_name       = "nic-backend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    subnet_name    = "backend_subnet"
    vnet_name      = "landingZone-vnet-dev"
    public_ip_name = "landing-pip-dev-backend"

    ip_configuration = {
      ipConfig = "ipconfig-backend"
    }
  }
}

landingZone_VMparent = {
  vm1 = {
    vm_name ="vm-frontend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    vm_size       = "Standard_B1s"
    nic_index = 0
    os_disk = {
      caching           = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }

  vm2 = {
    vm_name ="vm-backend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    vm_size       = "Standard_B1s"
    nic_index = 1
    os_disk = {
      caching           = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  }
}

landingZone_NSGparent = {
  nsg1 = {
    nsg_name          = "nsg-frontend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    security = {
      name = "Allow-SSH"
    }
  }

  nsg2 = {
    nsg_name          = "nsg-backend"
    resource_name  = "landing-rg-dev"
    location       = "brazilsouth"
    security = {
      name = "Allow-SSH"
    }
  }
}
