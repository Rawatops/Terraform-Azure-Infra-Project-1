variable "rg_details"{
 type=map(object({
    location=string
    managed_by=string
    tags=map(string)
 }))
}