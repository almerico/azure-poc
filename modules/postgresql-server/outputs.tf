output "resource_group" {
  value = join("", azurerm_postgresql_server.postgresql.*.resource_group_name)
}

output "server_name" {
  value = join("", azurerm_postgresql_server.postgresql.*.name)
}

output "server_fqdn" {
  value = join("", azurerm_postgresql_server.postgresql.*.fqdn)
}

output "administrator_login" {
  value = join("", azurerm_postgresql_server.postgresql.*.administrator_login)
}

output "administrator_login_password" {
  value = join("", azurerm_postgresql_server.postgresql.*.administrator_login_password)
}

output "private_endpoint_postgresql" {
  value = azurerm_private_endpoint.postgresql
}
