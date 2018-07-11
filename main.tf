
resource "azurerm_resource_group" "rg_test" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "vnet_test" {
  name                = "${var.resource_group}vnet"
  location            = "${var.location}"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = "${azurerm_resource_group.rg_test.name}"
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = "${azurerm_virtual_network.vnet_test.name}"
  resource_group_name  = "${azurerm_resource_group.rg_test.name}"
  address_prefix       = "10.0.0.0/24"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  virtual_network_name = "${azurerm_virtual_network.vnet_test.name}"
  resource_group_name  = "${azurerm_resource_group.rg_test.name}"
  address_prefix       = "10.0.1.0/24"
}
resource "azurerm_subnet" "subnet3" {
  name                 = "subnet3"
  virtual_network_name = "${azurerm_virtual_network.vnet_test.name}"
  resource_group_name  = "${azurerm_resource_group.rg_test.name}"
  address_prefix       = "10.0.2.0/24"
}
