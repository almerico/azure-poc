resource "random_pet" "pet" {
}

resource "random_id" "random" {
  byte_length = 6
}

locals {
  yaml = yamldecode(file("./variables/values.yaml"))

  location    = local.yaml.devops.location
  environment = local.yaml.devops.environment

  resource_group        = local.yaml.devops.resource_group
  create_resource_group = local.yaml.devops.create_resource_group

  # Service Principal 
  default_key_vault_pass = {
    kv_name           = "dummy"
    kv_resource_group = "dummy"
    kv_secret_name    = "dummy"
  }
  default_service_principal = {
    create         = true
    name           = null
    key_vault_pass = local.default_key_vault_pass
  }

  var_service_principal = lookup(local.yaml.devops, "service_principal", local.default_service_principal)

  service_principal = {
    create         = local.var_service_principal.create
    name           = local.var_service_principal.name != null && local.var_service_principal.name != "" ? local.var_service_principal.name : "sp-aks-${local.environment}"
    key_vault_pass = lookup(local.var_service_principal, "key_vault_pass", local.default_key_vault_pass)
  }

  # Vault
  vault_create                    = local.yaml.devops.vault.create
  vault_name                      = local.yaml.devops.vault.name
  enabled_for_deployment          = local.yaml.devops.vault.enabled_for_deployment
  enabled_for_disk_encryption     = local.yaml.devops.vault.enabled_for_disk_encryption
  enabled_for_template_deployment = local.yaml.devops.vault.enabled_for_template_deployment

  kv-key-permissions         = local.yaml.devops.vault.key-permissions
  kv-secret-permissions      = local.yaml.devops.vault.secret-permissions
  kv-certificate-permissions = local.yaml.devops.vault.certificate-permissions
  kv-storage-permissions     = local.yaml.devops.vault.storage-permissions

  admin_groups = lookup(local.yaml.devops.vault, "admin_groups", [])

  # registry
  create_registry         = local.yaml.devops.registry.create
  container_registry_name = local.yaml.devops.registry.name != "" ? local.yaml.devops.registry.name : replace("${local.environment}${random_pet.pet.id}", "-", "")
  admin_enabled           = local.yaml.devops.registry.admin_enabled

  # key_vault_secret_user
  registryserver       = module.registry.registry_login_server
  registryuser         = local.service_principal.create ? module.service_principal.client_id : module.service_principal_external.client_id
  registrypassword     = local.service_principal.create ? module.service_principal.client_secret : module.service_principal_external.client_secret
  service_principal_id = local.service_principal.create ? module.service_principal.id : module.service_principal_external.id
}
