Using module .\FiscalRegistrator\FiscalRegistrator.psm1

$fr = [FiscalRegistrator]::new('192.168.1.41')

$fr.Table1_1_NumberinStore(55)
