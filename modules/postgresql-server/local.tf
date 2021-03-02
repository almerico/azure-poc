resource "random_string" "postgresql_prefix" {
  length           = 6
  special          = false
  override_special = "!@-_=+."
}

locals {
  prefix = var.prefix != "" ? var.prefix : random_string.postgresql_prefix.result
  resource_group = var.resource_group != "" ? var.resource_group : "${local.prefix}-postgresql-rg"
  server_name = var.server_name != "" ? var.server_name : "${local.prefix}-postgresql-server"

  default_tags = {
    env   = var.environment
  }

  private_sc_name = var.private_sc_name  != "" ? var.private_sc_name : "${local.prefix}-postgresql-private_sc"
}