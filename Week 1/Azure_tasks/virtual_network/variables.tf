variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  validation {
    condition     = length(var.vnet_name) > 0
    error_message = "Virtual network name must be nonempty."
  }
}

variable "vnet_adress" {
  description = "Virtual network adress space"
  type        = list(string)
  validation {
    condition     = length(var.vnet_adress) > 0
    error_message = "Specify a non-empty VNet adress."
  }
}
/*
variable "subnet_name" {
  description = "Name of subnet"
  type = string
}

variable "subnet_adress" {
  description = "Adress space for the subnet"
  type = list(string)
}
*/
variable "subnets_map" {
  description = "Multiple subnet variable"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}
