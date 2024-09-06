data "onepassword_vault" "Personal" {
  name = "Personal"
}

data "onepassword_item" "proxmox_api" {
  vault = data.onepassword_vault.Personal.uuid
  title = "proxmox_api"
}

data "onepassword_item" "pihole_api" {
  vault = data.onepassword_vault.Personal.uuid
  title = "pihole_api"
}

locals {
  ## Proxmox Credentials
  section_api = data.onepassword_item.proxmox_api.section[index(data.onepassword_item.proxmox_api.section.*.label, "API")]
  pve_api = local.section_api.field
  pm_api_url = local.pve_api[index(local.pve_api.*.label, "pm_api_url")].value
  pm_api_token_secret = local.pve_api[index(local.pve_api.*.label, "pm_api_token_secret")].value
  pm_api_token_id = local.pve_api[index(local.pve_api.*.label, "pm_api_token_id")].value

  ## pihole Credentials
  section_pihole_api = data.onepassword_item.pihole_api.section[index(data.onepassword_item.pihole_api.section.*.label, "API")]
  ph_api = local.section_pihole_api.field
  pihole_url = local.ph_api[index(local.ph_api.*.label, "pihole_api_url")].value
  pihole_api_token = local.ph_api[index(local.ph_api.*.label, "pihole_api_token")].value
}

