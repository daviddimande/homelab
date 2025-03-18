variable "pm_api_url" {
  type    = string
  default = "https://192.168.1.10:8006/api2/json"
}

variable "pm_api_token_id" {
  type        = string
  description = "token id for proxmox user"
  sensitive   = true
}

variable "pm_api_token_secret" {
  type        = string
  description = "secret token for proxmox"
  sensitive   = true
}