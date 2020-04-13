Using module .\FiscalRegistrator

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