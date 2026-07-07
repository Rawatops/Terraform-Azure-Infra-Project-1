resource "azurerm_resource_group" "rgs"{
    for_each=var.rg_details
    name=each.key
    location=each.value.location
    managed_by=each.value.managed_by
    tags=each.value.tags
}