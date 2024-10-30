
resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                 = var.vmssname
  resource_group_name  = var.rgname
  location             = var.location
  sku                  = "Standard_F2"
  instances            = 2
  admin_username       = "tfadminuser"

  admin_ssh_key {
    username   = "tfadminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "StandardSSD_ZRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-vmss"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}