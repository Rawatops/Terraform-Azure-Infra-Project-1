variable "vnet_details" {
  type = map(object({
  location            = string
  resource_group_name = string
  address_space       = list(string)
  tags = map(string)
  }))
}