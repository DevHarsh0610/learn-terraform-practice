terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate9101"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source                  = "./modules/resource-groups"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}
module "network" {
  vm_count                = var.vm_count
  source                  = "./modules/network"
  resource_group_name     = module.resource_group.resource_group_name
  location                = module.resource_group.resource_group_location
  vnet_name               = var.vnet_name
  address_space           = var.address_space
  frontend_subnet_name    = var.frontend_subnet_name
  frontend_subnet_address = var.frontend_subnet_address
  frontend_nsg_name       = var.frontend_nsg_name
  backend_subnet_name     = var.backend_subnet_name
  backend_subnet_address  = var.backend_subnet_address
  backend_nsg_name        = var.backend_nsg_name
  public_ip_name          = var.public_ip_name
  vm_private_nic_name     = var.vm_private_nic_name
  lb_public_ip_name       = var.lb_public_ip_name
  my_ip                   = var.my_ip
}
module "vm" {
  source                = "./modules/vm"
  vm_name               = var.vm_name
  vm_count              = var.vm_count
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  admin_username        = var.admin_username
  network_interface_ids = module.network.vm_nics_id
}
module "lb" {
  source               = "./modules/load-balancer"
  vm_count             = var.vm_count
  network_interface_id = module.network.vm_nics_id
  resource_group_name  = var.resource_group_name
  lb_name              = var.lb_name
  lb_location          = var.lb_location
  lb_public_ip_name    = var.lb_public_ip_name
  lb_public_ip         = module.network.lb_public_ip
}
