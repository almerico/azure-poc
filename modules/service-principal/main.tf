locals {
    sp_application_name = var.sp_application_name != null && var.sp_application_name != "" ? var.sp_application_name : "sp-aks-${var.environment}"
}

resource "random_string" "aks_sp_password" {
    count = var.create ? 1 : 0

    keepers = {
        env_name = var.environment
    }
    length           = 24
    min_upper        = 1
    min_lower        = 1
    min_numeric      = 1
    special          = true
    min_special      = 1
    override_special = "!@-_=+."
}

resource "random_string" "aks_sp_secret" {
    count = var.create ? 1 : 0

    keepers = {
        env_name = var.environment
    }
    length           = 24
    min_upper        = 1
    min_lower        = 1
    min_numeric      = 1
    special          = true
    min_special      = 1
    override_special = "!@-_=+."
}

resource "azuread_application" "aks_sp" {
    count = var.create ? 1 : 0

    name = local.sp_application_name
}

resource "azuread_application_password" "aks_sp" {
    count = var.create ? 1 : 0

    application_object_id = join("", azuread_application.aks_sp.*.id) 
    value                 = join("", random_string.aks_sp_secret.*.result)
    end_date_relative     = "8760h" # 1 year

    lifecycle {
        ignore_changes = [
            value,
            end_date_relative
        ]
    }
}

resource "azuread_service_principal" "aks_sp" {
    count = var.create ? 1 : 0

    application_id               = join("", azuread_application.aks_sp.*.application_id)
    app_role_assignment_required = false
}

resource "azuread_service_principal_password" "aks_sp" {
    count = var.create ? 1 : 0

    service_principal_id = join("", azuread_service_principal.aks_sp.*.id)
    value                = join("", random_string.aks_sp_password.*.result)
    end_date_relative    = "8760h" # 1 year

    lifecycle {
        ignore_changes = [
            value,
            end_date_relative
        ]
    }
}


