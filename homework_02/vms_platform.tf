variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_web_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_web_cores" {
  type    = number
  default = 2
}

variable "vm_web_memory" {
  type    = number
  default = 1
}

variable "vm_web_core_fraction" {
  type    = number
  default = 20
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

variable "vm_db_cores" {
  type    = number
  default = 2
}

variable "vm_db_memory" {
  type    = number
  default = 2
}

variable "vm_db_core_fraction" {
  type    = number
  default = 20
}

variable "vm_db_preemptible" {
  type    = bool
  default = true
}

/*variable "vmrunners" {
  type = list(object({
    name            = string
    cores           = number
    core_fraction   = number
    memory          = number
    platform        = string
    preemptible     = bool
    zone            = string
  }))
  default = [
    {
      name            = "netology-develop-platform-web"
      cores           = 2
      core_fraction   = 20
      memory          = 1
      platform        = "standard-v3"
      preemptible     = true
      zone            = "ru-central1-a"
    },
    {
      name            = "netology-develop-platform-db"
      cores           = 2
      core_fraction   = 20
      memory          = 2
      platform        = "standard-v3"
      preemptible     = true
      zone            = "ru-central1-b"
    }
  ]
}
*/ 

