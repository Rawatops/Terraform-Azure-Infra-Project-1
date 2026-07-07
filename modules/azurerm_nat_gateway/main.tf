resource "azurerm_nat_gateway" "natgateway" { 
  for_each = var.nat-gateway
  name                    = each.key
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  zones                   = each.value.zones
}

resource "azurerm_subnet_nat_gateway_association" "nat_gateway_association" {
  for_each = var.nat_gateway_association
  subnet_id      = var.subnet_output[each.value.subnet_name].id
  nat_gateway_id = azurerm_nat_gateway.natgateway[each.value.nat_gateway_name].id
}

resource "azurerm_nat_gateway_public_ip_association" "natgateway-to-publicip" {
  for_each = var.nat_gateway_pip
  nat_gateway_id       = azurerm_nat_gateway.natgateway[each.value.natGateway_name].id
  public_ip_address_id = var.nat_public_ip[each.value.public_ip_name].public_ip_ids
}