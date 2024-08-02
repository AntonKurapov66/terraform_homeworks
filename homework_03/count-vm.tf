resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"
  platform_id = var.vm_resource[0].platform
  resources {
    cores           = var.vm_resource[0].cores
    core_fraction   = var.vm_resource[0].core_fraction
    memory          = var.vm_resource[0].memory
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_resource[0].nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  
  metadata = {
    ssh-keys = local.ssh-key
  }


  scheduling_policy {
    preemptible = var.vm_resource[0].preemptible
  }
  depends_on = [
    yandex_vpc_security_group.example,
    yandex_compute_instance.db["main"],
    yandex_compute_instance.db["replica"]
  ]
}
