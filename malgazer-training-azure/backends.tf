terraform {
  backend "azurerm" {
    container_name       = "malgazer-state"
    key                  = "malgazer-training-azure.terraform.tfstate"
  }
}
