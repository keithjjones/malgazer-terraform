terraform {
  backend "azurerm" {
    storage_account_name = "${var.state_storage_account_name}"
    container_name       = "malgazer-training-state"
    key                  = "malgazer-training.terraform.tfstate"
	  access_key           = "${var.state_storage_access_key}"
  }
}
