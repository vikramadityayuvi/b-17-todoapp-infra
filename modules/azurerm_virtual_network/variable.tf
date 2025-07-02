variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
  
}

variable "virtual_network_location" {
  description = "The location where the virtual network should exist."
  type        = string
  
}


variable "resource_group_name" {
  description = "The name of the resource group in which the virtual network should exist."
  type        = string
  
}