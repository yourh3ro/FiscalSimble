# SetSettingsFiskalRegistratorShtrihM

# ПРОЕКТ НАХОДИТСЯ В АКТИВНОЙ РАЗРАБОТКЕ. ВОЗМОЖНЫ КРУПНЫЕ ИЗМЕНЕНИЯ.

Модуль Powershell для настройки фискальных регистраторов семейства ШТРИХ-М

Вам понадобится:

  - Powershell 5.1
  - Драйвер фискального регистратора компании ШТРИХ-М установленный на Вашем компьютере

# Как начать?

Скачиваем модуль и распаковываем в папку.  
Например: *C:\SetSettingsFiskalRegistratorShtrihM*  
Описание настроек происходит в файле *inventoryFile.ps1*.  
В нем происходит создание объектов (Ваших фискальных регистраторов) и объявляются настройки, через методы и функции класса FiscalRegistrator.

```powershell
Using module .\FiscalRegistrator
$fr = [FiscalRegistrator]::new('')
```
 # Пример работы:
 Задача:  
 Фискальный регистратор с IP адресом 192.168.1.41  
 Задать на фискальном регистраторе с следующие настройки:  
| Таблица       | Настройка                       | Значение  |
| ------------- |:-------------:|                       -----:|
| Таблица 1  | Номер кассы в магазине             | 3 |
| Таблица 1  | Авт. обнуление денежной наличности | 1 |
| Таблица 1  | Запрет нулевого чека               | 1 |
| Таблица 19 | Сервер ОФД                         |91.107.67.212|
| Таблица 19 | Порт ОФД                           |7779|

 В файле *inventoryFile.ps1* создаем объект класса FiscalRegistartor
 
 ```powershell
Using module .\FiscalRegistrator

# IP Адрес фискального регистратора это Строка (string). Берем в кавычки.
$fr = [FiscalRegistrator]::new('192.168.1.41') 
```

Далее в файле модуля .\FiscalRegistrator\FiscalRegistrator.psm1 ищем методы, отвечающие за изменение нужных значений:

 ```powershell
    # Номер кассы в магазине
    [void] Table1_1_NumberinStore ([int]$numberInStore){
    ...
    # Авт. Обнуление денежной наличности
    [void] Table1_2_AutoZeroingCash ([int]$AutoZeroingCash){
```
И так далее.

В файле inventoryFile.ps1 вызываем методы и задем нужные значения:

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

Сохраняем *inventoryFile.ps1* и запускаем его через **Powershell (x86)**

 ```powershell
 C:\SetSettingsFiskalRegistratorShtrihM\inventoryFile.ps1
 ```
 