resource "proxmox_vm_qemu" "Kubernetes_master" {
  count       = 2
  name        = "kubernete-master-0${count.index + 1}"
  target_node = "pve"
  vmid        = 0
  desc        = "kubernetes master -${count.index + 1}"
  bios        = "seabios"
  onboot      = true
  vm_state    = "running"
  protection  = false
  tablet      = true
  boot        = "order=scsi0;net0"
  clone       = "ubuntu-server1"
  full_clone  = true
  memory      = 4096
  balloon     = 2048
  sockets     = 1
  cores       = 1
  cpu_type    = "host"
  hotplug     = "cpu,disk,network,usb"

  disk {
    slot    = "scsi0"
    type    = "disk"
    size    = "32G"
    storage = "mbenga"
  }

  network {
    id        = 0
    model     = "virtio"
    bridge    = "vmbr0"
    link_down = false
  }

}
