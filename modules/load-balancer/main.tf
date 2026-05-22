resource "azurerm_lb" "main_lb" {
  name                = var.lb_name
  location            = var.lb_location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.lb_public_ip_name
    public_ip_address_id = var.lb_public_ip
  }
}
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "${var.lb_name}-backend-pool"
  loadbalancer_id = azurerm_lb.main_lb.id
}
resource "azurerm_lb_probe" "http_probe" {
  name            = "${var.lb_name}-probe"
  loadbalancer_id = azurerm_lb.main_lb.id
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.main_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.lb_public_ip_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.http_probe.id
}
resource "azurerm_network_interface_backend_address_pool_association" "nic_pool_association" {
  count                   = var.vm_count
  network_interface_id    = var.network_interface_id[count.index]
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}
