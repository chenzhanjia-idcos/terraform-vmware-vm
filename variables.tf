variable "ldcCode" {
    description = "(必填)数据中心"
    type = string
}

variable "datastore" {
    description = "存储"
    type = string
}

variable "resource_pool" {
    description = "资源池名称"
    type = string
}

variable "network" {
    description = "数据中心名称"
    type = string
}

variable "image" {
    description = "镜像"
    type = string
}

variable "instancename" {
    description = "主机名称"
    type = string
}

variable "instance_number" {
}

variable "cpu" {
    description = "CPU"
}

variable "memory" {
    description = "内存"
}

variable "ips" {
    description = "每个虚拟机的ipv4网络地址,每个中间千万不能有空格"
    type = string
}

variable "netmask" {
    description = "掩码"
    type = string
}

variable "gateway" {
    description = "网关"
    type = string
}

variable "dns_server" {
    description = "DNS域名解析"
    type = list(string)
}

variable "domain" {
    description = "主机域"
    type = string
}

variable "disk_label" {
    description = "系统盘标签"
    type        = list
    default     = []
}

variable "scsi_controller" {
  description = "scsi_controller number for the main OS disk"
  type        = number
  default     = 0
}
variable "data_disk_scsi_controller" {
  description = "scsi_controller number for the data disk, should be equal to number of defined data disk"
  type        = list
  default     = []
}

variable "data_disk_label" {
 description = "Storage data disk labels"
 type = list
 default = []
}
variable "data_disk_size_gb" {
 description = "List of storage data disk size"
 type = list
}

variable "thin_provisioned" {
  description = "If true,this disk is thin provisioned,with space for the file being allocated on an as-needed basis."
  type = list
  default = null
}

variable "eagerly_scrub" {
  description = "iif set to true ,the disk space is zeroed out on VM creation.This will delay the creation of the disk or virtual machine.Cannot be set to true when thin_provisioned is true."
  type = list
  default = null
}

# variable "inventory" {
#     description = "主机组名称"
#     type = string
#     default = "cloudiac"
# }

# variable "adminpassword" {
#     description = "主机组名称"
#     type = string
#     #对于用户/密码敏感变量，添加该参数声明为加密变量。
#     sensitive   = true
# }

# variable "secretkey" {
#     description = "主机组名称"
#     type = string
#     #对于用户/密码敏感变量，添加该参数声明为加密变量。
#     sensitive   = true
# }

# variable "mysqluser" {
#     description = "主机组名称"
#     type = string
#     #对于用户/密码敏感变量，添加该参数声明为加密变量。
#     sensitive   = true
# }

# variable "mysqlpassword" {
#     description = "主机组名称"
#     type = string
#     #对于用户/密码敏感变量，添加该参数声明为加密变量。
#     sensitive   = true
# }

# variable "DOCKER_REGISTRY" {
#     description = "主机组名称"
#     type = string
# }
