# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "pve/qemu/102"
resource "proxmox_vm_qemu" "maquina_importada" {
  additional_wait             = null
  agent                       = 1
  agent_timeout               = null
  args                        = null
  automatic_reboot            = null
  balloon                     = null
  bios                        = "seabios"
  boot                        = "order=scsi0;net0"
  bootdisk                    = null
  ci_wait                     = null
  cicustom                    = null
  cipassword                  = null # sensitive
  ciupgrade                   = null
  ciuser                      = null
  clone                       = null
  clone_id                    = null
  clone_wait                  = null
  cores                       = 1
  cpu_type                    = "x86-64-v2-AES"
  define_connection_info      = false
  desc                        = null
  force_create                = false
  force_recreate_on_change_of = null
  full_clone                  = false
  hagroup                     = null
  hastate                     = null
  hotplug                     = "network,disk,usb"
  ipconfig0                   = null
  ipconfig1                   = null
  ipconfig10                  = null
  ipconfig11                  = null
  ipconfig12                  = null
  ipconfig13                  = null
  ipconfig14                  = null
  ipconfig15                  = null
  ipconfig2                   = null
  ipconfig3                   = null
  ipconfig4                   = null
  ipconfig5                   = null
  ipconfig6                   = null
  ipconfig7                   = null
  ipconfig8                   = null
  ipconfig9                   = null
  kvm                         = true
  machine                     = null
  memory                      = 2048
  name                        = "ubuntu-server"
  nameserver                  = null
  numa                        = false
  onboot                      = true
  os_network_config           = null
  os_type                     = null
  pool                        = null
  protection                  = false
  pxe                         = null
  qemu_os                     = "l26"
  scsihw                      = "virtio-scsi-single"
  searchdomain                = null
  skip_ipv4                   = null
  skip_ipv6                   = null
  sockets                     = 1
  ssh_forward_ip              = null
  ssh_private_key             = null # sensitive
  ssh_user                    = null
  sshkeys                     = null
  startup                     = null
  tablet                      = true
  tags                        = null
  target_node                 = null
  target_nodes                = null
  vcpus                       = null
  vm_state                    = "running"
  vmid                        = null
  disks {
    scsi {
      scsi0 {
        disk {
          asyncio              = null
          backup               = true
          cache                = null
          discard              = false
          emulatessd           = false
          format               = "qcow2"
          iops_r_burst         = 0
          iops_r_burst_length  = 0
          iops_r_concurrent    = 0
          iops_wr_burst        = 0
          iops_wr_burst_length = 0
          iops_wr_concurrent   = 0
          iothread             = true
          mbps_r_burst         = 0
          mbps_r_concurrent    = 0
          mbps_wr_burst        = 0
          mbps_wr_concurrent   = 0
          readonly             = false
          replicate            = true
          serial               = null
          size                 = "32G"
          storage              = "mbenga"
          wwn                  = null
        }
      }
    }
  }
  network {
    bridge    = "vmbr0"
    firewall  = true
    id        = 0
    link_down = false
    macaddr   = "bc:24:11:fe:0b:47"
    model     = "virtio"
    mtu       = 0
    queues    = 0
    rate      = 0
    tag       = 0
  }
  smbios {
    family       = null
    manufacturer = null
    product      = null
    serial       = null
    sku          = null
    uuid         = "d3700586-df3a-4d27-ad35-ab29dd87bca4"
    version      = null
  }
}
