output "vnet-output" {
  value = {
    for i , key in azurerm_virtual_network.vnet :
    i=> {
    name=key
    location            = key.location
    resource_group_name = key.resource_group_name
    address_space       = key.address_space
    tags = key.tags
    }
  }
}