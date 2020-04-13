# SetSettingsFiskalRegistratorShtrihM

Модуль Powershell для работы и насктройки фискальных регистраторами фирмы ШТРИХ-М и RR-Electro.

Вам понадобится:

  - Powershell 5.1
  - Драйвер фискального регистратора компании ШТРИХ-М установленный на вашем компьютере

# Как начать?

Скачиваем модуль и распаковываем в папку, удобную Вам. Например C:\SetSettingsFiskalRegistratorShtrihM
Открываем редактором кода файл inventoryFile.ps1 (Я использую Visual Studio Code с расширением для работы с Powershell)

```powershell
Using module .\FiscalRegistrator
$fr = [FiscalRegistrator]::new('') #Айпи адрес
```

 В файле модуля (.\FiscalRegistrator\FiscalRegistrator.psm1) смотрим нужные нам методы, создаем объект с ip адрессом фискальника который редактируем, применяем методы задвая значения, которые хотим получить.
 
 # Пример работы:
 Задача:
 Подготовить Фискальный регистратор для магазина с следующим образом:
 Номер кассы в магазине - 3
 Автоматическое обнуление денежной наличности - 1
 Запрет нулевого чека - 1
 Сервер ОФД - 91.107.67.212
 Порт ОФД - 7779
 
 Создаем объект для работы с фискальным регистратором в файле inventoryFile.ps1. Пусть у фискального регистратора будет IP адресс 192.168.1.41:
 
 ```powershell
Using module .\FiscalRegistrator
$fr = [FiscalRegistrator]::new('192.168.1.41') # IP Адресс принимается как Строка, по этому берем его в ковычки
```

Далее в файле .\FiscalRegistrator\FiscalRegistrator.psm1 ищем нужные нам методы:
 ```powershell
    # Номер кассы в магазине
    [void] Table1_1_NumberinStore ([int]$numberInStore){
    ...
    # Авт. Обнуление денежной наличности
    [void] Table1_2_AutoZeroingCash ([int]$AutoZeroingCash){
```
И так далее.

В файле inventoryFile.ps1 описываем нужные нам настройки через вызов методов:

 ```powershell
$fr = [FiscalRegistrator]::new('192.168.1.41') 

#Номер кассы в магазине - 3
$fr.Table1_1_NumberinStore(3)
#Автоматическое обнуление денежной наличности - 1
$fr.Table1_2_AutoZeroingCash(1)
#Запрет нулевого чека - 1
$fr.Table1_23_BanZeroCheck(1)
#Сервер ОФД - 91.107.67.212
$fr.Table19_1_OFDServer('91.107.67.212')
#Порт ОФД - 7779
$fr.Table19_2_OFDPort(7779)
```

##### Сохраняем файл inventoryFile.ps1 и запускаем его через Powershell (x86)

 ```powershell
 C:\SetSettingsFiskalRegistratorShtrihM\inventoryFile.ps1
 ```
 