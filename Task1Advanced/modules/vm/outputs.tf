output "vm_id" {
  value = yandex_compute_instance.vm.id
}

output "vm_name" {
  value = yandex_compute_instance.vm.name
}

output "vm_internal_ip" {
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "vm_external_ip" {
  value = try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, null)
}

output "data_disk_id" {
  value = yandex_compute_disk.data.id
}
