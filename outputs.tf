output "resource_group" {
  value = module.rgroup-n01495748.resource_group.name
}

output "virtual_network_name" {
  value = module.network-n01495748.virtual_network_name
}

output "subnet_name" {
  value = module.network-n01495748.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common-services-n01495748.log_analytics_workspace_name
}

output "recovery_vault_name" {
  value = module.common-services-n01495748.recovery_vault_name
}

output "storage_account_name" {
  value = module.common-services-n01495748.storage_account_name
}

output "linux_vm_hostnames" {
  value = module.vmlinux-n01495748.linux_vm_hostnames
}

output "linux_domain_names" {
  value = module.vmlinux-n01495748.linux_domain_names
}

output "linux_private_ip_addresses" {
  value = module.vmlinux-n01495748.linux_private_ip_addresses
}

output "linux_public_ip_addresses" {
  value = module.vmlinux-n01495748.linux_public_ip_addresses
}

output "linux_vm_id" {
  value = module.vmlinux-n01495748.linux_vm_ids
}

output "windows_vm_hostnames" {
  value = module.vmwindows-n01495748.vm_hostname_windows
}

output "windows_vm_private_ip" {
  value = module.vmwindows-n01495748.private_ip_addresses_windows
}

output "windows_vm_public_ip" {
  value = module.vmwindows-n01495748.public_ip_addresses_windows
}

output "windows_vm_fqdn" {
  value = module.vmwindows-n01495748.vm_fqdn_windows
}

output "window_vm_id" {
  value = module.vmwindows-n01495748.vm_ids
}

output "loadbalancer_name" {
  value = module.loadbalancer-n01495748.loadbalancer
  
}

output "database_name" {
  value = module.database-n01495748.db_name
  
}

