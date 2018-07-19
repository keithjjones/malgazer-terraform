terraform {
  backend "azurerm" {
    container_name       = "malgazer-training-state"
    key                  = "malgazer-training.terraform.tfstate"
  }
}
