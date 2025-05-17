terraform {
  required_version = "~> 1.2"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc9"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.5.0"
    }
  }

}

provider "proxmox" {
  # Configuration options
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true # By default Proxmox Virtual Environment uses self-signed certificates.
  pm_debug            = true
  pm_log_file         = var.pm_log_file
  pm_timeout          = 300000
  pm_parallel         = 1
}
