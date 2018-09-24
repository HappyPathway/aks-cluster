data "azurerm_resource_group" "rg" {
  name = "${var.rg_name}"
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.sa_name}"
  resource_group_name      = "${data.azurerm_resource_group.rg.name}"
  location                 = "${data.azurerm_resource_group.rg.location}"
  account_tier             = "${var.sa_account_tier}"
  account_replication_type = "${var.sa_account_replication_type}"
}

resource "azurerm_container_registry" "cr" {
  name                = "${var.cr_name}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  admin_enabled       = "${var.cr_admin_enabled}"
  sku                 = "${var.cr_sku}"
  storage_account_id  = "${azurerm_storage_account.sa.id}"
}
