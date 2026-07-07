resource "azurerm_monitor_autoscale_setting" "vmss_autoscale" {
  for_each = var.autoscale_settings
  name = "autoscale-${each.key}"
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  target_resource_id = var.target_resource_id[each.value.VmssName_resource_id]
  profile {
    name = "default"
    capacity {
      minimum = each.value.min_capacity
      default = each.value.default_capacity
      maximum = each.value.max_capacity
    }
    dynamic "rule" {
      for_each = each.value.rule
      content {
        metric_trigger {
          metric_name = rule.value.metric_name
          metric_resource_id = var.target_resource_id[each.value.VmssName_resource_id]
          time_grain = rule.value.time_grain
          statistic = rule.value.statistic
          time_window = rule.value.time_window
          time_aggregation = rule.value.time_aggregation
          operator = rule.value.operator
          threshold = rule.value.threshold
        }
        scale_action {
          direction = rule.value.direction
          type = "ChangeCount"
          value = rule.value.change_count
          cooldown = rule.value.cooldown
        }
      }
    }
  }
  
}