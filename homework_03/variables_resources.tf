variable "vm_resource" {
  type = list(object({
    cores         = number
    core_fraction = number
    memory        = number
    platform      = string
    preemptible   = bool
    nat           = bool
  }))
  default = [
    {
      cores         = 2
      core_fraction = 20
      memory        = 1
      platform      = "standard-v3"
      preemptible   = true
      nat           = true
    }
  ]
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cores       = number
    memory      = number
    size        = number
    preemptible = bool
    nat         = bool
  }))
  default = [
    { vm_name = "main", cores = 4, memory = 4,  size = 50, preemptible = false, nat = true },
    { vm_name = "replica", cores = 2, memory = 2,  size = 20, preemptible = true, nat = true }
  ]
}

variable "storage-resource" {
    type = list(object({
      vm_name     = string
      platform_id = string
      cores       = number
      memory      = number
      preemptible = bool
      nat         = bool
  }))
    default = [
      { 
        vm_name     = "storage"
        platform_id = "standard-v3" 
        cores       = 2 
        memory      = 2   
        preemptible = true
        nat         = true  
      }
    ]
}
