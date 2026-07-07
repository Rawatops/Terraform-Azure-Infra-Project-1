resource "azurerm_orchestrated_virtual_machine_scale_set" "vmss" {
  for_each = var.vmssdetails
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  instances = each.value.instances
  platform_fault_domain_count = each.value.platform_fault_domain_count
  sku_name                    = each.value.sku_name
  
  zones = each.value.zones
  os_profile {
    linux_configuration {
      admin_username = each.value.admin_username
      admin_password = each.value.admin_password
      disable_password_authentication = false
    }

  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
  }
  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
  network_interface {
    name = "nic-${each.key}"
    primary = true
    ip_configuration {
      name = "internal"
      primary = true
      subnet_id = var.subnet_output[each.value.subnet_name].id
      load_balancer_backend_address_pool_ids = [
        var.backend_pool_ids[each.value.backendpoolnamerule]
      ]
    }
  }
}