# Чек-лист готовности к домашнему заданию
### Скачайте и установите Terraform версии ~>1.8.4 . Приложите скриншот вывода команды terraform --version. 
### Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории 01/src.
### Убедитесь, что в вашей ОС установлен docker.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_0_0.PNG)

# Задание 1
### Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
### Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
* думаю что допустимо сохранять в файле "personal.auto.tfvars". Файл исключен из контроля версий и не будет загружен в репозиторий, что обеспечивает безопасность данных, находящихся в файле.
### Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_1.PNG)
* "result": "FMIt5i6JkEkaCV9u" 
### Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_2.PNG)
* для ресурса docker_image не было добавлено имя, для ресурса docker_container подобрано неверное имя, внутри ресурса docker_container недейсвтительная переменная random_password.random_string_FAKE.resulT, изменена на random_password.random_string.result.
### Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_3.PNG)
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_5.PNG)
```hcl
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "container_nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.resault}"

  ports {
    internal = 80
    external = 9090
  }
}
```
### Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
* Ключ -auto-approve автоматически подтверждает выполнение плана изменений Terraform без запроса на ручное подтверждение. Это может быть опасно, так как случайные или непреднамеренные изменения могут быть применены без вашего ведома, что может привести к потере данных, простою систем или другим нежелательным последствиям.Ключ -auto-approve может быть полезен в автоматизированных сценариях, таких как CI/CD пайплайны, где требуется автоматическое выполнение Terraform-планов без участия пользователя.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_6.PNG)
### Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_01/img/01_7.PNG)
```hcl
{
  "version": 4,
  "terraform_version": "1.8.4",
  "serial": 11,
  "lineage": "928a6b4e-600c-8170-1d18-f4d161d06a7f",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
### Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )
* Образ не был удален по причине того что мы использовали опцию keep_locally: true, которая в свою очередь подтверждает что образ должен сохраниться при выполнении операции terraform destroy 
* keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
