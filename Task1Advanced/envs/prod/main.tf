terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.90.0"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

module "vm" {
  source = "../../modules/vm"

  name        = var.name
  platform_id = var.platform_id
  zone        = var.zone

  cores  = var.cores
  memory = var.memory

  image_id = data.yandex_compute_image.ubuntu.id

  boot_disk_size = var.boot_disk_size
  boot_disk_type = var.boot_disk_type

  data_disk_size = var.data_disk_size
  data_disk_type = var.data_disk_type

  subnet_id  = var.subnet_id
  enable_nat = var.enable_nat

  ssh_public_key = var.ssh_public_key
  labels         = var.labels
}