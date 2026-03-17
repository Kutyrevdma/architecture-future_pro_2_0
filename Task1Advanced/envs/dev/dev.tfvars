token     = "your-token"
cloud_id  = "your-cloud-id"
folder_id = "your-folder-id"

zone = "ru-central1-a"

name        = "vm-dev"
platform_id = "standard-v1"

cores  = 2
memory = 2

boot_disk_size = 20
boot_disk_type = "network-hdd"

data_disk_size = 10
data_disk_type = "network-hdd"

subnet_id  = "your-subnet-id"
enable_nat = true

ssh_public_key = "ssh-rsa AAAA..."

labels = {
  env = "dev"
}