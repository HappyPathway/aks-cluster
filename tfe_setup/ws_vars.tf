variable "rg_name" {
    type="string"
}
resource "tfe_variable" "rg_name" {
    key = "rg_name"
    value = "${var.rg_name}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "rg_location" {
    type="string"
}
resource "tfe_variable" "rg_location" {
    key = "rg_location"
    value = "${var.rg_location}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "sa_name" {
    type="string"
}
resource "tfe_variable" "sa_name" {
    key = "sa_name"
    value = "${var.sa_name}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "sa_account_tier" {
    type="string"
}
resource "tfe_variable" "sa_account_tier" {
    key = "sa_account_tier"
    value = "${var.sa_account_tier}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "sa_account_replication_type" {
    type="string"
}
resource "tfe_variable" "sa_account_replication_type" {
    key = "sa_account_replication_type"
    value = "${var.sa_account_replication_type}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cr_name" {
    type="string"
}
resource "tfe_variable" "cr_name" {
    key = "cr_name"
    value = "${var.cr_name}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cr_admin_enabled" {
    type="string"
}
resource "tfe_variable" "cr_admin_enabled" {
    key = "cr_admin_enabled"
    value = "${var.cr_admin_enabled}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cr_sku" {
    type="string"
}
resource "tfe_variable" "cr_sku" {
    key = "cr_sku"
    value = "${var.cr_sku}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

variable "cluster_name" {
    type="string"
}
resource "tfe_variable" "cluster_name" {
    key = "cluster_name"
    value = "${var.cluster_name}"
    category = "terraform"
    workspace_id = "${module.workspace.workspace_id}"
}

