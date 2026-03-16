name        = "vm-prod-01"
zone        = "ru-central1-b"
platform_id = "standard-v3"

cores  = 8
memory = 16

boot_disk_size = 80
boot_disk_type = "network-ssd"

data_disk_size = 200
data_disk_type = "network-ssd"

subnet_id = "subnet_id"
image_id  = "image_id"

ssh_public_key = "ssh_public_key"

enable_nat = false

labels = {
  env     = "prod"
  project = "future20"
  tier    = "critical"
}
