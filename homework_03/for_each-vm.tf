resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = each.value.vm_name
  resources {
    cores  = each.value.cores
    memory = each.value.memory

  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.size
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
  }
  metadata = {
    ssh-keys = local.ssh-key
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }
}
