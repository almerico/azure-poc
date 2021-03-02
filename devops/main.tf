##create key_vault
module "key_vault" {
  source                = "../modules/key-vault"
  enable                = local.vault_create
  name                  = local.vault_name
  location              = local.location
  resource_group_name   = local.resource_group
  create_resource_group = local.create_resource_group

  enabled_for_deployment          = local.enabled_for_deployment
  enabled_for_disk_encryption     = local.enabled_for_disk_encryption
  enabled_for_template_deployment = local.enabled_for_template_deployment

  admin_groups = local.admin_groups

  kv-key-permissions         = local.kv-key-permissions
  kv-secret-permissions      = local.kv-secret-permissions
  kv-certificate-permissions = local.kv-certificate-permissions
  kv-storage-permissions     = local.kv-storage-permissions

  tags = {
    environment = local.environment
  }
}

##Registry
module "registry" {
  source            = "../modules/registry"
  create_registry   = local.create_registry
  location          = local.location
  module_depends_on = []
  resource_group    = module.key_vault.key-vault-rg-name

  container_registry_name = local.container_registry_name
  admin_enabled           = local.admin_enabled

  principal_id = local.service_principal_id
}


##apply secrets
module "key_vault_secret_user" {
  source       = "../modules/key-vault-secrets"
  key_vault_id = module.key_vault.key-vault-id
  secrets = { registryServer = {
    value = local.registryserver
    }
    registryUser = {
      value = local.registryuser
    }
    registryPassword = {
      value = local.registrypassword
    }
  }
  tags = {
    environment = local.environment
  }
}

