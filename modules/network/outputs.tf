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
