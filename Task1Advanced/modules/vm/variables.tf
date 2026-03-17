variable "name" {
  type        = string
  description = "Имя виртуальной машины"
}

variable "platform_id" {
  type        = string
  description = "Платформа ВМ (например: standard-v1)"
}

variable "zone" {
  type        = string
  description = "Зона размещения"
}

variable "cores" {
  type        = number
  description = "Количество CPU"
}

variable "memory" {
  type        = number
  description = "Объем RAM (ГБ)"
}

variable "image_id" {
  type        = string
  description = "ID образа"
}

variable "boot_disk_size" {
  type        = number
  description = "Размер boot-диска (ГБ)"
}

variable "boot_disk_type" {
  type        = string
  description = "Тип boot-диска"
}

variable "data_disk_size" {
  type        = number
  description = "Размер дополнительного диска (ГБ)"
}

variable "data_disk_type" {
  type        = string
  description = "Тип дополнительного диска"
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
}

variable "enable_nat" {
  type        = bool
  description = "Включить внешний IP"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH публичный ключ"
}

variable "labels" {
  type        = map(string)
  description = "Метки ресурса"
  default     = {}
}