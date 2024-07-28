locals {
  vm_names = {
    web = "${var.vpc_name}-${var.vms_resources.web.zone}-platform-web"
    db  = "${var.vpc_name}-${var.vms_resources.db.zone}-platform-db"
  }
}