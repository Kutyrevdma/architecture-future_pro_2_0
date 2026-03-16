name = "vm-stage-01"
zone = "ru-central1-b"
platform_id = "standard-v3"

cores = 4
memory = 8

boot_disk_size = 40
boot_disk_type = "network-ssd"

data_disk_size = 100
data_disk_type = "network-ssd"

subnet_id = "subnet-stage"
image_id = "image-stage"

ssh_public_key = "ssh_public_key"

enable_nat = true
labels = { env = "stage" }
