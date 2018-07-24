resource "azurerm_public_ip" "malgazer_training_public_ip" {
    name                         = "${var.resource_group}_public_ip"
    location                     = "${var.region}"
    resource_group_name          = "${var.resource_group}"
    public_ip_address_allocation = "dynamic"
    domain_name_label = "${var.resource_group}"
}

resource "azurerm_network_interface" "malgazer_training_nic" {
    name                      = "${var.resource_group}_nic"
    location                  = "${var.region}"
    resource_group_name       = "${var.resource_group}"
    network_security_group_id = "${azurerm_network_security_group.malgazer_training_nsg.id}"

    ip_configuration {
        name                          = "${var.resource_group}_nic_configuration"
        subnet_id                     = "${azurerm_subnet.malgazer_training_subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.malgazer_training_public_ip.id}"
    }
}

resource "azurerm_virtual_machine" "malgazer_training_vm" {
    name                  = "${var.resource_group}_vm"
    location              = "${var.region}"
    resource_group_name   = "${var.resource_group}"
    network_interface_ids = ["${azurerm_network_interface.malgazer_training_nic.id}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "${var.resource_group}_vm_OSDisk"
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
        computer_name  = "${var.resource_group}-vm"
        admin_username = "${var.vm_username}"
        admin_password = "${var.vm_password}"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    connection {
      type     = "ssh"
      agent    = false
      host     = "${azurerm_public_ip.malgazer_training_public_ip.fqdn}"
      user     = "${var.vm_username}"
      password = "${var.vm_password}"
      timeout = "180s"
    }

    provisioner "file" {
      source      = "./scripts/build_training.sh"
      destination = "/tmp/build_training.sh"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo mkdir -p /mnt/virustotal",
        "sudo chown -R ${var.vm_username}:${var.vm_username} /mnt/virustotal",
        "${var.mount_data_cmd}",
        "sudo bash /tmp/build_training.sh"
      ]
    }
}
