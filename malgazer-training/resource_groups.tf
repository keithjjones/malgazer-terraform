resource "azurerm_resource_group" "malgazer_training_rg" {
        name = "${var.resource_group}"
        location = "${var.region}"
}
