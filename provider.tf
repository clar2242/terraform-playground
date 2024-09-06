terraform {
  required_version = ">=0.13.0"

  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.15"
    }
    onepassword = {
      source = "1Password/onepassword"
      version = "~> 2.0.0"
    }
  }
}

provider "proxmox" {
  # Configuration options
  pm_api_url = local.pm_api_url
  pm_api_token_id = local.pm_api_token_id
  pm_api_token_secret = local.pm_api_token_secret

  pm_debug        = true
  # Optional: skip TLS Verification
  pm_tls_insecure = false
  pm_parallel     = 2
  pm_timeout      = 1200
}

provider "onepassword" {
  account = var.onepassword_account
}
