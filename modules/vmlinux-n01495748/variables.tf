variable "resource_group_name" {

}

variable "location" {
  
}

variable "linux_avs" {
  
}

variable "network_watcher_extension_version" {

  default = "1.4"
}

variable "azure_monitor_extension_version" {
 
  default = "1.29"
}

variable "common_tags" {
  
}

variable "storage_account_uri"{}

variable "linux_vm_names" {
    type = map(string)
    default = {
      "vm1" = "n01495748-c-vm1"
      #"vm2" = "n01495748-c-vm2"
      #"vm3" = "n01495748-c-vm3"
    }
}


variable "subnet_id" {

}


variable "size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  type    = string
  default = "n01495748"
}

variable "admin_password" {
  type    = string
  default = "himanshu@321"
}

variable "public_key" {
  type    = string
  default = "/home/himanshu/.ssh/id_rsa.pub"
}

variable "private_key" {
  type    = string
  default = "/home/himanshu/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "os_disk_size" {
  type    = number
  default = 32
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "publisher" {
  type    = string
  default = "OpenLogic"
}

variable "offer" {
  type    = string
  default = "CentOS"
}

variable "CentOS_version" {
  type    = string
  default = "latest"
}

variable "sku" {
  type    = string
  default = "8_2"
}



