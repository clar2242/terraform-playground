variable "proxmox_host" {
  type = string
  default = "proxmox1"
}
variable "template_name" {
  type = string
  default = "noble-template"
}

variable "onepassword_account" {
  type = string
  default = "my.1password.com"
}

variable "server_count" {
  type = number
  default = "2"
}

variable "domain" {
  type = string
  default = "srv.tfr.home"
}

variable "bridge" {
  type = string
  default = "servers"
}
