variable "location" {
  default = "Central India"
}

variable "admin_username" {
  default = "vmadmin"
}

variable "admin_password" {
  description = "VM admin password"
  sensitive   = true
}
