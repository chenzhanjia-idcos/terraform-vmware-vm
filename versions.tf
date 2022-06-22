terraform {
  required_providers {
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}
