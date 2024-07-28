# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» - Курапов Антон

## Задание 1

 * репозиторий с кодом https://github.com/AntonKurapov66/terraform_homeworks/tree/main/homework_02
 
 * скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;

 * ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_0.PNG)
 
 * скриншот консоли, curl должен отобразить тот же внешний ip-адрес;

 * ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_1.PNG)

 * ответы на вопросы:
   *  1. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

   неправильное наименование типа физического процессора, вместо standard было напсиано standart, так же минимальное кол-во ядер в яндекс =2, в файле было указано 1

   *  2. Как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.

   preemptible = true - обеспечивает остановку ВМ при ее неактивности за последние 24 часа, что экономит рессурсы биллинга(дс)
   core_fraction=5 - экономит так же ресурсы биллинга (дс) и создает самую минимальную ВМ для проверки выполненных заданий.

## Задание 2

Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
Проверьте terraform plan. Изменений быть не должно.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_2.PNG)

## Задание 3
Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"
Примените изменения.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_3.PNG)

## Задание 4
Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_4.PNG)

все изменения для задач 1-4 были внесены комитом https://github.com/AntonKurapov66/terraform_homeworks/commit/8fb7c65d508f2d679b470235d2245b54c7989c20

## Задание 5
В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
Примените изменения.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_02/img/02_5.PNG)

комит https://github.com/AntonKurapov66/terraform_homeworks/commit/306c6acb7306a30c01a3e2164f3aeae414caa6d1

## Задание 6
Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map(object).

комит https://github.com/AntonKurapov66/terraform_homeworks/commit/0060752531ba0d6577daab97849d4d4c9b111371