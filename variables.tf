variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "vnet_name" {
  description = "Vnet name/account used in naming"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_cidr" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to add"
  type        = map(string)
  default     = {}
}