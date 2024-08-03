output "web_list" {
  value = [
    for instance in yandex_compute_instance.web : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn
    }
  ]
}
output "db_list" {
  value = [
    for instance in yandex_compute_instance.db : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn 
    }
  ]
}