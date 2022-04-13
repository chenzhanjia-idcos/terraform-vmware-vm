terraform {
  required_providers {
    ansible = {
      source = "registry.cloudiac.org/nbering/ansible"
      version = "1.0.4"
    }
    vsphere = {
      source  = "registry.cloudiac.org/hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}
