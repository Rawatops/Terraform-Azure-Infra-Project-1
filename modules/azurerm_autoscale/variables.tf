variable "autoscale_settings" {
  type = map(object({
     resource_group_name=string
     location=string
     VmssName_resource_id=string
     min_capacity=number
     default_capacity=number
     max_capacity=number

     rule=list(object({
       metric_name = string
       time_grain = string
       statistic = string
       time_window=string
       time_aggregation=string
       operator=string
       threshold=number
       direction=string
       change_count=string
       cooldown=string
     }))
  }))
}

variable "target_resource_id" {
  type = any
}