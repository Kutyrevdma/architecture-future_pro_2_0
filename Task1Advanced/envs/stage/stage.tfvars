token     = "your-token"
cloud_id  = "your-cloud-id"
folder_id = "your-folder-id"

zone = "ru-central1-b"

name        = "vm-stage"
platform_id = "standard-v2"

cores  = 4
memory = 4

boot_disk_size = 40
boot_disk_type = "network-hdd"

data_disk_size = 50
data_disk_type = "network-hdd"

subnet_id  = "your-subnet-id"
enable_nat = true

ssh_public_key = "ssh-rsa AAAA..."

labels = {
  env     = "stage"
  project = "future20"
}