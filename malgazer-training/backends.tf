terraform {
  backend "azurerm" {
    container_name       = "malgazer-state"
    key                  = "${var.resource_group}.terraform.tfstate"
  }
}
