

resource "kubernetes_secret" "example" {
  metadata {
    name = "registry"
  }

  data {
    username = "${azurerm_container_registry.cr.admin_username}"
    password = "${azurerm_container_registry.cr.admin_password}"
  }

  type = "kubernetes.io/azure-registry"
}