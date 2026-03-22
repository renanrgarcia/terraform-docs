variable "prefix" {
  default     = "lab"
}

variable "tags" {
  description = "Tag values"
  default     = "lab"
}

variable "vm_size" {
  description = "Instance size"
  default     = "Standard_DS1_v2"
}

variable "publisher" {
  default     = "Canonical"
}

variable "offer" {
  default     = "UbuntuServer"
}

variable "sku" {
  default     = "18.04-LTS"
}

variable "img-version" {
  default     = "latest"
}

variable "computer-name" {
  default = "hostname"
}

variable "admin_username" {
  description = "VM user's name:"
  type       = string
  # default    = "linuxadmin"
}

variable "admin_password" {
  description = "VM user's password:"
  default = "Password@123"
}