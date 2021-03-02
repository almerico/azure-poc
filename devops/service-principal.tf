module "service_principal_external" {
  source            = "../modules/service-principal-external"
  enable            = local.service_principal.create ? false : true
  sp_name           = local.service_principal.name
  kv_name           = local.service_principal.key_vault_pass.kv_name
  kv_resource_group = local.service_principal.key_vault_pass.kv_resource_group
  kv_secret_name    = local.service_principal.key_vault_pass.kv_secret_name
}

# Service principal will be created
module "service_principal" {
  source              = "../modules/service-principal"
  create              = local.service_principal.create
  environment         = local.environment
  sp_application_name = local.service_principal.name
}
