variable "azure_lbs" {
  type = map(object({
  location            = string
  resource_group_name = string
  sku = string
  }))
}

variable "backend_pools" {
  type = map(object({
  alb_name=string
  name            = string
  }))
 
}

variable "azpublicip" {
  type = map(object({
    location            = string
    resource_group_name = string
    allocation_method   = string
    load_balancer_name=string
  }))
}

variable "health_probe" {
  type = map(object({
  loadbalancer_name = string
  name            = string
  port            = number
  request_path = string
  protocol = string
  }))
}


variable "nat-rules" {
  type = map(object({
  resource_group_name            = string
  loadbalancer_name                = string
  name                           = string
  protocol                       = string
  frontend_port_start            = number
  frontend_port_end              = number
  backend_port                   = number
  backend_pool_name        = string
  frontend_ip_configuration_name = string
  }))
}

variable "frontend_ip_config" {
  type = any
}

variable "alb-rules" {
  type = map(object({
  loadbalancer_name           = string
  name                           = string
  protocol                       = string
  frontend_port                  = number
  backend_port                   = number
  frontend_ip_configuration_name = string
  }))
}