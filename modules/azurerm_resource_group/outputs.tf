output "rg-output" {
  value = {
    for i , key in azurerm_resource_group.rgs :
    i=> {
        name=key
        location=key.location
        manged_by=key.managed_by
        tags=key.tags    
    }
  }
}