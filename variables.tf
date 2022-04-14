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

variable "disk_size" {
    description = "磁盘大小"
    type = string
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

variable "inventory" {
    description = "主机组名称"
    type = string
}

variable "SoftwareIp" {
    description = "介质服务器IP"
    type = string
    #对于敏感变量，添加该参数声明为加密变量。
    sensitive   = true
}

variable "SoftwarePath" {
    description = "介质路径"
    type = string
    #对于敏感变量，添加该参数声明为加密变量。
    sensitive   = true
}

variable "rootUsername" {
    description = "root用户名"
    type = string
    #对于用户/密码敏感变量，添加该参数声明为加密变量。
    sensitive   = true
}
variable "rootPassword" {
    description = "数据库root密码"
    type = string
    #对于用户/密码敏感变量，添加该参数声明为加密变量。
    sensitive   = true
}
variable "replicationuser" {
    description = "主从复制用户"
    type = string
    #对于用户/密码敏感变量，添加该参数声明为加密变量。
    sensitive   = true    
}

variable "replicationpassword" {
    description = "主从复制用户密码"
    #对于用户/密码敏感变量，添加该参数声明为加密变量。
    sensitive   = true
}