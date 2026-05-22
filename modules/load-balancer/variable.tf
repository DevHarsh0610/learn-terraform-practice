variable "resource_group_name" {
  type = string
}
variable "lb_location" {
  type = string
}
variable "lb_name" {
  type = string
}
variable "lb_public_ip" {
  type = string
}
variable "lb_public_ip_name" {
  type = string
}
variable "vm_count" {
  type = number
}
variable "network_interface_id" {
  type = list(string)
}