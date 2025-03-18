
resource "proxmox_vm_qemu" "Kubernetes_node" {
  count       = 3
  name        = "kubernete-node-0${count.index + 1}"
  target_node = "pve"
  vmid        = 0
  desc        = "kubernetes node-${count.index + 1}"
  bios        = "seabios"
  onboot      = true
  vm_state    = "running"
  protection  = false
  tablet      = true
  boot        = "order=scsi0;net0"
  clone       = "ubuntu-server1"
  full_clone  = true
  memory      = 2048
  balloon     = 1024
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

  #depends_on = [proxmox_vm_qemu.vm_nova]
  depends_on = [proxmox_vm_qemu.Kubernetes_master]

}
