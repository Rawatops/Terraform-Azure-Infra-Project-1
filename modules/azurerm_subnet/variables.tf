variable "subnet_details" {
  type = map(object({
  resource_group_name  = string
  virtual_network_name = string
  address_prefixes     =list(string)
  }))
}

