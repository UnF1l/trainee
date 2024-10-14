terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "bastionhost" {
  name        = "bastion"
  platform_id = "standard-v2"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size     = 10
      image_id = var.ids["IMAGE_ID"]
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.ids["SUBNET_ID"]
    nat       = true
    security_group_ids = [var.SCGROUP_ID]
  }

  network_interface {
    subnet_id = var.ids["SUBNET_ID"]
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys  = "filipp:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHivJ09hymAbMQqWuK85BwZnEbVZKKwolJtt09n2DY6k"
    user-data = "${file("C:/Users/Philipp/meta.txt")}"
  }
}

resource "yandex_compute_instance" "privatehost" {
  name        = "private"
  platform_id = "standard-v2"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      size     = 10
      image_id = var.ids["IMAGE_ID"]
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = var.ids["SUBNET_ID"]
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys  = "filipp:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHivJ09hymAbMQqWuK85BwZnEbVZKKwolJtt09n2DY6k"
    user-data = "${file("C:/Users/Philipp/meta.txt")}"
  }
}