output "frontend_subnet_id" {

  value = azurerm_subnet.frontend_subnet.id
}

output "frontend_nsg_id" {

  value = azurerm_network_security_group.frontend_nsg.id
}
output "backend_subnet_id" {
  value = azurerm_subnet.backend_subnet.id
}
output "backend_nsg_id" {
  value = azurerm_network_security_group.backend_nsg.id
}
output "frontend_nic_id" {
  value = azurerm_network_interface.public_nic.id
}
output "vm_public_ip"{
  value = azurerm_public_ip.project_2_pip.ip_address
}
