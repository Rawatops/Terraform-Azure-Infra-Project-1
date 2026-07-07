variable "rg_details"{
 type=map(object({
    location=string
    managed_by=string
    tags=map(string)
 }))
}

variable "vnet_details" {
  type = map(object({
  location            = string
  resource_group_name = string
  address_space       = list(string)

  tags = map(string)
  }))
}

variable "subnet_details" {
  type = map(object({
  resource_group_name  = string
  virtual_network_name = string
  address_prefixes     =list(string)
  }))
}


variable "nsg_info" {
  type = map(object({
    location=string
    resource_group_name=string
    security_rule=list(object({
      name = string
      priority=number
      direction=string
      access=string
      protocol=string
      source_port_range=string
      destination_port_range=string
      source_address_prefix=string
      destination_address_prefix=string
    }))
    tags=map(string)
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
variable "frontend_ip_config" {
  type = any
}
variable "publicips" {
  type = map(object({
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}


variable "azure_lbs" {
  type = map(object({
  location            = string
  resource_group_name = string
  sku=string
  }))
}


variable "backend_pools" {
  type = map(object({
  alb_name=string
  name            = string
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
 
variable "nat-gateway" {
  type = map(object({
  location                = string
  resource_group_name     = string
  sku_name                = string
  idle_timeout_in_minutes = number
  zones                   = list(string)
  }))
}

variable "nat_gateway_association" {
  type = map(object({
  subnet_name      = string
  nat_gateway_name = string
  }))
}

variable "nat_gateway_pip" {
  type = map(object({
    natGateway_name = string
    public_ip_name=string
  }))
}
variable "nsgToSubnet" {
  type = map(object({
  subnet_name                = string
  network_security_group_name = string
  }))
}


variable "vmssdetails" {
  type = map(object({
    location = string
    resource_group_name = string
    instances = number
    platform_fault_domain_count = number
    sku_name = string
    zones= list(string)
    admin_username= string
    admin_password= string
    subnet_name=string
    backendpoolnamerule=string
  }))
}


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