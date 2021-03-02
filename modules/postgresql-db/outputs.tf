output "server_name" {
  value = join("", azurerm_postgresql_database.postgresql-db.*.server_name)
}

output "db_name" {
  value = join("", azurerm_postgresql_database.postgresql-db.*.name)
}
