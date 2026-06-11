output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vm_public_ip" {
  value = module.compute.public_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
