variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "rajatkitijori"
  
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
  default     = "centralindia"
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
  default     = "rg-todoapp6519"
  
}