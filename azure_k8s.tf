resource azurerm_network_security_group "advanced_network" {
  name                = "${local.network_name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
}

resource "azurerm_virtual_network" "advanced_network" {
  name                = "${local.vnet_name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  address_space       = ["${var.network_cidr}"]
}

resource "azurerm_subnet" "subnet" {
  name                      = "${local.subnet_name}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
  network_security_group_id = "${azurerm_network_security_group.advanced_network.id}"
  address_prefix            = "${var.subnet_cidr}"
  virtual_network_name      = "${azurerm_virtual_network.advanced_network.name}"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name       = "${var.cluster_name}"
  location   = "${data.azurerm_resource_group.rg.location}"
  dns_prefix = "${var.cluster_name}"

  resource_group_name = "${data.azurerm_resource_group.rg.name}"

  linux_profile {
    admin_username = "${azurerm_container_registry.cr.admin_username}"
    ssh_key = "${file("${path.module}/files/azure_k8s.pub")}"
  }

  agent_pool_profile {
    name    = "agentpool"
    count   = "2"
    vm_size = "Standard_DS2_v2"
    os_type = "Linux"

    # Required for advanced networking
    vnet_subnet_id = "${azurerm_subnet.subnet.id}"
  }

  service_principal {
    client_id     = "${data.vault_generic_secret.azure_client_id.data["client_id"]}"
    client_secret = "${data.vault_generic_secret.azure_client_id.data["client_secret"]}"
  }

  network_profile {
    network_plugin = "azure"
  }
}

