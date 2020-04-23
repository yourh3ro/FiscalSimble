Using module .\FiscalRegistrator\FiscalRegistrator.psm1

$fr = [FiscalRegistrator]::new('192.168.1.41')

$fr.Table1_1_NumberinStore(15)
$fr.Table1_40_PrintSpeed(5)
$fr.Table1_23_BanZeroCheck(1)
