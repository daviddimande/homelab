#!/bin/bash
# varibles declaration

download_path="/tmp"
vm_id=8000
vm_name=ubuntu-cloud
vm_memory_size=2048
image_url="https://cloud-images.ubuntu.com/oracular/current/oracular-server-cloudimg-amd64.img"
image_name="oracular-server-cloudimg-amd64.img"
storage_name="local-lvm"

set -e # exit script if any of following commans return non-zero result

imageDownload () {
    # download image file from internet

    echo "#### downloading image ...####" | logger -s -p local7.notice
    wget -nd --tries=5 --timeout=600 --mirror $image_url  -P $download_path
    echo "#### done! ####" | logger -s -p local7.notice
}

createVM () {
   # create a new VM with VirtIO SCSI controller

   echo "#### creating virtual machine ...####" | logger -s -p local7.notice
   qm create $vm_id --name $vm_name --memory $vm_memory_size --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci | logger -s -p local7.notice
   echo "#### done! ####" | logger -s -p local7.notice 
}

importImage () {
   # import the downloaded disk to the local-lvm storage, attaching it as a SCSI drive
   #qm set $vm_id --scsi0 local-lvm:0,import-from=/path/to/bionic-server-cloudimg-amd64.img

   echo "#### importing image file ...####" | logger -s -p local7.notice
   qm set $vm_id --scsi0 $storage_name:0,import-from=$download_path/$image_name | logger -s -p local7.notice
   echo "#### done! ####" | logger -s -p local7.notice
}

insertCD () {
    # insert image to CD-ROM

    echo "#### inserting image file to CD-ROM ...####" | logger -s -p local7.notice
    qm set $vm_id --ide2 $storage_name:cloudinit | logger -s -p local7.notice
    echo "#### done! ####" | logger -s -p local7.notice
}

setBootOrder () {
    # set boot order to use image as primary source

    echo "#### setting boot order ...####" | logger -s -p local7.notice
    qm set $vm_id --boot order=scsi0 | logger -s -p local7.notice
    echo "#### done! ####" | logger -s -p local7.notice
}

setConsole () {
    # configure serial as display device

    echo "#### setting console device ...####" | logger -s -p local7.notice
    qm set $vm_id --serial0 socket --vga serial0 | logger -s -p local7.notice
    echo "#### done! ####" | logger -s -p local7.notice
}
resizeDisk () {
    # disk resize 
    
    echo "### resizing disk ...### " | logger -s -p local7.notice
    qm disk resize $vm_id scsi0 +20G | logger -s -p local7.notice
    echo "### done! ###" | logger -s -p local7.notice
}
templateVM () {
    # convert VM as template

    echo "#### converting virtual machine as template ...####" | logger -s -p local7.notice
    qm template $vm_id | logger -s -p local7.notice
    echo "#### done! ####" | logger -s -p local7.notice
}

# call functions 
imageDownload
createVM
importImage
insertCD
setBootOrder
setConsole
resizeDisk
templateVM