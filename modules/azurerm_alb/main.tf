resource "azurerm_public_ip" "azlb_publicip" {
  for_each = var.azpublicip
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}
resource "azurerm_lb" "alb" {
  for_each = var.azure_lbs
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku = each.value.sku
  dynamic frontend_ip_configuration {
    for_each = var.frontend_ip_config
    content {
    name                 = frontend_ip_configuration.key
    public_ip_address_id = azurerm_public_ip.azlb_publicip[frontend_ip_configuration.value.public_ip_key].id
    }
    
  }
}

resource "azurerm_lb_backend_address_pool" "bpool" {
  for_each = var.backend_pools
  loadbalancer_id = azurerm_lb.alb[each.value.alb_name].id
  name            = each.value.name
}

resource "azurerm_lb_probe" "alb-health-probe" {
  for_each = var.health_probe
  loadbalancer_id = azurerm_lb.alb[each.value.loadbalancer_name].id
  name            = each.value.name
  port            = each.value.port
  request_path = each.value.request_path
  protocol = each.value.protocol
}

resource "azurerm_lb_nat_rule" "nat-rule" {
  for_each = var.nat-rules
  resource_group_name            =  each.value.resource_group_name
  loadbalancer_id                = azurerm_lb.alb[each.value.loadbalancer_name].id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port_start            = each.value.frontend_port_start
  frontend_port_end              = each.value.frontend_port_end
  backend_port                   = each.value.backend_port
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpool[each.value.backend_pool_name].id
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
}

resource "azurerm_lb_rule" "lb-rules" {
  for_each = var.alb-rules
  loadbalancer_id                = azurerm_lb.alb[each.value.loadbalancer_name].id
  name                           = each.value.name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
}