variable "resource_group_name" {
  description = "The name of the resource group where the VM will be created."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the VM will be created."
  type        = string
  default     = "centralindia"
  
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
  
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
  
}


variable "admin_password" {
  description = "The administrator password for the virtual machine."
  type        = string
  sensitive   = true
  
}


variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string
  default     = "Canonical"
  
}

variable "image_offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  
}

variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  default     = "22_04-lts"
  
}

variable "image_version" {
  description = "The version of the image to use for the virtual machine."
  type        = string
  default     = "latest"
  
}


variable "nic_name" {
  description = "The name of the network interface."
  type        = string
  default     = "nic-todoapp6519"
  
}

variable "subnet_name" {
  description = "The subnet to use"
  type        = string
}


variable "pip_name" {
  description = "The name of the public IP address to associate with the virtual machine."
  type        = string
  
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network where the network interface will be created."
  type        = string
  
}