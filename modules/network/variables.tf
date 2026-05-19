variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
variable "address_space" {
  type = list(string)
}

variable "vnet_name" {
  type = string
}
variable "frontend_subnet_name" {
  type = string
}
variable "frontend_subnet_address" {
  type = list(string)
}
variable "frontend_nsg_name" {
  type = string
}
variable "backend_subnet_name" {
  type = string
}
variable "backend_subnet_address" {
  type = list(string)
}
variable "backend_nsg_name" {
  type = string
}
variable "public_ip_name" {
  type = string
}
variable "public_nic_name" {
  type = string
}
variable "my_ip" {
  type = string
}
