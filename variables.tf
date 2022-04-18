variable "ldcCode" {
    description = "(必填)数据中心"
    type = string
}

variable "datastore" {
    description = "存储"
    type = string
}
variable "domain" {
    description = "主机域"
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

variable "disk_label" {
    description = "系统盘标签"
    type        = list(any)
}
variable "data_disk_label" {
    description = "数据盘标签"
    type        = list(any)
}
variable "data_disk_size_gb" {
    description = "数据盘大小列表"
    type        = list(any)
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
