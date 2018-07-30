terraform {
  backend "azurerm" {
    container_name       = "terraform"
    key                  = "malgazer-training-azure.terraform.tfstate"
  }
}
