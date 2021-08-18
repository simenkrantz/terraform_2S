variable "rg_name" {
  type = string
}

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

variable "num_net" {
  type = number
}

variable "num_subnet" {
  type = number
}

variable "subnet_prefix" {
  type = list(string)
}