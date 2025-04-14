# Define a network security group
resource "azurerm_network_security_group" "nsg_main" {
  name                = "main-nsg"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
}

# Associate the network security group with the subnet
resource "azurerm_subnet_network_security_group_association" "nsg_association_main" {
  subnet_id                 = azurerm_subnet.subnet_main.id
  network_security_group_id = azurerm_network_security_group.nsg_main.id
}
