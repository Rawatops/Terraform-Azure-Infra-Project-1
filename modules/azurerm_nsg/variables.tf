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

variable "nsgToSubnet" {
  type = map(object({
  subnet_name                = string
  network_security_group_name = string
  }))
}

variable "subnet_output" {
  type = any
}