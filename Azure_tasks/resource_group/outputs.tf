data "azurerm_resource_group" "resource_group" {
  name = "first_resource_group"
}

/*
Adding outputs to previously applied config, run 'terraform apply' again
How to use outputs:

  In terminal,s
    terraform output <Output Name>
    terraform output resource_group_id
*/

output "resource_group_id" {
  value = data.azurerm_resource_group.resource_group.id
}