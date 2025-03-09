#!/bin/bash
# varibles declaration

download_path="/tmp"
vm_id=8000
vm_memory_size=2048
image_url="https://cloud-images.ubuntu.com/oracular/current/"
image_name="oracular-server-cloudimg-amd64.img"
storage_name="local-lvm"


imageDownload () {
    # download image file from internet
    wget $image_url$image_name
}

createVM () {
   # create a new VM with VirtIO SCSI controller
   qm create $vm_id --memory $vm_memory_size --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
}

importImage () {
   # import the downloaded disk to the local-lvm storage, attaching it as a SCSI drive
   
   #qm set $vm_id --scsi0 local-lvm:0,import-from=/path/to/bionic-server-cloudimg-amd64.img
   qm set $vm_id --scsi0 $storage_name:0,import-from=$download_path$image_name
}

insertCD () {
    # insert image to CD-ROM
    qm set $vm_id --ide2 $storage_name:cloudinit
}

setBootOrder () {
    # set boot order to use image as primary source
    qm set $vm_id --boot order=scsi0
}

setConsole () {
    # configure serial as display device
    qm set $vm_id --serial0 socket --vga serial0
}

templateVM () {
    # convert VM as template
    qm template $vm_id
}

# call functions 
imageDownload
createVM
importImage
insertCD
setBootOrder
setConsole
templateVM