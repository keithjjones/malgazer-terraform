resource "azurerm_virtual_network" "malgazer_training_virtual_network" {
  name                = "malgazer_training_virtual_network"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.malgazer_training_rg.name}"
}


resource "azurerm_subnet" "malgazer_training_subnet" {
  name                 = "malgazer_training_subnet"
  resource_group_name  = "${azurerm_resource_group.malgazer_training_rg.name}"
  virtual_network_name = "${azurerm_virtual_network.malgazer_training_virtual_network.name}"
  address_prefix       = "10.0.0.0/24"
}


resource "azurerm_public_ip" "malgazer_training_public_ip" {
    name                         = "malgazer_training_public_ip"
    location                     = "${var.region}"
    resource_group_name          = "${azurerm_resource_group.malgazer_training_rg.name}"
    public_ip_address_allocation = "dynamic"
}


resource "azurerm_network_security_group" "malgazer_training_nsg" {
  name                = "malgazer_training_nsg"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.malgazer_training_rg.name}"

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${var.home_ip}/32"
    destination_address_prefix = "10.0.0.0/24"
  }

  security_rule {
    name                       = "Outbound-All"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_network_interface" "malgazer_training_nic" {
    name                      = "malgazer_training_nic"
    location                  = "${var.region}"
    resource_group_name       = "${azurerm_resource_group.malgazer_training_rg.name}"
    network_security_group_id = "${azurerm_network_security_group.malgazer_training_nsg.id}"

    ip_configuration {
        name                          = "malgazer_training_nic_configuration"
        subnet_id                     = "${azurerm_subnet.malgazer_training_subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.malgazer_training_public_ip.id}"
    }
}
