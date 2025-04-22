resource "proxmox_vm_qemu" "Kubernetes_master" {
  count       = 2
  name        = "master-0${count.index + 1}"
  target_node = var.target_node
  vmid        = var.vmid
  desc        = "master -${count.index + 1}"
  bios        = var.bios
  onboot      = var.onboot
  vm_state    = var.vm_state
  protection  = var.protection
  tablet      = var.tablet
  boot        = var.boot
  clone       = var.clone
  full_clone  = var.full_clone
  memory      = var.memory
  balloon     = var.balloon
  sockets     = var.sockets
  cores       = var.cores
  cpu_type    = var.cpu_type
  hotplug     = var.hotplug

  disk {
    slot    = var.disk_slot
    type    = var.disk_type
    size    = var.disk_size
    storage = var.storage
  }

  network {
    id        = 0
    model     = var.network_model
    bridge    = var.network_bridge
    link_down = var.link_down
  }

}





resource "proxmox_vm_qemu" "Kubernetes_node" {
  count       = 3
  name        = "node-0${count.index + 1}"
  name        = "docker-host"
  target_node = var.target_node
  vmid        = var.vmid
  desc        = "kubernetes node-${count.index + 1}"
  desc       = "docker host"
  bios       = var.bios
  onboot     = var.onboot
  vm_state   = var.vm_state
  protection = var.protection
  tablet     = var.tablet
  boot       = var.boot
  clone      = var.clone
  full_clone = var.full_clone
  memory     = var.memory
  balloon    = var.balloon
  sockets    = var.sockets
  cores      = var.cores
  cpu_type   = var.cpu_type
  hotplug    = var.hotplug

  disk {
    slot    = var.disk_slot
    type    = var.disk_type
    size    = var.disk_size
    storage = var.storage
  }

  network {
    id        = 0
    model     = var.network_model
    bridge    = var.network_bridge
    link_down = var.link_down
  }

  depends_on = [proxmox_vm_qemu.vm_nova]
  #depends_on = [proxmox_vm_qemu.Kubernetes_master]

}
