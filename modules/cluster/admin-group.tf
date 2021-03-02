locals {
    admin_group_name = var.admin_group_name != null && var.admin_group_name != "" ? var.admin_group_name : "${var.cluster_name}-admins"
    admin_group_id = var.create_cluster ? (var.create_admin_group ? join("", azuread_group.admins.*.id) : join("", data.azuread_group.admins.*.id)) : ""
}

data "azuread_group" "admins" {
  count = var.create_cluster && !var.create_admin_group ? 1 : 0
  name  = local.admin_group_name
}

data "external" "account_info" {
  count = var.create_cluster && var.create_admin_group ? 1 : 0

  program  = [
    "az",
    "ad",
    "signed-in-user",
    "show",
    "--query",
    "{object_id:objectId}",
    "-o",
    "json",
  ]
}

resource "azuread_group" "admins" {
  count    = var.create_cluster && var.create_admin_group ? 1 : 0

  name = local.admin_group_name
  members = [
    join("", data.external.account_info.*.result.object_id)
  ]
}
