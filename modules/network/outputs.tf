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
output "vm_nics_id" {
  value = azurerm_network_interface.vm_nics[*].id
}
output "lb_public_ip" {
  value = azurerm_public_ip.lb_public_ip.id
}

output "lb_public_ip_address" {
  value = azurerm_public_ip.lb_public_ip.ip_address
}
