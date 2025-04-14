# Define a network security group
resource "azurerm_network_security_group" "nsg_main" {
  name                = "main-nsg"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
}
