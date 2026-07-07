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

variable "subnet_output" {
  type = any
}

variable "backend_pool_ids" {
  type = map(string)
}