resource "proxmox_vm_qemu" "cloud" {
  count = var.server_count

  name = "cloud${count.index}.${var.domain}" 
  desc = "cloud${count.index}" 
  vmid = "700${count.index}"

  target_node = var.proxmox_host

  clone = var.template_name 

  agent = 1 

  os_type = "cloud-init" # The OS type of the image clone
  cores = 2 # number of CPU cores
  sockets = 1 # number of CPU sockets
  cpu = "host" # The CPU type
  memory = 4096 # Amount of memory to allocate
  onboot = true # start the VM on host startup
  scsihw = "virtio-scsi-single" # Scsi hardware type
  bootdisk = "scsi0" # The boot disk scsi

  network {
    model = "virtio"
    bridge = "${var.bridge}"
  }

  ipconfig0 = "ip=192.168.250.17${count.index}/24,gw=192.168.250.1"
  nameserver = "192.168.250.53"

  lifecycle {
    ignore_changes = [
      network,
      target_node,
    ]
  }
  serial {
    id = 0
    type = "socket"
  }
}

