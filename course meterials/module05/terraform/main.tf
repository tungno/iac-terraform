# this is very useful when we have two or more workspace, 
#  to make: terraform init, plan and apply

locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = "${var.rg_name}-${local.workspaces_suffix}"
}


resource "azurerm_resource_group" "rg" {
    name     = local.rg_name
    location = var.rg_location
}

# here we need to call back the correct output. 
output "rg_name" {
    value = azurerm_resource_group.rg.name
}