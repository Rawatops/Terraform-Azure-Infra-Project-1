output "autoscale-output" {
  value = {
    for k,v in azurerm_monitor_autoscale_setting.vmss_autoscale : k => v.id
  }
}