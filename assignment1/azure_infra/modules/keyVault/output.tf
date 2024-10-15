output "keyvaultname" {
  value = var.keyvaultname
}
output "vm_username_secret" {
  value = azurerm_key_vault_secret.vm-username.value
}

output "vm_password_secret" {
  value = azurerm_key_vault_secret.vm-password.value
}

output "keyvault-secret-id" {
  value = azurerm_key_vault_secret.sa-access-key.id
}