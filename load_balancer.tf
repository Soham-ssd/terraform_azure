# Define an internal load balancer
resource "azurerm_lb" "lb_main" {
  name                = "main-lb"
  location            = azurerm_resource_group.rg_main.location
  resource_group_name = azurerm_resource_group.rg_main.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "main-frontend"
    subnet_id                     = azurerm_subnet.subnet_main.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
  }

  backend_address_pool {
    name = "main-bepool"
  }
}

# Health probe for SQL
resource "azurerm_lb_probe" "lb_probe_sql" {
  name                = "mssql-probe"
  resource_group_name = azurerm_resource_group.rg_main.name
  loadbalancer_id     = azurerm_lb.lb_main.id
  protocol            = "Tcp"
  port                = 1433
  interval_in_seconds = 5
  number_of_probes    = 2
}

# Load balancing rule
resource "azurerm_lb_rule" "lb_rule_sql" {
  name                           = "sql-rule"
  resource_group_name            = azurerm_resource_group.rg_main.name
  loadbalancer_id                = azurerm_lb.lb_main.id
  protocol                       = "Tcp"
  frontend_port                  = 1433
  backend_port                   = 1433
  frontend_ip_configuration_name = azurerm_lb.lb_main.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb.lb_main.backend_address_pool[0].id
  probe_id                       = azurerm_lb_probe.lb_probe_sql.id
}

# Associate NIC with backend address pool
resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_assoc" {
  network_interface_id    = azurerm_network_interface.nic_main.id
  ip_configuration_name   = azurerm_network_interface.nic_main.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb.lb_main.backend_address_pool[0].id
}
