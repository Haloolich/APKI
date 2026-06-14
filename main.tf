terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

resource "virtualbox_vm" "lab_vm" {
  count  = 2
  name   = "terraform-vm-${count.index + 1}"
  
  # Пряме посилання на образ
  image  = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-vagrant.box"
  
  cpus   = 6
  # Обов'язково вказуємо одиниці виміру "mib", щоб уникнути помилки "0 MB"
  memory = "4096 mib"

  network_adapter {
    type = "nat"
  }
}