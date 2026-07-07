module "rg_module"{
    source="./modules/azurerm_resource_group"
    rg_details=var.rg_details
}

module "vnet_module" {
  depends_on = [ module.rg_module ]
  source = "./modules/azurerm_virtual_network"
  vnet_details = var.vnet_details
}

module "subnet_module" {
  depends_on = [ module.vnet_module ]
  source = "./modules/azurerm_subnet"
  subnet_details = var.subnet_details
}

module "nsg_module" {
  depends_on = [ module.subnet_module ]
  source = "./modules/azurerm_nsg"
  nsg_info = var.nsg_info
  subnet_output = module.subnet_module.subnet-output
  nsgToSubnet = var.nsgToSubnet
}

module "pip_module" {
  depends_on = [ module.rg_module ]
  source = "./modules/azurerm_pip"
  publicips = var.publicips
}

module "azure_alb" {
  depends_on = [ module.rg_module ]
  source = "./modules/azurerm_alb"
  azure_lbs = var.azure_lbs
  azpublicip = var.azpublicip
  backend_pools = var.backend_pools
  health_probe = var.health_probe
  nat-rules = var.nat-rules
  frontend_ip_config = var.frontend_ip_config
  alb-rules=var.alb-rules
}

module "natgateway_module" {
  depends_on = [ module.pip_module,module.subnet_module ]
  source = "./modules/azurerm_nat_gateway"
  nat-gateway = var.nat-gateway
  nat_gateway_association = var.nat_gateway_association
  subnet_output=module.subnet_module.subnet-output
  nat_gateway_pip=var.nat_gateway_pip
  nat_public_ip=module.pip_module.Publicip-output
}


module "vmss_module" {
  source = "./modules/azurerm_vmss"
  vmssdetails = var.vmssdetails
  subnet_output = module.subnet_module.subnet-output
  backend_pool_ids = module.azure_alb.backend_pool_id
}

module "autoscale_module" {
  depends_on = [ module.vmss_module ]
  source = "./modules/azurerm_autoscale"
  autoscale_settings=var.autoscale_settings
  target_resource_id = module.vmss_module.vmss_ids-output
}