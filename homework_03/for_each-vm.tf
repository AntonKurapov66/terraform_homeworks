variable "each_vm" {
  type = list(object({
    vm_name     = string
    cores       = number
    memory      = number
    size        = number
    preemptible = bool
  }))
  default = [
    { vm_name = "main", cores = 2, memory = 2,  size = 50, preemptible = true },
    { vm_name = "replica", cores = 2, memory = 1,  size = 20, preemptible = true }
  ]
}
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
    nat       = true
  }
  metadata = {
    serial-port-enable = "1"
    ssh-keys = local.ssh-key.default
  }
  scheduling_policy {
    preemptible = each.value.preemptible
  }
}
