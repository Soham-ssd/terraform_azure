# Define a virtual machine
resource "azurerm_windows_virtual_machine" "vm_main" {
  name                = "main-vm"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
  network_interface_ids = [azurerm_network_interface.nic_main.id]
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"
  zone                = "1"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name      = "main-vm_disk1_c8ba0cdcced042e2b174e97f0cf84246"

  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
