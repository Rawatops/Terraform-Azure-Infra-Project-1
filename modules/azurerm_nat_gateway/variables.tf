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

variable "subnet_output" {
  type = any
}

variable "nat_gateway_pip" {
  type = map(object({
    natGateway_name = string
    public_ip_name=string
  }))
}

variable "nat_public_ip" {
  type = any
}