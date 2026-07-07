variable "publicips" {
  type = map(object({
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}