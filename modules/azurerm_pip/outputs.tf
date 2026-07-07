output "Publicip-output" {
  value = {
    for i, key in azurerm_public_ip.publicip :
    i=> {
        name=key
        location            = key.location
        resource_group_name = key.resource_group_name
        allocation_method   = key.allocation_method 
        public_ip_ids = key.id
    }
  }
}