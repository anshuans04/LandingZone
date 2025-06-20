module "resource_group" {
  source                      = "../../modules/resource_group"
  landingZone_resource_groups = var.landingZone_resource_groups_parent

}

module "resource_netwroking" {
  depends_on       = [module.resource_group]
  source           = "../../modules/networking"
  landingVarModule = var.landingZone_networking

}

module "pip" {
  depends_on    = [module.resource_group, module.resource_netwroking]
  source        = "../../modules/pip"
  landingPIPvar = var.landingZone_PIPparent
}

module "nic" {
  depends_on    = [module.resource_netwroking, module.pip]
  source        = "../../modules/nic"
  landingNICvar = var.landingZone_NICparent
}

module "vm" {
  depends_on    = [module.nic]
  source        = "../../modules/vm"
  landingVMvar  = var.landingZone_VMparent
  nicvarModule = module.nic.nic_ids
  
}

module "nsg" {
  depends_on    = [module.nic]
  source        = "../../modules/nsg"
  landing_nsg   = var.landingZone_NSGparent
}

module "nsg_assoc" {
  depends_on     = [module.nic, module.nsg]
  source         = "../../modules/nsg_assoc"
  nic_ids        = module.nic.nic_ids
  nsg_ids        = module.nsg.nsg_ids

  # 🔁 Key matching: which NIC gets which NSG
  nic_nsg_map = {
    nic1 = "nsg1"
    nic2 = "nsg2"
  }
}
