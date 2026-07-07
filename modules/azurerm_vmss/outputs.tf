output "vmss_ids-output" {
  value = {
    for k , v in azurerm_orchestrated_virtual_machine_scale_set.vmss: k => v.id
  }
}