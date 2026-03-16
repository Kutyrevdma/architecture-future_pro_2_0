# Task2Advanced — Terraform + CI/CD + Remote State

## Цель задания

Автоматизировать развёртывание инфраструктуры с использованием Terraform, удалённого хранения состояния и CI/CD pipeline.

В рамках задания необходимо:

* использовать Terraform для описания инфраструктуры
* хранить Terraform state удалённо
* автоматизировать выполнение Terraform через CI/CD

---

# Архитектура решения

В проекте используется следующая схема:

GitHub Repository

|

|-- GitHub Actions (CI/CD)

|-- Terraform

|

Yandex Cloud

|

|-- Object Storage (S3 backend)

|-- Compute Cloud (VM)

---

# Структура репозитория

```
architecture-future_pro_2_0
│
├── .github
│   └── workflows
│       └── terraform.yml
│
└── Task2Advanced
    └── terraform
        ├── backend.tf
        ├── main.tf
        └── variables.tf
```

Описание файлов:

| Файл          | Назначение                           |
| ------------- | ------------------------------------ |
| backend.tf    | настройка удалённого Terraform state |
| main.tf       | описание инфраструктуры              |
| variables.tf  | входные переменные Terraform         |
| terraform.yml | CI/CD pipeline                       |

---

# Remote Terraform State

Для хранения состояния используется **Yandex Object Storage**, совместимое с S3.

Terraform backend настроен следующим образом:

* backend: **s3**
* storage: **Yandex Object Storage**
* state file: **terraform.tfstate**

Это позволяет:

* хранить состояние удалённо
* работать с Terraform из CI/CD
* избежать конфликтов состояния

---

# Инфраструктура

Terraform создаёт следующие ресурсы:

1. Boot disk
2. Additional disk
3. Virtual Machine

## Virtual Machine

Параметры VM:

* платформа: standard-v3
* CPU: задаётся через переменную
* RAM: задаётся через переменную
* boot disk: Ubuntu 22.04
* дополнительный диск
* сеть: VPC subnet

SSH доступ добавляется через metadata:

```
ssh-keys = "ubuntu:<public_key>"
```

---

# CI/CD Pipeline

Для автоматизации используется **GitHub Actions**.

Pipeline выполняет следующие шаги:

1. Checkout repository
2. Setup Terraform
3. Terraform Init
4. Terraform Validate
5. Terraform Plan
6. Terraform Apply (только для ветки main)

Workflow файл расположен:

```
.github/workflows/terraform.yml
```

---

# Использование Secrets

Все чувствительные данные хранятся в **GitHub Secrets**:

| Secret                | Назначение              |
| --------------------- | ----------------------- |
| AWS_ACCESS_KEY_ID     | доступ к Object Storage |
| AWS_SECRET_ACCESS_KEY | доступ к Object Storage |
| TF_VAR_token          | токен Yandex Cloud      |
| TF_VAR_cloud_id       | cloud id                |
| TF_VAR_folder_id      | folder id               |
| TF_VAR_zone           | зона                    |
| TF_VAR_subnet_id      | subnet                  |
| TF_VAR_ssh_key        | SSH ключ                |
| TF_VAR_vm_name        | имя VM                  |
| TF_VAR_disk_size_gb   | размер диска            |
| TF_VAR_cores          | CPU                     |
| TF_VAR_memory         | RAM                     |

Secrets используются в pipeline как переменные окружения.

---

# Проверка работы

После push в репозиторий GitHub Actions автоматически запускает pipeline.

Pipeline выполняет Terraform команды:

```
terraform init
terraform validate
terraform plan
```

При push в ветку **main** выполняется также:

```
terraform apply
```

После выполнения в **Yandex Cloud** создаётся виртуальная машина.

---

# Проверка ресурсов

Созданные ресурсы можно увидеть в:

Yandex Cloud → Compute Cloud → Virtual Machines

Создаётся VM:

```
vm-dev-01
```

Также создаются два диска:

* boot disk
* additional disk

---

# Итог

В результате выполнения задания реализовано:

* Terraform инфраструктура
* удалённое хранение состояния
* автоматический CI/CD pipeline
* безопасное хранение секретов

Инфраструктура автоматически разворачивается через GitHub Actions.
