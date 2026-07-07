output "lb_ids" {
  value = {
    for k,v in azurerm_lb.alb :
    k => {
        name=v
        location=v.location
        }
  }
}

output "lb_frontend_ip_configuration" {
  value = {
    for i , v in azurerm_lb.alb : i =>{
    public_ip_address_id = v.public_ip_address_id
    }
  }
}

output "backend_pool_id" {
  value = {
    for k,v in azurerm_lb_backend_address_pool.bpool : k => v.id
  }
}