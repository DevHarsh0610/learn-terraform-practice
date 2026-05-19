resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.frontend_subnet_address
}

resource "azurerm_network_security_group" "frontend_nsg" {
  name                = var.frontend_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet_network_security_group_association" "frontend_nsg_association" {
  subnet_id                 = azurerm_subnet.frontend_subnet.id
  network_security_group_id = azurerm_network_security_group.frontend_nsg.id
}
resource "azurerm_network_security_rule" "allowHttp" {
  name                        = "allowHttp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "${var.my_ip}/32"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.frontend_nsg.name
}
resource "azurerm_network_security_rule" "allowSSH" {
  name                        = "allowSSH"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${var.my_ip}/32"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.frontend_nsg.name
}

resource "azurerm_subnet" "backend_subnet" {
  name                 = var.backend_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.backend_subnet_address
}
resource "azurerm_network_security_group" "backend_nsg" {
  name                = var.backend_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet_network_security_group_association" "backend_nsg_association" {
  subnet_id                 = azurerm_subnet.backend_subnet.id
  network_security_group_id = azurerm_network_security_group.backend_nsg.id
}
resource "azurerm_public_ip" "project_2_pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku = "Standard"

  allocation_method = "Static"

}
resource "azurerm_network_interface" "public_nic" {
  name                = var.public_nic_name
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.project_2_pip.id
  }
}
