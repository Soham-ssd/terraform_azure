# Define a resource group
resource "azurerm_resource_group" "rg_main" {
  name     = "main-resources"
  location = "East US"
}
