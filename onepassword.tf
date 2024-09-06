data "onepassword_vault" "Personal" {
  name = "Personal"
}

data "onepassword_item" "proxmox_api" {
  vault = data.onepassword_vault.Personal.uuid
  title = "proxmox_api"
}

locals {
  # Store the section labeled "API" from item  "Proxmox PVE01" in a local variable for shortened string references
  section_api = data.onepassword_item.proxmox_api.section[index(data.onepassword_item.proxmox_api.section.*.label, "API")]

  # Store the field value of the section "API"  in a local variable for shortened string references
  pve_api = local.section_api.field

  pm_api_url = local.pve_api[index(local.pve_api.*.label, "pm_api_url")].value

  # Extract the API token secret field value from the "API" section of the Proxmox PVE01 item and store it in a local variable
  pm_api_token_secret = local.pve_api[index(local.pve_api.*.label, "pm_api_token_secret")].value

  # Extract the API token ID field value from the "API" section of the Proxmox PVE01 item and store it in a local variable
  pm_api_token_id = local.pve_api[index(local.pve_api.*.label, "pm_api_token_id")].value

}

