resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B2ats_v2"
  admin_username      = var.admin_username
  network_interface_ids = [
    var.network_interface_ids[count.index]
  ]
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("${pathexpand("~/.ssh/id_ed25519.pub")}")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}./../../scripts/init.sh")
}
