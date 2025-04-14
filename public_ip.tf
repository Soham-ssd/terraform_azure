# Define a public IP address
resource "azurerm_public_ip" "pip_main" {
  name                = "main-pip"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
  allocation_method   = "Static"
}
