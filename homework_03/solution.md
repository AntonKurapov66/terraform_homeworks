# Домашнее задание к занятию «Управляющие конструкции в коде Terraform» - Курапов Антон

* Задание 1
  *  Изучите проект.
  *  Заполните файл personal.auto.tfvars.
  *  Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.
  *  Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_0.PNG)

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_1.PNG)

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_2.PNG)

* Задание 2
  *  Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
  *  Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop. Используйте для обеих ВМ одну общую переменную типа:
```hcl
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```
При желании внесите в переменную все возможные параметры. 

  *  ВМ из пункта 2.1 должны создаваться после создания ВМ из пункта 2.2. 
  *  Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2. 6. Инициализируйте проект, выполните код.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_3.PNG)

* Задание 3
  *  Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
  *  Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_4.PNG)

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_5.PNG)

* Задание 4
  *  В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
  *  Инвентарь должен содержать 3 группы и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
  *  Добавьте в инвентарь переменную fqdn.
  *  Приложите скриншот получившегося файла.

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_6.PNG)

* Задание 5* (необязательное)
  *  Напишите output, который отобразит ВМ из ваших ресурсов count и for_each в виде списка словарей

* ![alt text](https://github.com/AntonKurapov66/terraform_homeworks/blob/main/homework_03/img/03_7.PNG)


ссылка на репозиторий с кодом https://github.com/AntonKurapov66/terraform_homeworks/tree/main/homework_03 
