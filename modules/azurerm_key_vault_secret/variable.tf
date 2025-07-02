variable "secret_name" {
  description = "The name of the secret to create in the Key Vault."
  type        = string  
  
}

variable "secret_value" {
  description = "The value of the secret to create in the Key Vault."
  type        = string
  sensitive   = true
  
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault is located."
  type        = string
  default     = "rg-todoapp6519"
  
}

variable "key_vault_name" {
  description = "The name of the Key Vault where the secret will be stored."
  type        = string
  default     = "sonamkitijori-todoapp6519"
  
}
