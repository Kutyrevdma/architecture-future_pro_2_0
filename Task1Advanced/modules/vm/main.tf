resource "yandex_compute_disk" "data" {
  name = "${var.name}-data"
  type = var.data_disk_type
  size = var.data_disk_size
  zone = var.zone
}

resource "yandex_compute_instance" "vm" {
  name        = var.name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.boot_disk_size
      type     = var.boot_disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  secondary_disk {
    disk_id = yandex_compute_disk.data.id
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  labels = var.labels
}
