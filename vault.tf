variable "vault_azure_credentials_path" {
  default = "secret/credentials/azure"
}
data "vault_generic_secret" "azure_client_id" {
  path = "${var.vault_azure_credentials_path}"
}