output "rg_created" {
  value = module.rg_module.rg-output
}


output "vnet_created" {
  value = module.vnet_module.vnet-output
}

output "subnet_created" {
  value = module.subnet_module.subnet-output
}

output "nsg_created" {
  value = module.nsg_module.nsg-output
}

output "pip-created" {
  value = module.pip_module.Publicip-output
}

output "nat_gateway_output" {
  value = module.natgateway_module.nat_gateway_id-output
}
