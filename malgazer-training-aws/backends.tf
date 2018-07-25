terraform {
  backend "azurerm" {
    container_name       = "malgazer-state"
    key                  = "malgazer-training-aws.terraform.tfstate"
  }
}
