# Define a security rule to allow RDP access
resource "azurerm_network_security_rule" "rdp_rule" {
  name                        = "allow-rdp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.nsg_main.name
  resource_group_name         = azurerm_resource_group.rg_main.name
}
