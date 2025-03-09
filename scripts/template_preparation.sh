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

    echo "#### downloading image ...####"
    wget -nd --tries=5 --timeout=600 --mirror $image_url  -P $download_path
    echo "#### done! ####"
}

createVM () {
   # create a new VM with VirtIO SCSI controller

   echo "#### creating virtual machine ...####"
   qm create $vm_id --memory $vm_memory_size --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
   echo "#### done! ####"
}

importImage () {
   # import the downloaded disk to the local-lvm storage, attaching it as a SCSI drive
   #qm set $vm_id --scsi0 local-lvm:0,import-from=/path/to/bionic-server-cloudimg-amd64.img
   
   echo "#### importing image file ...####"
   qm set $vm_id --scsi0 $storage_name:0,import-from=$download_path$image_name
   echo "#### done! ####"
}

insertCD () {
    # insert image to CD-ROM

    echo "#### inserting image file to CD-ROM ...####"
    qm set $vm_id --ide2 $storage_name:cloudinit
    echo "#### done! ####"
}

setBootOrder () {
    # set boot order to use image as primary source

    echo "#### setting boot order ...####"
    qm set $vm_id --boot order=scsi0
    echo "#### done! ####"
}

setConsole () {
    # configure serial as display device

    echo "#### setting console device ...####"
    qm set $vm_id --serial0 socket --vga serial0
    echo "#### done! ####"
}

templateVM () {
    # convert VM as template

    echo "#### converting virtual machine as template ...####"
    qm template $vm_id
    echo "#### done! ####"
}

# call functions 
imageDownload
createVM
importImage
insertCD
setBootOrder
setConsole
templateVM