provider "vsphere" {
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.idc_code
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.image
  datacenter_id = data.vsphere_datacenter.dc.id
}

locals {
  template_disk_count = length(data.vsphere_virtual_machine.template.disks)
}

resource "vsphere_virtual_machine" "vm" {
  count      = var.instance_number
  name             = var.instance_number > 1  ? format("%s%03d", var.instance_name, count.index + 1) : var.instance_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 0
  # 用这个参数可以控制等待ip 出来的结果
  wait_for_guest_ip_timeout = 2
  num_cpus = var.cpu
  memory   = var.memory
  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  firmware = data.vsphere_virtual_machine.template.firmware
  memory_hot_add_enabled = true
  cpu_hot_add_enabled = true
  cpu_hot_remove_enabled = true

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  dynamic "disk" {
    for_each = data.vsphere_virtual_machine.template.disks
    iterator = template_disks
    content {
      label            = length(var.disk_label) > 0 ? var.disk_label[template_disks.key] : "disk${template_disks.key}"
      size             = data.vsphere_virtual_machine.template.disks[template_disks.key].size
      unit_number      = var.scsi_controller != null ? var.scsi_controller * 15 + template_disks.key : template_disks.key
      thin_provisioned = data.vsphere_virtual_machine.template.disks[template_disks.key].thin_provisioned
      eagerly_scrub =  data.vsphere_virtual_machine.template.disks[template_disks.key].eagerly_scrub
    }
  }
  dynamic "disk" {
   for_each = var.data_disk_size_gb
   iterator = terraform_disks
   content {
     label = length(var.data_disk_label) > 0 ? var.data_disk_label[terraform_disks.key] : "disk${terraform_disks.key + local.template_disk_count}"
     size = var.data_disk_size_gb[terraform_disks.key]
     unit_number = length(var.data_disk_scsi_controller) > 0 ? var.data_disk_scsi_controller[terraform_disks.key] * 15 + terraform_disks.key + (var.scsi_controller == var.data_disk_scsi_controller[terraform_disks.key] ? local.template_disk_count : 0) : terraform_disks.key + local.template_disk_count
     thin_provisioned = var.thin_provisioned != null ? var.thin_provisioned[terraform_disks.key] : null
     eagerly_scrub = var.eagerly_scrub != null ? var.eagerly_scrub[terraform_disks.key] : null
}
}

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.instance_number > 1  ? format("%s%03d", "terraform", count.index + 1) : "terraform-test"
        domain    = var.domain
      }

      network_interface {
         ipv4_address = split(",", var.ips)[count.index]
         ipv4_netmask = var.netmask
      }
      ipv4_gateway = var.gateway
      dns_server_list = var.dns_server

    }

  }
}
