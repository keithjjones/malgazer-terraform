output "public_ip_address" {
    description = "Output public IP address for each Virtual Machine."
    value = "${azurerm_public_ip.malgazer_training_public_ip.ip_address}"
}
