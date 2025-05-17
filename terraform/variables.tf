variable "pm_api_url" {
  type    = string
  default = "https://yourproxmoxhostehere:8006/api2/json"
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

variable "pm_log_file" {
  type        = string
  default     = "terraform-plugin-proxmox.log"
  description = "log file for terraform"
}

variable "target_node" {
  type        = string
  default     = "pve"
  description = "proxmox node where deployment will be done"
}
## ===================== VM variables ===================

variable "vmid" {
  type        = number
  default     = 0
  description = "virtual machine ID"
}


variable "bios" {
  type        = string
  default     = "seabios"
  description = "bios for virtual machine"
}
variable "onboot" {
  type        = bool
  default     = true
  description = "startup virtual machine during host booting"
}

variable "vm_state" {
  type        = string
  default     = "running"
  description = "virtual machine state after creation"
}

variable "protection" {
  type        = bool
  default     = false
  description = "if enabled, prevent virtual machine to be deleted accidentally"
}

variable "tablet" {
  type        = bool
  default     = true
  description = "allow input devices"
}

variable "boot" {
  type        = string
  default     = "order=scsi0;net0"
  description = "define device boot order"
}

variable "clone" {
  type        = string
  default     = "ubuntu-server1"
  description = "define target template to be used"
}
variable "full_clone" {
  type        = bool
  default     = true
  description = "decide if a clone will be full or linked"

}

variable "memory" {
  type        = number
  default     = 2048
  description = "define memory size for virtual machine"
}

variable "balloon" {
  type        = number
  default     = 1024
  description = "define memory reservation"
}

variable "sockets" {
  type        = number
  default     = 1
  description = "define cpu sockets"
}

variable "cores" {
  type        = number
  default     = 1
  description = "define cpu cores"
}

variable "cpu_type" {
  type        = string
  default     = "host"
  description = "define cpu type to be used"
}

variable "hotplug" {
  type        = string
  default     = "cpu,disk,network,usb"
  description = "define hotplug devices"
}

variable "disk_slot" {
  type        = string
  default     = "scsi0"
  description = "disk slot"
}
variable "disk_type" {
  type        = string
  default     = "disk"
  description = "define disk type to be used"
}

variable "disk_size" {
  type        = string
  default     = "32G"
  description = "define disk size note: this size should met with one defined in template"
}

variable "storage" {
  type        = string
  default     = "local-lvm"
  description = "defines storage location for virtual machine disk"

}

variable "network_model" {
  type        = string
  default     = "virtio"
  description = "define network interface model"
}

variable "network_bridge" {
  type        = string
  default     = "vmbr0"
  description = "define network interface mode"
}

variable "link_down" {
  type        = bool
  default     = false
  description = "define network interface status"
}

## ===================== container variables =====================


variable "swap" {
  type        = number
  default     = 1024
  description = "swap memory for VM and container"

}

variable "hostname" {
  type        = string
  default     = "my-container"
  description = "hostname for container"
}


variable "ostemplate" {
  type        = string
  default     = "mbenga:vztmpl/ubuntu-24.10-standard_24.10-1_amd64.tar.zst"
  description = "template loccation within proxmox VE"
}

variable "unprivileged" {
  type        = bool
  default     = true
  description = "unprivileged setting for container"

}

variable "password" {
  type        = string
  default     = "YouPassHere(SecureOne)"
  description = "password setting"
  sensitive   = true

}

variable "ip" {
  type        = string
  description = "container ip address"
}

variable "gw" {
  type        = string
  description = "container gateway address"
}

variable "net_name" {
  type        = string
  default     = "eth0"
  description = "network interface ID"
}

variable "bridge_type" {
  type        = string
  default     = "vmbr0"
  description = "network bridge settings"

}

variable "container_size" {
  type        = string
  default     = "10G"
  description = "disk size for container"
}

variable "start" {
  type        = bool
  default     = true
  description = "start container after creation"
}


variable "template" {
  type        = bool
  default     = false
  description = "create as template"
}


variable "console" {
  type        = bool
  default     = true
  description = "enable container to container"
}

variable "nesting" {
  type        = bool
  default     = true
  description = "enable nesting"

}