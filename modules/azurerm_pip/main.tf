resource "azurerm_public_ip" "publicip" {
  for_each = var.publicips
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}
