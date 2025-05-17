module "node" {
  source              = "git::https://github.com/daviddimande/terraform-proxmox-vm.git"
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url          = var.pm_api_url
  node_name           = var.node_name

}

module "container-lxc" {
  source              = "git::https://github.com/daviddimande/terraform-proxmox-lxc.git"
  ip                  = "dhcp"
  gw                  = var.gw
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url          = var.pm_api_url
}
