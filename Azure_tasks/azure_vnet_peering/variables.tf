variable "sub_ID" {
  description = "Free Azure user subscription ID"
  type        = string
  default     = "a4867892-6250-46e3-91cb-86c0d43d7b32"
}

#   Example VNet from Azure tutorial
variable "vnet_example_name" {
  description = "Name of example virtual network, in folder 'Azure_tasks/virtual_network/'"
  type = string
}

#   VNet to be peered with 'vnet_example_name'
variable "vnet_name_peered" {
  description = "Name of virtual network peered to 'vnet_example_name'"
  type = string
}

variable "addr_space_peered" {
  description = "Address space of VNet peered to 'vnet_example_name'"
}