output "nsg-output" {
  value = {
    for i , key in azurerm_network_security_group.nsg : 
    i=>{
        name=key
        resource_group_name=key.resource_group_name
        security_rules=[
            for rule in key.security_rule : {
        name=rule.name        
        access=rule.access
        destination_port_range=rule.destination_port_range
        priority=rule.priority
            }
        ]
       
    }
  }
}