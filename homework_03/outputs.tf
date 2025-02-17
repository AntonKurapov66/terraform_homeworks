output "web_and_db_list" {
  value = [
    [
      for instance in yandex_compute_instance.web : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn
      }
    ],
    [
      for instance in yandex_compute_instance.db : {
      name = instance.name
      id   = instance.id
      fqdn = instance.fqdn
      }
    ]
  ]
}