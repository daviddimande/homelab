#!/bin/bash


# variables declaration

USERNAME=terraform-prov@pve
ROLE=terraformProv

# create user, role and assign necessary priviledges

pveum role add $ROLE -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
pveum user add $USERNAME --password 'password here' # token id is recommended
pveum aclmod / -user $USERNAME -role $ROLE