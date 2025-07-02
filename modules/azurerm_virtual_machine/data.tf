data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

data "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}


  

  




data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = var.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm-password" {
  name         = var.password_secret_name   
  key_vault_id = data.azurerm_key_vault.kv.id
}

variable "key_vault_name" {}
variable "username_secret_name" {}
variable "password_secret_name" {}