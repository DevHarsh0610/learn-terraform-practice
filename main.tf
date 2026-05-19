terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
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
}
