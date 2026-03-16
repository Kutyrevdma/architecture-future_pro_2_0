variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "platform_id" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "boot_disk_size" {
  type = number
}

variable "boot_disk_type" {
  type = string
}

variable "data_disk_size" {
  type = number
}

variable "data_disk_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "image_id" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "enable_nat" {
  type = bool
}

variable "labels" {
  type    = map(string)
  default = {}
}
