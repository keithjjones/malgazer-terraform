resource "azurerm_virtual_machine" "malgazer_training_vm" {
    name                  = "malgazer_training_vm"
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.malgazer_training_rg.name}"
    network_interface_ids = ["${azurerm_network_interface.malgazer_training_nic.id}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "malgazer_training_vm_OSDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }

    os_profile {
        computer_name  = "malgazer-training-vm"
        admin_username = "${var.vm_username}"
        admin_password = "${var.vm_password}"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}
