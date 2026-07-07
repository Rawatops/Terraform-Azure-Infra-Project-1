output "nat_gateway_id-output" {
  value = {
    for i , key in azurerm_nat_gateway.natgateway:
    i=>{
        id=key.id
    }
  }
}