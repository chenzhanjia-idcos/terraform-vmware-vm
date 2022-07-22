### Module 介绍:  
该 Module 定义创建 VMware 虚拟机基础设施模板。  

### v1.0.0 版本特性：  
支持自定义虚拟机规格  
支持 RHEL/CentOS 虚拟机创建  
支持自定义数据盘大小  
  
### 配置参考  
配置以下参数用于正常供给您的基础设施资源：  
- `ldcCode` - (必填) 数据中心。  
- `datastore` -（必填）数据存储。  
- `resource_pool` - （必填）资源池  
- `network` - （必填）网络  
- `image` - （必填）镜像  
- `data_disk_size_gb` - （必填）数据盘大小列表  
- `ips` - （必填）虚拟机ip地址，格式"127.0.0.1,127.0.0.2"  
- `netmask` - （必填）子网掩码  
- `gateway` - （必填）网关  
- `dns_server` - （必填）DNS域名解析",格式["127.0.0.1"]  
- `data_disk_label` - （可选）数据盘标签  
- `thin_provisioned` - （可选）数据磁盘是否精简  
- `eagerly_scrub` - （可选）数据磁盘空间是否清零  
- `scsi_controller` - （可选）系统磁盘控制器  
- `data_disk_scsi_controller` - （可选）数据磁盘控制器  
- `domain` - （可选）主机域，默认"test.internal"  
- `cpu` - （可选）虚拟机CPU配置，默认2C  
- `memory` - （可选）虚拟机内存配置，默认：4096，单位MB  
- `disk_label` - （可选）系统盘标签  
- `instancename` - （可选）主机名称  
- `instance_number` - （可选）创建实例数量，默认值为2台  

只要设置了上述变量赋值，您应该可以使用任何 VMWare 环境进行虚拟机创建。

在 [CloudIaC](https://online.cloudiac.org/) 平台使用 `Stack` 请查阅：https://idcos.yuque.com/gaqddv/xgutta/ckuzhw

### 目录结构说明
```
.
├── main.tf                     # terraform 主配置文件(必选)
├── variables.tf                # terraform input 变量定义(必选)
├── outputs.tf                  # terraform output 变量定义(必选)
├── README.md                   # 自述文件(必选)
└── provider.tf                 # 指定依赖的 providers 及其版本(必选)                     
```

### 具体文件说明
README.md  
项目说明文档，该文件的内容会在 IaC Exchange 平台的云模板概览页展示。  

main.tf  
云模板主配置文件，在该文件中进行基础设施定义。  

provider.tf  
该文件中定义依赖的 terraform 版本、providers 及其版本，IaC 会解析该文件进行 provider 的缓存。  

variables.tf  
输入变量定义。  
IaC 会解析该文件，在进行云模板的变量配置时会展示解析出的变量名称、描述、默认值。  

outputs.tf  
输出变量定义。  