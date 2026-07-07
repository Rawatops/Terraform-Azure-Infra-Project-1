output "subnet-output" {
  value = {
    for i, key in azurerm_subnet.subnet:
    i=>{
      id=key.id
      name=key.name
    }
  }
}