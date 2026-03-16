name        = "vm-dev-01"
zone        = "ru-central1-a"
platform_id = "standard-v3"

cores  = 2
memory = 4

boot_disk_size = 20
boot_disk_type = "network-hdd"

data_disk_size = 50
data_disk_type = "network-hdd"

subnet_id = "subnet_id"
image_id  = "image_id"

ssh_public_key = "ssh_public_key"

enable_nat = true