# Define a subnet
resource "azurerm_subnet" "subnet_main" {
  name                 = "main-subnet"
  resource_group_name  = azurerm_resource_group.rg_main.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = ["10.0.1.0/24"]
}
