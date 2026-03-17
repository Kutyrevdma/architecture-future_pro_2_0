token     = "your-token"
cloud_id  = "your-cloud-id"
folder_id = "your-folder-id"

zone = "ru-central1-b"

name        = "vm-prod-01"
platform_id = "standard-v3"

cores  = 8
memory = 16

boot_disk_size = 80
boot_disk_type = "network-ssd"

data_disk_size = 200
data_disk_type = "network-ssd"

subnet_id  = "your-subnet-id"
enable_nat = false

ssh_public_key = "ssh-rsa AAAA..."

labels = {
  env     = "prod"
  project = "future20"
  tier    = "critical"
}