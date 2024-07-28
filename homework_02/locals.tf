locals {
  vm_names = {
    web = "${var.vpc_name}-${var.vm_web_zone}-platform-web"
    db  = "${var.vpc_name}-${var.vm_db_zone}-platform-db"
  }
}