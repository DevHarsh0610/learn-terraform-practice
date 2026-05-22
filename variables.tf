variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "address_space" {
  type = list(string)
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
}
variable "vm_name" {
  type = string
}
variable "admin_username" {
  type = string
}
variable "vm_count" {
  type = number
}
variable "vm_private_nic_name" {
  type = string
}
variable "public_lb_ip" {
  type = string
}
variable "lb_name" {
  type = string
}
variable "lb_location" {
  type = string
}
variable "lb_public_ip_name" {
  type = string
}
