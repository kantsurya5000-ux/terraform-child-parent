module "resource_group" {
  source              = "../../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "networking" {
  source                  = "../../modules/networking"
  resource_group_name     = module.resource_group.resource_group_name
  location                = module.resource_group.resource_group_location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "compute" {
  source              = "../../modules/compute"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  vm_name             = var.vm_name
  subnet_id           = module.networking.subnet_id
  admin_username      = var.admin_username
}

module "storage" {
  source               = "../../modules/storage"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  storage_account_name = var.storage_account_name
}
