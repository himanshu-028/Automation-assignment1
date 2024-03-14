locals {
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Himanshu.Thakur"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


module "rgroup-n01495748" {
  source   = "./modules/rgroup-N01495748"
  resource_group_name = "N01495748-RG"
  location = "Canada Central" 
  common_tags = local.tags 
}

module "network-n01495748" {
  source       = "./modules/network-n01495748"
  location     = module.rgroup-n01495748.resource_group.location
  resource_group_name =  module.rgroup-n01495748.resource_group.name
  virtual_network_name = "N01495748-VNET"
  address_space        = ["10.0.0.0/16"]
  subnet_name         = "N01495748-SUBNET"
  subnet_address_prefixes = ["10.0.0.0/24"]
  nsg_name            = "N01495748-NSG"
  common_tags = local.tags 
}

module "common-services-n01495748" {
  source             = "./modules/common-n01495748"
  location     = module.rgroup-n01495748.resource_group.location
  resource_group_name =  module.rgroup-n01495748.resource_group.name
  workspace_name = "N01495748-WORKSPACE"
  recovery_vault_name = "N01495748-RECOVERYVAULT"
  storage_account_name = "n01495748storage"
  common_tags = local.tags 
}

module "vmlinux-n01495748" {
  source                = "./modules/vmlinux-n01495748"
  location     = module.rgroup-n01495748.resource_group.location
  resource_group_name =  module.rgroup-n01495748.resource_group.name
  subnet_id           = module.network-n01495748.subnet.id
  linux_avs = "N01495748-linuxavs"
  storage_account_uri =module.common-services-n01495748.storage_account-primary_blob_endpoint
  common_tags = local.tags 

}

module "vmwindows-n01495748" {
  source              = "./modules/vmwindows-n01495748"
  windows_avs = "windowsAvailabilitySet"
  location     = module.rgroup-n01495748.resource_group.location
  resource_group_name =  module.rgroup-n01495748.resource_group.name
  subnet_id           = module.network-n01495748.subnet.id
  nb_count =  1
  common_tags = local.tags

}


module "datadisk-n01495748" {
  source              = "./modules/datadisk-n01495748"
  linux_vm_ids        = values(module.vmlinux-n01495748.linux_vm_ids)
  windows_vm_id       = module.vmwindows-n01495748.vm_ids
  location     = module.rgroup-n01495748.resource_group.location
  resource_group_name =  module.rgroup-n01495748.resource_group.name
  linux-vms = module.vmlinux-n01495748.linux_vm_hostnames
  windows-vms = module.vmwindows-n01495748.vm_hostname_windows
  common_tags = local.tags
}


module "loadbalancer-n01495748" {
  source                = "./modules/loadbalancer-n01495748"
  location              = module.rgroup-n01495748.resource_group.location
  resource_group_name   = module.rgroup-n01495748.resource_group.name
  loadbalancer-name     = "N01495748-LOADBALANCER"
  linux-nic-id          = module.vmlinux-n01495748.linux_nic_ids
  common_tags                  = local.tags
  linux-vm-name   = module.vmlinux-n01495748.linux_vm_hostnames

  
}
module "database-n01495748" {
  source      = "./modules/database-n01495748"
 location              = module.rgroup-n01495748.resource_group.location
  resource_group_name   = module.rgroup-n01495748.resource_group.name
  db_name = "N01495748-DATABASE"
  common_tags = local.tags
}


