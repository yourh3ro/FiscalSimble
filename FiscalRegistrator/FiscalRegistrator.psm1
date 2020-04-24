

class TCPWorkWithFR {
    [string]$ipAddressFR
    [System.__ComObject]$drvFR

    TCPWorkWithFR([string]$ipAddressFR) {
        $this.drvFR = New-Object -ComObject AddIn.DrvFR
        $this.ipAddressFR = $ipAddressFR
    }

    [void] ConnectToFR() {
        $this.drvFR.UseIPAddress   = $true
        $this.drvFR.IPAddress      = $this.ipAddressFR
        $this.drvFR.Password       = 30
        $this.drvFR.ConnectionType = 6
        $this.drvFR.ProtocolType   = 0
        $this.drvFR.TCPPort        = 7778
        $this.drvFR.Timeout        = 5000
    }

    [void] DisconectToFR() {
        $this.drvFR.Disconnect()
    }

    [void] RebootFR(){
        $this.drvFR.Reboot()
        Start-Sleep -Seconds 10
        $this.ConnectToFR()
    }

    [void]editingValueString([int]$tableNumber, [int]$rowNumber, [int]$fieldNumber, [string]$valueString){
        $this.ConnectToFR()
        $this.drvFR.TableNumber        = $tableNumber
        $this.drvFR.RowNumber          = $rowNumber
        $this.drvFR.FieldNumber        = $fieldNumber
        $this.drvFR.ValueOfFieldString = $valueString
        $this.drvFR.GetFieldStruct()
        $this.drvFR.WriteTable()
        $this.DisconectToFR()
    }

    [void]editingValueInt([int]$tableNumber, [int]$rowNumber, [int]$fieldNumber, [int]$valueInt){
        $this.ConnectToFR()
        $this.drvFR.TableNumber        = $tableNumber
        $this.drvFR.RowNumber          = $rowNumber
        $this.drvFR.FieldNumber        = $fieldNumber
        $this.drvFR.ValueOfFieldInteger = $valueInt
        $this.drvFR.GetFieldStruct()
        $this.drvFR.WriteTable()
        $this.DisconectToFR()
    }

}

class FiscalRegistrator {
    
    $connect = [TCPWorkWithFR]::new($this.ipAddress)

    FiscalRegistrator([string]$ipAddress){
        $this.connect.ipAddressFR = $ipAddress
    }

    <#
    Таблица № 1
    Тип и режим кассы
    #>

    # Номер кассы в магазине
    [void]Table1_1_NumberinStore ([int]$numberInStore){
        if ($numberInStore -ge 1 -and $numberInStore -le 99){
        $this.connect.editingValueInt(1, 1, 1, $numberInStore)
        Write-Host ' Номер кассы в магазине = '$numberInStore}
        else {
        Write-Host ' ERROR | Значение свойства номер кассы в магазине = 1...99'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Авт. Обнуление денежной наличности
    [void] Table1_2_AutoZeroingCash ([int]$AutoZeroingCash){
        if ($AutoZeroingCash -ge 0 -and $AutoZeroingCash -le 1){
        $this.connect.editingValueInt(1, 1, 2, $AutoZeroingCash)
        Write-Host ' Авт. Обнуление денежной наличности = '$AutoZeroingCash}
        else {
            Write-Host ' ERROR | Значение Авт. Обнуление денежной наличности = 0...1'
            Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Печать рекламного текста
    [void] Table1_3_PrintReklamaText ([int]$PrintReklamaText){
        if ($PrintReklamaText -ge 0 -and $PrintReklamaText -le 3){
        $this.connect.editingValueInt(1, 1, 3, $PrintReklamaText)
        Write-Host ' Печать рекламного текста = '$PrintReklamaText}
        else {
            Write-Host ' ERROR | Значение Печать рекламного текста = 0...3'
            Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Печать необнуляемой суммы
    [void] Table1_4_PrintNonZeroAmount ([int]$PrintNonZeroAmount){
        if ($PrintNonZeroAmount -ge 0 -and $PrintNonZeroAmount -le 3){
        $this.connect.editingValueInt(1, 1, 5, $PrintNonZeroAmount)
        Write-Host ' Печать необнуляемой суммы = '$PrintNonZeroAmount}
        else {
            Write-Host ' ERROR | Значение Печать необнуляемой суммы = 0...3'
            Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Работа с денежным ящиком
    [void] Table1_6_WorkWithCashDrawer ([int]$WorkWithCashDrawer){
        if ($WorkWithCashDrawer -ge 0 -and $WorkWithCashDrawer -le 1){
        $this.connect.editingValueInt(1, 1, 6, $WorkWithCashDrawer)
        Write-Host ' Работа с денежным ящиком = '$WorkWithCashDrawer}
     else {
        Write-Host ' ERROR | Значение Работа с денежным ящиком = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Отрезка чека
    [void] Table1_7_CutCheck ([int]$CutCheck){
        if ($CutCheck -ge 0 -and $CutCheck -le 2){
        $this.connect.editingValueInt(1, 1, 7, $CutCheck)
        Write-Host ' Отрезка чека = '$CutCheck}
        else {
        Write-Host ' ERROR | Значение Отрезка чека = 0...2'
        Write-Host ' ERROR | Значение свойства не будет присвоено'    
        }
    }

    # Печатать дробное в количестве
    [void] Table1_8_PrintDecimalInQuanity ([int]$DecimalInQuanity){
        if ($DecimalInQuanity -ge 0 -and $DecimalInQuanity -le 1){
        $this.connect.editingValueInt(1, 1, 8, $DecimalInQuanity)
        Write-Host ' Печатать дробное в количестве = '$DecimalInQuanity}
        else {
        Write-Host ' ERROR | Значение Печатать дробное в количестве = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Лог. уровень дат. денежного ящика
    [void] Table1_9_LogLevelDatCashDrawer ([int]$LogLevelDatCashDrawer){
        if ($LogLevelDatCashDrawer -ge 0 -and $LogLevelDatCashDrawer -le 1){
        $this.connect.editingValueInt(1, 1, 9, $LogLevelDatCashDrawer)
        Write-Host ' Лог. уровень дат. денежного ящика = '$LogLevelDatCashDrawer}
        else {
        Write-Host ' ERROR | Значение Печатать Лог. уровень дат. денежного ящика = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Длительность имп. денежного ящика
    [void] Table1_10_PulseDurationCashDrawer ([int]$PulseDurationCashDrawer){
        if ($PulseDurationCashDrawer -ge 0 -and $PulseDurationCashDrawer -le 255){
        $this.connect.editingValueInt(1, 1, 10, $PulseDurationCashDrawer)
        Write-Host ' Длительность имп. денежного ящика = '$PulseDurationCashDrawer}
        else {
        Write-Host ' ERROR | Значение Длительность имп. денежного ящика = 0...255'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }  

    # Длительность паузы имп. денежного ящика
    [void] Table1_11_PauseDurationCashDrawer ([int]$PauseDurationCashDrawer){
        if ($PauseDurationCashDrawer -ge 0 -and $PauseDurationCashDrawer -le 255){
        $this.connect.editingValueInt(1, 1, 11, $PauseDurationCashDrawer)
        Write-Host ' Длительность паузы имп. денежного ящика = '$PauseDurationCashDrawer}
        else {
        Write-Host ' ERROR | Значение Длительность паузы имп. денежного ящика = 0...255'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    } 

    # Количество имп. денежного ящика
    [void] Table1_12_ImpulseCountCashDrawer ([int]$ImpulseCountCashDrawer){
        if ($ImpulseCountCashDrawer -ge 0 -and $ImpulseCountCashDrawer -le 255){
        $this.connect.editingValueInt(1, 1, 12, $ImpulseCountCashDrawer)
        Write-Host ' Количество имп. денежного ящика = '$ImpulseCountCashDrawer}
        else {
        Write-Host ' ERROR | Значение Количество имп. денежного ящика = 0...255'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Использование весовых датчиков
    [void] Table1_13_UseWeightSensor ([int]$UseWeightSensor){
        if ($UseWeightSensor -ge 0 -and $UseWeightSensor -le 1){
        $this.connect.editingValueInt(1, 1, 13, $UseWeightSensor)
        Write-Host ' Использование весовых датчиков = '$UseWeightSensor}
        else {
        Write-Host ' ERROR | Значение Использование весовых датчиков = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Начисление налогов
    [void] Table1_14_TaxCharge ([int]$TaxCharge){
        if ($TaxCharge -ge 0 -and $TaxCharge -le 1){
        $this.connect.editingValueInt(1, 1, 14, $TaxCharge)
        Write-Host ' Начисление налогов = '$TaxCharge}
        else {
        Write-Host ' ERROR | Значение Начисление налогов = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Автоматический перевод времени
    # Диапазон от 0 до 0 (???). Скорее всгео не используется
    <#
    [void] Table1_15_AutoTimeTransfer ([int]$AutoTimeTransfer){
        $this.connect.editingValueInt(1, 1, 15, $AutoTimeTransfer)
    }
    #>

    # Печать налогов
    [void] Table1_16_PrintTaxes ([int]$PrintTaxes){
        if ($PrintTaxes -ge 0 -and $PrintTaxes -le 3){
        $this.connect.editingValueInt(1, 1, 16, $PrintTaxes)
        Write-Host ' Печать налогов = '$PrintTaxes}
        else {
        Write-Host ' ERROR | Значение Печать налогов = 0...3'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Печать заголовка
    [void] Table1_17_PrintTitle ([int]$PrintTitle){
        if ($PrintTitle -ge 0 -and $PrintTitle -le 1){
        $this.connect.editingValueInt(1, 1, 17, $PrintTitle)
        Write-Host ' Печать заголовка = '$PrintTitle}
        else {
        Write-Host ' ERROR | Значение Печать налогов = 0...3'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    <#
    # Печать единичного количества
    # Диапазон 1...1. Скорее всего не используется
    [void] Table1_18_PrintSingleQuantity ([int]$PrintSingleQuantity){
        $this.connect.editingValueInt(1, 1, 18, $PrintSingleQuantity)
    }
    #>

    <#
    # Сохранять строки в буфере чека
    # Диапазон 1...1. Скорее всего не используется
    [void] Table1_19_SaveStringsInClipboard ([int]$SaveStringsInClipboard){
        $this.connect.editingValueInt(1, 1, 19, $SaveStringsInClipboard)
    }
    #>

    <#
    # Печать чека по закрытию
    # Диапазон 1...1. Скорее всего не используется
    [void] Table1_20_PrintCheckWhenClosed ([int]$PrintCheckWhenClosed){
        $this.connect.editingValueInt(1, 1, 20, $PrintCheckWhenClosed)
    }
    #>

    # Промотка перед отрезкой
    [void] Table1_21_RewindBeforeCut ([int]$RewindBeforeCut){
        if ($RewindBeforeCut -ge 0 -and $RewindBeforeCut -le 1){
        $this.connect.editingValueInt(1, 1, 21, $RewindBeforeCut)
        Write-Host ' Промотка перед отрезкой = '$RewindBeforeCut}
        else {
        Write-Host ' ERROR | Значение Промотка перед отрезкой = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Отрезка при открытом чеке
    [void] Table1_22_CutWhenCheckOpen ([int]$CutWhenCheckOpen){
        if ($CutWhenCheckOpen -ge 0 -and $CutWhenCheckOpen -le 1){
        $this.connect.editingValueInt(1, 1, 22, $CutWhenCheckOpen)
        Write-Host ' Отрезка при открытом чеке = '$CutWhenCheckOpen}
        else {
        Write-Host ' ERROR | Значение Отрезка при открытом чеке = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Запрет нулевого чека
    [void] Table1_23_BanZeroCheck ([int]$BanZeroCheck){
        if ($BanZeroCheck -ge 0 -and $BanZeroCheck -le 1){
        $this.connect.editingValueInt(1, 1, 23, $BanZeroCheck)
        Write-Host ' Запрет нулевого чека = '$BanZeroCheck}
        else {
        Write-Host ' ERROR | Значение Запрет нулевого чека = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Отступ в строке типов оплаты
    [void] Table1_24_IndientPaymentTypes ([int]$IndientPaymentTypes){
        if ($IndientPaymentTypes -ge 0 -and $IndientPaymentTypes -le 1){
        $this.connect.editingValueInt(1, 1, 24, $IndientPaymentTypes)
        Write-Host ' Отступ в строке типов оплаты = '$IndientPaymentTypes}
        else {
        Write-Host ' ERROR | Значение Отступ в строке типов оплаты = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Использование Форматирования в чеке
    [void] Table1_25_UseFormattingInCheck ([int]$UseFormattingInCheck){
        if ($UseFormattingInCheck -ge 0 -and $UseFormattingInCheck -le 1){
        $this.connect.editingValueInt(1, 1, 25, $UseFormattingInCheck)
        Write-Host ' Использование форматирования в чеке'}
        else {
            Write-Host ' ERROR | Значение Использование форматирования в чеке = 0...1'
            Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Обнуление счетчика чеков
    [void] Table1_26_ResetCounterChecks ([int]$ResetCounterChecks){
        if ($ResetCounterChecks -ge 0 -and $ResetCounterChecks -le 1){
        $this.connect.editingValueInt(1, 1, 26, $ResetCounterChecks)
        Write-Host ' Обнуление счетчика чеков = '$ResetCounterChecks}
        else {
        Write-Host ' ERROR | Значение Обнуление счетчика чеков = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Контроль времени
    [void] Table1_27_TimeControl ([int]$TimeControl){
        if ($TimeControl -ge 0 -and $TimeControl -ge 99){
        $this.connect.editingValueInt(1, 1, 27, $TimeControl)
        Write-Host ' Контроль времени = '$TimeControl}
        else {
        Write-Host ' ERROR | Значение Контроль времени = 0...99'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Отключение звука при ошибках
    [void] Table1_28_MuteWhenError ([int]$MuteWhenError){
        if ($MuteWhenError -ge 0 -and $MuteWhenError -le 1){
        $this.connect.editingValueInt(1, 1, 28, $MuteWhenError)
        Write-Host ' Отключение звука при ошибках = '$MuteWhenError}
        else {
        Write-Host ' ERROR | Значение Отключение звука при ошибках = 0...99'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Межстрочный интервал
    [void] Table1_29_LineInterval ([int]$LineInterval){
        if ($LineInterval -ge 0 -and $LineInterval -le 10){
        $this.connect.editingValueInt(1, 1, 29, $LineInterval)
        Write-Host ' Межстрочный интервал = '$LineInterval}
        else {
        Write-Host ' ERROR | Значение Межстрочный интервал = 0...10'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Тип суточного отчета
    [void] Table1_30_DayliReportType ([int]$DayliReportType){
        if ($DayliReportType -ge 0 -and $DayliReportType -le 1){
        $this.connect.editingValueInt(1, 1, 30, $DayliReportType)
        Write-Host ' Тип суточного отчета = '$DayliReportType}
        else {
        Write-Host ' ERROR | Значение Тип суточного отчета = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Сжатие шрифта на чековой ленте
    [void] Table1_31_FontCompressionOnCheck ([int]$FontCompressionOnCheck){
        if ($FontCompressionOnCheck -ge 0 -and $FontCompressionOnCheck -le 1){
        $this.connect.editingValueInt(1, 1, 31, $FontCompressionOnCheck)
        Write-Host ' Сжатие шрифта на чековой ленте = '$FontCompressionOnCheck}
        else {
        Write-Host ' ERROR | Значение Сжатие шрифта на чековой ленте = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Разгон при печати
    [void] Table1_32_OverclockWhenPrint ([int]$OverclockWhenPrint){
        if ($OverclockWhenPrint -ge 0 -and $OverclockWhenPrint -le 1){
        $this.connect.editingValueInt(1, 1, 32, $OverclockWhenPrint)
        Write-Host ' Разгон при печати = '$OverclockWhenPrint}
        else {
        Write-Host ' ERROR | Значение Разгон при печати = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Коррекция яркости
    [void] Table1_33_BrightnessСorrection ([int]$BrightnessСorrection){
        if ($BrightnessСorrection -ge 0 -and $BrightnessСorrection -le 1){
        $this.connect.editingValueInt(1, 1, 33, $BrightnessСorrection)
        Write-Host ' Коррекция яркости = '$BrightnessСorrection}
        else {
        Write-Host ' ERROR | Значение Коррекция яркости = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Яркость печати
    [void] Table1_34_BritnessPrint ([int]$BritnessPrint){
        if ($BritnessPrint -ge 0 -and $BritnessPrint -le 3){
        $this.connect.editingValueInt(1, 1, 34, $BritnessPrint)
        Write-Host ' Яркость печати = '$BritnessPrint}
        else {
        Write-Host ' ERROR | Значение Яркость печати = 0...3'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Печать типов оплаты
    [void] Table1_35_PrintPyamenTypes ([int]$PrintPyamenTypes){
        if ($PrintPyamenTypes -ge 0 -and $PrintPyamenTypes -le 2){
        $this.connect.editingValueInt(1, 1, 35, $PrintPyamenTypes)
        Write-Host ' Печать типов оплаты = '$PrintPyamenTypes}
        else {
        Write-Host ' ERROR | Значение Печать типов оплаты = 0...2'
        Write-Host ' ERROR | Значение свойства не будет присвоено'   
        }
    }

    # Положение принтера
    [void] Table1_36_PrinterPosition ([int]$PrinterPosition){
        if ($PrinterPosition -ge 0 -and $PrinterPosition -le 1){
        $this.connect.editingValueInt(1, 1, 36, $PrinterPosition)
        Write-Host ' Положение принтера = '$PrinterPosition}
        else {
        Write-Host ' ERROR | Значение Положение принтера = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    <#
    # Печать рнм
    # Диапазон 1...1. Скорее всего не используется.
    [void] Table1_37_PrintRNM ([int]$PrintRNM){
        $this.connect.editingValueInt(1, 1, 37, $PrintRNM)
    }
    #>

    # Укороченное клише
    [void] Table1_38_ShortCliche ([int]$ShortCliche){
        if ($ShortCliche -ge 0 -and $ShortCliche -le 1){
        $this.connect.editingValueInt(1, 1, 38, $ShortCliche)
        Write-Host ' Укороченное клише = '$ShortCliche}
        else {
        Write-Host ' ERROR | Значение Укороченное клише = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'     
        }
    }

    # Печать клише после завершения документа
    [void] Table1_39_PrintClicheAfterDocument ([int]$PrintClicheAfterDocument){
        if ($PrintClicheAfterDocument -ge 0 -and $PrintClicheAfterDocument -le 1){
        $this.connect.editingValueInt(1, 1, 39, $PrintClicheAfterDocument)
        Write-Host ' Печать клише после завершения документа = '$PrintClicheAfterDocument}
        else {
        Write-Host ' ERROR | Значение Печать клише после завершения документа = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Скорость печати 
    [void] Table1_40_PrintSpeed ([int]$PrintSpeed){
        if ($PrintSpeed -ge 0 -and $PrintSpeed -le 2){
        $this.connect.editingValueInt(1, 1, 40, $PrintSpeed)
        Write-Host ' Скорость печати = '$PrintSpeed}
        else {
        Write-Host ' ERROR | Значение Скорость печати = 0...2'
        Write-Host ' ERROR | Значение свойства не будет присвоено'   
        }
    }

    # Кодирование реквизитов чека
    [void] Table1_41_CodingDetailsCheck ([int]$CoddingDetailsCheck){
        if ($CoddingDetailsCheck -ge 0 -and $CoddingDetailsCheck -le 1){
        $this.connect.editingValueInt(1, 1, 41, $CoddingDetailsCheck)
        Write-Host ' Кодирование реквизитов чека = '$CoddingDetailsCheck}
        else {
        Write-Host ' ERROR | Значение Кодирование реквизитов чека = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Кодирование ссылки
    [void] Table1_42_CodingLink ([int]$CodingLink){
        if ($CodingLink -ge 0 -and $CodingLink -le 2){
        $this.connect.editingValueInt(1, 1, 42, $CodingLink)
        Write-Host ' Кодирование ссылки = '$CodingLink}
        else {
        Write-Host ' ERROR | Значение Кодирование ссылки = 0...2'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Автопечать журнала
    [void] Table1_43_AutoPrintJournal ([int]$AutoPrintJournal){
        if ($AutoPrintJournal -ge 0 -and $AutoPrintJournal -le 1){
        $this.connect.editingValueInt(1, 1, 43, $AutoPrintJournal)
        Write-Host ' Автопечать журнала = '$AutoPrintJournal}
        else {
        Write-Host ' ERROR | Значение Автопечать журнала = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }    

    # Ведение журнала
    [void] Table1_44_ConductionJournal ([int]$ConductionJournal){
        if ($ConductionJournal -ge 0 -and $ConductionJournal -le 2){
        $this.connect.editingValueInt(1, 1, 44, $ConductionJournal)
        Write-Host ' Ведение журнала = '$ConductionJournal}
        else {
        Write-Host ' ERROR | Значение Ведение журнала = 0...2'
        Write-Host ' ERROR | Значение свойства не будет присвоено'    
        }
    }

    # Режим низкого потребления
    [void] Table1_45_LowConsumptionMode ([int]$LowConsumptionMode){
        if ($LowConsumptionMode -ge 0 -and $LowConsumptionMode -le 1){
        $this.connect.editingValueInt(1, 1, 45, $LowConsumptionMode)
        Write-Host ' Режим низкого потребления = '$LowConsumptionMode}
        else {
        Write-Host ' ERROR | Значение Режим низкого потребления = 0...1'
        Write-Host ' ERROR | Значение свойства не будет присвоено'      
        }
    }

    <#
    Таблица № 2
    Пароли Кассиров и администраторов
    #>

    # Строка 1 Пароль
    [void] Table2_1_Password ([int]$Password){
        $this.connect.editingValueInt(2, 1, 1, $Password)
    }

    # Строка 1 Должность и фамилия
    [void] Table2_1_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 1, 2, $PositionAndSurname)
    }

    # Строка 2 Пароль
    [void] Table2_2_Password ([int]$Password){
        $this.connect.editingValueInt(2, 2, 1, $Password)
    }

    # Строка 2 Должность и фамилия
    [void] Table2_2_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 2, 2, $PositionAndSurname)
    }

    # Строка 3 Пароль
    [void] Table2_3_Password ([int]$Password){
        $this.connect.editingValueInt(2, 3, 1, $Password)
    }

    # Строка 3 Должность и фамилия
    [void] Table2_3_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 3, 2, $PositionAndSurname)
    }

    # Строка 4 Пароль
    [void] Table2_4_Password ([int]$Password){
        $this.connect.editingValueInt(2, 4, 1, $Password)
    }

    # Строка 4 Должность и фамилия
    [void] Table2_4_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 4, 2, $PositionAndSurname)
    }

    # Строка 5 Пароль
    [void] Table2_5_Password ([int]$Password){
        $this.connect.editingValueInt(2, 5, 1, $Password)
    }

    # Строка 5 Должность и фамилия
    [void] Table2_5_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 5, 2, $PositionAndSurname)
    }

    # Строка 6 пароль
    [void] Table2_6_Password ([int]$Password){
        $this.connect.editingValueInt(2, 6, 1, $Password)
    }

    # Строка 6 Должность и фамилия
    [void] Table2_6_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 6, 2, $PositionAndSurname)
    }

    # Строка 7 пароль 
    [void] Table2_7_Password ([int]$Password){
        $this.connect.editingValueInt(2, 7, 1, $Password)
    }

    # Строка 7 Должность и фамилия
    [void] Table2_7_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 7, 2, $PositionAndSurname)
    }

    # Строка 8 пароль
    [void] Table2_8_Password ([int]$Password){
        $this.connect.editingValueInt(2, 8, 1, $Password)
    }

    # Строка 8 Должность и фамилия
    [void] Table2_8_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 8, 2, $PositionAndSurname)
    }

    # Строка 9 Пароль 
    [void] Table2_9_Password ([int]$Password){
        $this.connect.editingValueInt(2, 9, 1, $Password)
    }

    # Строка 9 Должность и фамилия
    [void] Table2_9_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 9, 2, $PositionAndSurname)
    }

    # Строка 10 пароль
    [void] Table2_10_Password ([int]$Password){
        $this.connect.editingValueInt(2, 10, 1, $Password)
    }

    # Строка 10 Должность и фамилия
    [void] Table2_10_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 10, 2, $PositionAndSurname)
    }

    [void] Table2_11_Password ([int]$Password){
        $this.connect.editingValueInt(2, 11, 1, $Password)
    }

    [void] Table2_11_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 11, 2, $PositionAndSurname)
    }


    [void] Table2_12_Password ([int]$Password){
        $this.connect.editingValueInt(2, 12, 1, $Password)
    }

    [void] Table2_12_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 12, 2, $PositionAndSurname)
    }


    [void] Table2_13_Password ([int]$Password){
        $this.connect.editingValueInt(2, 13, 1, $Password)
    }

    [void] Table2_13_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 13, 2, $PositionAndSurname)
    }


    [void] Table2_14_Password ([int]$Password){
        $this.connect.editingValueInt(2, 14, 1, $Password)
    }

    [void] Table2_14_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 14, 2, $PositionAndSurname)
    }


    [void] Table2_15_Password ([int]$Password){
        $this.connect.editingValueInt(2, 15, 1, $Password)
    }

    [void] Table2_15_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 15, 2, $PositionAndSurname)
    }


    [void] Table2_16_Password ([int]$Password){
        $this.connect.editingValueInt(2, 16, 1, $Password)
    }

    [void] Table2_16_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 16, 2, $PositionAndSurname)
    }


    [void] Table2_17_Password ([int]$Password){
        $this.connect.editingValueInt(2, 17, 1, $Password)
    }

    [void] Table2_17_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 17, 2, $PositionAndSurname)
    }


    [void] Table2_18_Password ([int]$Password){
        $this.connect.editingValueInt(2, 18, 1, $Password)
    }

    [void] Table2_18_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 18, 2, $PositionAndSurname)
    }


    [void] Table2_19_Password ([int]$Password){
        $this.connect.editingValueInt(2, 19, 1, $Password)
    }

    [void] Table2_19_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 19, 2, $PositionAndSurname)
    }

    [void] Table2_20_Password ([int]$Password){
        $this.connect.editingValueInt(2, 20, 1, $Password)
    }

    [void] Table2_20_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 20, 2, $PositionAndSurname)
    }


    [void] Table2_21_Password ([int]$Password){
        $this.connect.editingValueInt(2, 21, 1, $Password)
    }

    [void] Table2_21_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 21, 2, $PositionAndSurname)
    }


    [void] Table2_22_Password ([int]$Password){
        $this.connect.editingValueInt(2, 22, 1, $Password)
    }

    [void] Table2_22_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 22, 2, $PositionAndSurname)
    }


    [void] Table2_23_Password ([int]$Password){
        $this.connect.editingValueInt(2, 23, 1, $Password)
    }

    [void] Table2_23_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 23, 2, $PositionAndSurname)
    }

    [void] Table2_24_Password ([int]$Password){
        $this.connect.editingValueInt(2, 24, 1, $Password)
    }

    [void] Table2_24_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 24, 2, $PositionAndSurname)
    }

    [void] Table2_25_Password ([int]$Password){
        $this.connect.editingValueInt(2, 25, 1, $Password)
    }

    [void] Table2_25_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 25, 2, $PositionAndSurname)
    }

    [void] Table2_26_Password ([int]$Password){
        $this.connect.editingValueInt(2, 26, 1, $Password)
    }

    [void] Table2_26_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 26, 2, $PositionAndSurname)
    }

    [void] Table2_27_Password ([int]$Password){
        $this.connect.editingValueInt(2, 27, 1, $Password)
    }

    [void] Table2_27_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 27, 2, $PositionAndSurname)
    }

    [void] Table2_28_Password ([int]$Password){
        $this.connect.editingValueInt(2, 28, 1, $Password)
    }

    [void] Table2_28_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 28, 2, $PositionAndSurname)
    }

    [void] Table2_29_Password ([int]$Password){
        $this.connect.editingValueInt(2, 29, 1, $Password)
    }

    [void] Table2_29_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 29, 2, $PositionAndSurname)
    }

    [void] Table2_30_Password ([int]$Password){
        $this.connect.editingValueInt(2, 30, 1, $Password)
    }

    [void] Table2_30_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 30, 2, $PositionAndSurname)
    }

    <#
    Таблица 4 
    Текст в чеке
    #>

    # Реклама в чеке 1 строка
    [void] Table4_1_Reklama1 ([string]$Reklama1){
        if ($Reklama1.Length -lt 64){
        $this.connect.editingValueString(4, 1, 1, $Reklama1)
        Write-Host ' Реклама в чеке 1 строка = '$Reklama1}
        else {
        Write-Host ' ERROR | Значение Реклама в чеке 1 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Реклама в чеке 2 строка
    [void] Table4_2_Reklama2 ([string]$Reklama2){
        if ($Reklama2.Length -lt 64){
        $this.connect.editingValueString(4, 1, 2, $Reklama2)
        Write-Host ' Реклама в чеке 2 строка = '$Reklama2}
        else {
        Write-Host ' ERROR | Значение Реклама в чеке 2 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Реклама в чеке 3 строка
    [void] Table4_3_Reklama3 ([string]$Reklama3){
        if ($Reklama3.Length -lt 64){
        $this.connect.editingValueString(4, 1, 3, $Reklama3)
        Write-Host ' Реклама в чеке 3 строка = '$Reklama3}
        else {
        Write-Host ' ERROR | Значение Реклама в чеке 3 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'      
        }
    }

    # Клише 4 строка
    [void] Table4_4_Cliche4 ([string]$Cliche4){
        if ($Cliche4.Length -lt 64){
        $this.connect.editingValueString(4, 1, 4, $Cliche4)
        Write-Host ' Клише 4 строка = '$Cliche4}
        else {
        Write-Host ' ERROR | Значение Клише 4 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'      
        }
    }

    # Клише 5 строка
    [void] Table4_5_Cliche5 ([string]$Cliche5){
        if ($Cliche5.Length -lt 64){
        $this.connect.editingValueString(4, 1, 5, $Cliche5)
        Write-Host ' Клише 5 строка = '$Cliche5}
        else {
        Write-Host ' ERROR | Значение Клише 5 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 6 строка
    [void] Table4_6_Cliche6 ([string]$Cliche6){
        if ($Cliche6.Length -lt 64){
        $this.connect.editingValueString(4, 1, 6, $Cliche6)
        Write-Host ' Клише 6 строка = '$Cliche6}
        else {
        Write-Host ' ERROR | Значение Клише 6 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 7 строка
    [void] Table4_7_Cliche7 ([string]$Cliche7){
        if ($Cliche7.Length -lt 64){
        $this.connect.editingValueString(4, 1, 7, $Cliche7)
        Write-Host ' Клише 7 строка = '$Cliche7}
        else {
        Write-Host ' ERROR | Значение Клише 7 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 8 строка
    [void] Table4_8_Cliche8 ([string]$Cliche8){
        if ($Cliche8.Length -lt 64){
        $this.connect.editingValueString(4, 1, 8, $Cliche8)
        Write-Host ' Клише 8 строка = '$Cliche8}
        else {
        Write-Host ' ERROR | Значение Клише 8 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 9 строка
    [void] Table4_9_Cliche9 ([string]$Cliche9){
        if ($Cliche9.Length -lt 64){
        $this.connect.editingValueString(4, 1, 9, $Cliche9)
        Write-Host ' Клише 9 строка = '$Cliche9}
        else {
        Write-Host ' ERROR | Значение Клише 9 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 10 строка
    [void] Table4_10_Cliche10 ([string]$Cliche10){
        if ($Cliche10.Length -lt 64){
        $this.connect.editingValueString(4, 1, 10, $Cliche10)
        Write-Host ' Клише 10 строка = '$Cliche10}
        else {
        Write-Host ' ERROR | Значение Клише 10 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Клише 11 строка
    [void] Table4_11_Cliche11 ([string]$Cliche11){
        if ($Cliche11.Length -lt 64){
        $this.connect.editingValueString(4, 1, 11, $Cliche11)
        Write-Host ' Клише 11 строка = '$Cliche11}
        else {
        Write-Host ' ERROR | Значение Клише 11 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'     
        }
    }

    # Клише 12 строка
    [void] Table4_12_Cliche12 ([string]$Cliche12){
        if ($Cliche12.Length -lt 64){
        $this.connect.editingValueString(4, 1, 12, $Cliche12)
        Write-Host ' Клише 12 строка = '$Cliche12}
        else {
        Write-Host ' ERROR | Значение Клише 12 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'       
        }
    }

    # Клише 13 строка
    [void] Table4_13_Cliche13 ([string]$Cliche13){
        if ($Cliche13.Length -lt 64){
        $this.connect.editingValueString(4, 1, 13, $Cliche13)
        Write-Host ' Клише 13 строка = '$Cliche13}
        else {
        Write-Host ' ERROR | Значение Клише 13 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'   
        }
    }

    # Клише 14 строка
    [void] Table4_14_Cliche14 ([string]$Cliche14){
        if ($Cliche14 -lt 64){
        $this.connect.editingValueString(4, 1, 14, $Cliche14)
        Write-Host ' Клише 14 строка = '$Cliche14}
        else {
        Write-Host ' ERROR | Значение Клише 14 строка не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    <#
    Таблица № 5
    Наименование типов оплаты
    #>

    # Тип оплаты 1
    [void] Table5_1_PaymentType1 ([string]$PaymentType1){
        if ($PaymentType1.Length -lt 64){
        $this.connect.editingValueString(5, 1, 1, $PaymentType1)
        Write-Host ' Тип оплаты 1 = '$PaymentType1}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 1 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'      
        }
    }

    # Тип оплаты 2
    [void] Table5_2_PaymentType2 ([string]$PaymentType2){
        if ($PaymentType2.Length -lt 64){
        $this.connect.editingValueString(5, 1, 2, $PaymentType2)
        Write-Host ' Тип оплаты 2 = '$PaymentType2}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 2 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'     
        }
    }

    # Тип оплаты 3
    [void] Table5_3_PaymentType3 ([string]$PaymentType3){
        if ($PaymentType3.Length -lt 64){
        $this.connect.editingValueString(5, 1, 3, $PaymentType3)
        Write-Host ' Тип оплаты 3 = '$PaymentType3}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 3 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'     
        }
    }

    # Тип оплаты 4
    [void] Table5_4_PaymentType4 ([string]$PaymentType4){
        if ($PaymentType4.Length -lt 64){
        $this.connect.editingValueString(5, 1, 4, $PaymentType4)
        Write-Host ' Тип оплаты 4 = '$PaymentType4}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 4 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'    
        }
    }

    # Тип оплаты 5
    [void] Table5_5_PaymentType5 ([string]$PaymentType5){
        if ($PaymentType5.Length -lt 64){
        $this.connect.editingValueString(5, 1, 5, $PaymentType5)
        Write-Host ' Тип оплаты 5 = '$PaymentType5}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 5 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'     
        }
    }

    # Тип оплаты 6
    [void] Table5_6_PaymentType6 ([string]$PaymentType6){
        if ($PaymentType6.Length -lt 64){
        $this.connect.editingValueString(5, 1, 6, $PaymentType6)
        Write-Host ' Тип оплаты 6 = '$PaymentType6}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 6 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Тип оплаты 7
    [void] Table5_7_PaymentType7 ([string]$PaymentType7){
        if ($PaymentType7.Length -lt 64){
        $this.connect.editingValueString(5, 1, 7, $PaymentType7)
        Write-Host ' Тип оплаты 7 = '$PaymentType7}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 7 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Тип оплаты 8
    [void] Table5_8_PaymentType8 ([string]$PaymentType8){
        if ($PaymentType8.Length -lt 64){
        $this.connect.editingValueString(5, 1, 8, $PaymentType8)
        Write-Host ' Тип оплаты 8 = '$PaymentType8}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 8 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'  
        }
    }

    # Тип оплаты 9
    [void] Table5_9_PaymentType9 ([string]$PaymentType9){
        if ($PaymentType9.Length -lt 64){
        $this.connect.editingValueString(5, 1, 9, $PaymentType9)
        Write-Host ' Тип оплаты 9 = '$PaymentType9}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 9 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Тип оплаты 10
    [void] Table5_10_PaymentType10 ([string]$PaymentType10){
        if ($PaymentType10.Length -lt 64){
        $this.connect.editingValueString(5, 1, 10, $PaymentType10)
        Write-Host ' Тип оплаты 10 = '$PaymentType10}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 10 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Тип оплаты 11
    [void] Table5_11_PaymentType11 ([string]$PaymentType11){
        if ($PaymentType11.Length -lt 64){
        $this.connect.editingValueString(5, 1, 11, $PaymentType11)
        Write-Host ' Тип оплаты 11 = '$PaymentType11}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 11 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено' 
        }
    }

    # Тип оплаты 12
    [void] Table5_12_PaymentType12 ([string]$PaymentType12){
        if ($PaymentType12.Length -lt 64){
        $this.connect.editingValueString(5, 1, 12, $PaymentType12)
        Write-Host ' Тип оплаты 12 = '$PaymentType12}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 12 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Тип оплаты 13
    [void] Table5_13_PaymentType13 ([string]$PaymentType13){
        if ($PaymentType13.Length -lt 64){
        $this.connect.editingValueString(5, 1, 13, $PaymentType13)
        Write-Host ' Тип оплаты 13 = '$PaymentType13}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 13 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Тип оплаты 14
    [void] Table5_14_PaymentType14 ([string]$PaymentType14){
        if ($PaymentType14.Length -lt 64){
        $this.connect.editingValueString(5, 1, 14, $PaymentType14)
        Write-Host ' Тип полаты 14 = '$PaymentType14}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 14 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Тип оплаты 15
    [void] Table5_15_PaymentType15 ([string]$PaymentType15){
        if ($PaymentType15.Length -lt 64){
        $this.connect.editingValueString(5, 1, 15, $PaymentType15)
        Write-Host ' Тип оплаты 15 = '$PaymentType15}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 15 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    # Тип оплаты 16
    [void] Table5_16_PaymentType16 ([string]$PaymentType16){
        if ($PaymentType16.Length -lt 64){
        $this.connect.editingValueString(5, 1, 16, $PaymentType16)
        Write-Host ' Тип оплаты 15 = '$PaymentType16}
        else {
        Write-Host ' ERROR | Значение Тип оплаты 16 не может быть длинее 64 символов'
        Write-Host ' ERROR | Значение свойства не будет присвоено'
        }
    }

    <#
    Таблица № 7
    Наименование отделов
    #>

    [void] Table7_1_1StringDepartamentName ([string]$1StringDepartamentName){
        $this.connect.editingValueString(7, 1, 1, $1StringDepartamentName)
    }

    [void] Table7_2_2StringDepartamentName ([string]$2StringDepartamentName){
        $this.connect.editingValueString(7, 1, 2, $2StringDepartamentName)
    }

    [void] Table7_3_3StringDepartamentName ([string]$3StringDepartamentName){
        $this.connect.editingValueString(7, 1, 3, $3StringDepartamentName)
    }

    [void] Table7_4_4StringDepartamentName ([string]$4StringDepartamentName){
        $this.connect.editingValueString(7, 1, 4, $4StringDepartamentName)
    }

    [void] Table7_5_5StringDepartamentName ([string]$5StringDepartamentName){
        $this.connect.editingValueString(7, 1, 5, $5StringDepartamentName)
    }

    [void] Table7_6_6StringDepartamentName ([string]$6StringDepartamentName){
        $this.connect.editingValueString(7, 1, 6, $6StringDepartamentName)
    }

    [void] Table7_7_7StringDepartamentName ([string]$7StringDepartamentName){
        $this.connect.editingValueString(7, 1, 7, $7StringDepartamentName)
    }

    [void] Table7_8_8StringDepartamentName ([string]$8StringDepartamentName){
        $this.connect.editingValueString(7, 1, 8, $8StringDepartamentName)
    }

    [void] Table7_9_9StringDepartamentName ([string]$9StringDepartamentName){
        $this.connect.editingValueString(7, 1, 9, $9StringDepartamentName)
    }

    [void] Table7_10_10StringDepartamentName ([string]$10StringDepartamentName){
        $this.connect.editingValueString(7, 1, 10, $10StringDepartamentName)
    }

    [void] Table7_11_11StringDepartamentName ([string]$11StringDepartamentName){
        $this.connect.editingValueString(7, 1, 11, $11StringDepartamentName)
    }

    [void] Table7_12_12StringDepartamentName ([string]$12StringDepartamentName){
        $this.connect.editingValueString(7, 1, 12, $12StringDepartamentName)
    }

    [void] Table7_13_13StringDepartamentName ([string]$13StringDepartamentName){
        $this.connect.editingValueString(7, 1, 13, $13StringDepartamentName)
    }

    [void] Table7_14_14StringDepartamentName ([string]$14StringDepartamentName){
        $this.connect.editingValueString(7, 1, 14, $14StringDepartamentName)
    }

    [void] Table7_15_15StringDepartamentName ([string]$15StringDepartamentName){
        $this.connect.editingValueString(7, 1, 15, $15StringDepartamentName)
    }

    [void] Table7_16_16StringDepartamentName ([string]$16StringDepartamentName){
        $this.connect.editingValueString(7, 1, 16, $16StringDepartamentName)
    }

    <#
    Таблица № 8
    Настройка Шрифтов
    #>

    # Текст в чеке
    [void] Table8_1_TextInCheck ([int]$TextInCheck){
        $this.connect.editingValueInt(8, 1, 1, $TextInCheck)
    }

    # Рекламный текст
    [void] Table8_2_ReklamaText ([int]$ReklamaText){
        $this.connect.editingValueInt(8, 1, 2, $ReklamaText)
    }

    # Загловок Чека
    [void] Table8_3_TitleText ([int]$TitleText){
        $this.connect.editingValueInt(8, 1, 3, $TitleText)
    }

    # 1 строка в операции
    [void] Table8_4_1StringOperation ([int]$1StringOperation){
        $this.connect.editingValueInt(8, 1, 4, $1StringOperation)
    }

    # 2 строка в операции
    [void] Table8_5_2StringOperation ([int]$2StringOperation){
        $this.connect.editingValueInt(8, 1, 5, $2StringOperation)
    }

    # 3 строка в опреации
    [void] Table8_6_3StringOperation ([int]$3StringOperation){
        $this.connect.editingValueInt(8, 1, 6, $3StringOperation)
    }

    # 1 строка в скидке
    [void] Table8_7_1StringDiscount ([int]$1StringDiscount){
        $this.connect.editingValueInt(8, 1, 7, $1StringDiscount)
    }

    # 2 строка в скидке
    [void] Table8_8_2StringDiscount ([int]$2StringDiscount){
        $this.connect.editingValueInt(8, 1, 8, $2StringDiscount)
    }

    # 1 строка в надбавке
    [void] Table8_9_1StringAllowance ([int]$1StringAllowance){
        $this.connect.editingValueInt(8, 1, 9, $1StringAllowance)
    }

    # 2 строка в надбавке
    [void] Table8_10_2StringAllowance ([int]$2StringAllowance){
        $this.connect.editingValueInt(8, 1, 10, $2StringAllowance)
    }

    # 1 строка сторно скидки
    [void] Table8_11_1StringStornoDiscount ([int]$1StringStornoDiscount){
        $this.connect.editingValueInt(8, 1, 11, $1StringStornoDiscount)
    }

    # 2 строка сторно скидки 
    [void] Table8_12_2StringStornoDiscount ([int]$2StringStornoDiscount){
        $this.connect.editingValueInt(8, 1, 12, $2StringStornoDiscount)
    }

    # 1 строка в сторно надбавки
    [void] Table8_13_1StringStornoAllowance ([int]$1StringStornoAllowance){
        $this.connect.editingValueInt(8, 1, 13, $1StringStornoAllowance)
    }

    # 2 строка в сторно надбавки 
    [void] Table8_14_2StringStornoAllowance ([int]$2StringStornoAllowance){
        $this.connect.editingValueInt(8, 1, 14, $2StringStornoAllowance)
    }

    # Строка в закрытии чека
    [void] Table8_15_StringClosingCheck ([int]$StringClosingCheck){
        $this.connect.editingValueInt(8, 1, 15, $StringClosingCheck)
    }

    # Скидка в закрытии чека
    [void] Table8_16_DicountClosingCheck ([int]$DicountClosingCheck){
        $this.connect.editingValueInt(8, 1, 16, $DicountClosingCheck)
    }

    # Всего в закрытии чека
    [void] Table8_17_AllClossingCheck ([int]$AllClossingCheck){
        $this.connect.editingValueInt(8, 1, 17, $AllClossingCheck)
    }

    # Итог чека
    [void] Table8_18_TotalCheck ([int]$TotalCheck){
        $this.connect.editingValueInt(8, 1, 18, $TotalCheck)
    }
    
    # Текст в типе оплаты
    [void] Table8_19_TextPaymentType ([int]$TextPaymentType){
        $this.connect.editingValueInt(8, 1, 19, $TextPaymentType)
    }

    # Текст в сдаче
    [void] Table8_20_TextChange ([int]$TextChange){
        $this.connect.editingValueInt(8, 1, 20, $TextChange)
    }

    # Оборот по налогам
    [void] Table8_21_TaxTurnover ([int]$TaxTurnover){
        $this.connect.editingValueInt(8, 1, 21, $TaxTurnover)
    }

    # Налоги
    [void] Table8_22_Taxes ([int]$Taxes){
        $this.connect.editingValueInt(8, 1, 22, $Taxes)
    }

    # Шрифт по умолчанию
    [void] Table8_23_DefaultFont ([int]$DefaultFont){
        $this.connect.editingValueInt(8, 1, 23, $DefaultFont)
    }

    # Шрифт табличной формы
    [void] Table8_24_TableFrontForm ([int]$TableFrontForm){
        $this.connect.editingValueInt(8, 1, 24, $TableFrontForm)
    }

    <#
    Таблица № 11
    Параметры кодирования qr-кодов
    #>

    # Кодировать текст в UTF-8
    [void] Table11_1_CopyTextToUTF8 ([int]$CopyTextToUTF8){
        $this.connect.editingValueInt(11, 1, 1, $CopyTextToUTF8)
    }

    # Размер модуля кода рекламного текста
    [void] Table11_2_SizeModuleCodeReklamaText ([int]$SizeModuleCodeReklamaText){
        $this.connect.editingValueInt(11, 1, 2, $SizeModuleCodeReklamaText)
    }

    # Избыточность кода рекламного текста
    [void] Table11_3_RedundancyReklamaTextCode ([int]$RedundancyReklamaTextCode){
        $this.connect.editingValueInt(11, 1, 3, $RedundancyReklamaTextCode)
    }

    # Маска кода рекламного текста
    [void] Table11_4_MaskCodeRaklamaText ([int]$MaskCodeRaklamaText){
        $this.connect.editingValueInt(11, 1, 4, $MaskCodeRaklamaText)
    }

    # Выравнивание кода рекламного текста
    [void] Table11_5_AlignmentCodeReklamaText ([int]$AlignmentCodeReklamaText){
        $this.connect.editingValueInt(11, 1, 5, $AlignmentCodeReklamaText)
    }

    # Размер модуля кода веб-ссылки
    [void] Table11_6_SizeModuleCodeWebLink ([int]$SizeModuleCodeWebLink){
        $this.connect.editingValueInt(11, 1, 6, $SizeModuleCodeWebLink)
    }

    # Избыточность кода веб-ссылки
    [void] Table11_7_AlignmentCodeWebLink ([int]$AlignmentCodeWebLink){
        $this.connect.editingValueInt(11, 1, 7, $AlignmentCodeWebLink)
    }

    # Маска кода веб-ссылки 
    [void] Table11_8_MaskCodeWebLink ([int]$MaskCodeWebLink){
        $this.connect.editingValueInt(11, 1, 8, $MaskCodeWebLink)
    }

    # Выравнивание кода веб-ссылки
    [void] Table11_9_AlignmentCodeWebLink ([int]$AlignmentCodeWebLink){
        $this.connect.editingValueInt(11, 1, 9, $AlignmentCodeWebLink)
    }

    <#
    Таблица № 12 
    Веб-ссылка
    #>

    # Ссылка строка 1
    [void] Table12_1_Link1String ([string]$Link1String){
        $this.connect.editingValueString(12, 1, 1, $Link1String)
    }

    # Ссылка строка 2
    [void] Table12_2_Link2String ([string]$Link2String){
        $this.connect.editingValueString(12, 1, 2, $Link2String)
    }

    # Ссылка строка 3
    [void] Table12_3_Link3String ([string]$Link3String){
        $this.connect.editingValueString(12, 1, 3, $Link3String)
    }

    <#
    Таблица № 15
    Сервер Транзакций
    #>

    # Режим передачи
    [void] Table15_1_TranferMode ([int]$TranferMode){
        $this.connect.editingValueString(15, 1, 1, $TranferMode)
    }

    # Server ip 1
    [void] Table15_2_ServerIp1 ([int]$ServerIp1){
        $this.connect.editingValueString(15, 1, 2, $ServerIp1)
    }

    # Server ip 2
    [void] Table15_3_ServerIp2 ([int]$ServerIp2){
        $this.connect.editingValueString(15, 1, 3, $ServerIp2)
    }

    # Server ip 3
    [void] Table15_4_ServerIp3 ([int]$ServerIp3){
        $this.connect.editingValueString(15, 1, 4, $ServerIp3)
    }

    # Server ip 4
    [void] Table15_4_ServerIp4 ([int]$ServerIp4){
        $this.connect.editingValueString(15, 1, 4, $ServerIp4)
    }

    # Server port
    [void] Table15_2_ServerPort ([int]$ServerPort){
        $this.connect.editingValueString(15, 1, 6, $ServerPort)
    }

    <#
    Таблица № 16
    Сетевой адрес
    #>

    # Static ip
    [void] Table16_1_StaticIp ([int]$StaticIp){
        $this.connect.editingValueInt(16, 1, 1, $StaticIp)
    }
    
    # Статус dhcp
    [void] Table16_2_DHCPStatus ([int]$DHCPStatus){
        $this.connect.editingValueInt(16, 1, 2, $DHCPStatus)
    }
    
    # Local ip1
    [void] Table16_3_Localip1 ([int]$Localip1){
        $this.connect.editingValueInt(16, 1, 3, $Localip1)
    }
    
    # Local ip2
    [void] Table16_4_Localip2 ([int]$Localip2){
        $this.connect.editingValueInt(16, 1, 4, $Localip2)
    }
    
    # Local ip3
    [void] Table16_5_Localip3 ([int]$Localip3){
        $this.connect.editingValueInt(16, 1, 5, $Localip3)
    }
    
    # Local ip4
    [void] Table16_6_Localip4 ([int]$Localip4){
        $this.connect.editingValueInt(16, 1, 6, $Localip4)
    }
    
    # Gw1
    [void] Table16_7_Gw1 ([int]$Gw1){
        $this.connect.editingValueInt(16, 1, 7, $Gw1)
    }
    
    # Gw2
    [void] Table16_8_Gw2 ([int]$Gw2){
        $this.connect.editingValueInt(16, 1, 8, $Gw2)
    }
    
    # Gw3
    [void] Table16_9_Gw3 ([int]$Gw3){
        $this.connect.editingValueInt(16, 1, 9, $Gw3)
    }
    
    # Gw4
    [void] Table16_10_Gw4 ([int]$Gw4){
        $this.connect.editingValueInt(16, 1, 10, $Gw4)
    }
    
    # Mask1
    [void] Table16_11_Mask1 ([int]$Mask1){
        $this.connect.editingValueInt(16, 1, 11, $Mask1)
    }
    
    # Mask2
    [void] Table16_12_Mask2 ([int]$Mask2){
        $this.connect.editingValueInt(16, 1, 12, $Mask2)
    }
    
    # Mask3
    [void] Table16_13_Mask3 ([int]$Mask3){
        $this.connect.editingValueInt(16, 1, 13, $Mask3)
    }
    
    # Mask4
    [void] Table16_14_Mask4 ([int]$Mask4){
        $this.connect.editingValueInt(16, 1, 14, $Mask4)
    }
    
    # Dns1
    [void] Table16_15_DNS1 ([int]$DNS1){
        $this.connect.editingValueInt(16, 1, 15, $DNS1)
    }
    
    # Dns2
    [void] Table16_16_DNS2 ([int]$DNS2){
        $this.connect.editingValueInt(16, 1, 16, $DNS2)
    }
    
    # Dns3
    [void] Table16_17_DNS3 ([int]$DNS3){
        $this.connect.editingValueInt(16, 1, 17, $DNS3)
    }
    
    # Dns4
    [void] Table16_18_DNS4 ([int]$DNS4){
        $this.connect.editingValueInt(16, 1, 18, $DNS4)
    }
    
    # Socks5 клиент
    [void] Table16_19_Socks5Client ([int]$Socks5Client){
        $this.connect.editingValueInt(16, 1, 19, $Socks5Client)
    }
    
    # Socks5 ip1
    [void] Table16_20_Socks5Ip1 ([int]$Socks5Ip1){
        $this.connect.editingValueInt(16, 1, 20, $Socks5Ip1)
    }
    
    # Socks5 ip2
    [void] Table16_21_Socks5Ip2 ([int]$Socks5Ip2){
        $this.connect.editingValueInt(16, 1, 21, $Socks5Ip2)
    }
    
    # Socks5 ip3
    [void] Table16_22_Socks5Ip3 ([int]$Socks5Ip3){
        $this.connect.editingValueInt(16, 1, 22, $Socks5Ip3)
    }
    
    # Socks5 ip4
    [void] Table16_23_Socks5Ip4 ([int]$Socks5Ip4){
        $this.connect.editingValueInt(16, 1, 23, $Socks5Ip4)
    }
    
    # Socks5 port
    [void] Table16_24_Socks5Port ([int]$Socks5Port){
        $this.connect.editingValueInt(16, 1, 24, $Socks5Port)
    }

    <#
    Таблица № 19
    Параметры ОФД
    #>

    # Сервер
    [void] Table19_1_OFDServer ([string]$OFDServer){
        $this.connect.editingValueString(19, 1, 1, $OFDServer)
    }
    
    # Порт
    [void] Table19_2_OFDPort ([int]$OFDPort){
        $this.connect.editingValueInt(19, 1, 2, $OFDPort)
    }
    
    # Таймаут чтения ответа
    [void] Table19_3_OFDTimeoutResponce ([int]$OFDTimeoutResponce){
        $this.connect.editingValueInt(19, 1, 3, $OFDTimeoutResponce)
    }
    
    # Задержка между пакетами, мс
    [void] Table19_4_OFDDelayPackets ([int]$OFDDelayPackets){
        $this.connect.editingValueInt(19, 1, 4, $OFDDelayPackets)
    }

    <#
    Таблица № 21
    Сетевые интерфейсы
    #>

    # Режим ррр
    [void] Table21_1_RRRMode ([int]$RRRMode){
        $this.connect.editingValueInt(21, 1, 1, $RRRMode)
    }

    # Режим обмена с офд
    [void] Table21_2_TransferOFDMode ([int]$TransferOFDMode){
        $this.connect.editingValueInt(21, 1, 2, $TransferOFDMode)
    }

    # Запуск tcp-сервера
    [void] Table21_3_TCPServerStart ([int]$TCPServerStart){
        $this.connect.editingValueInt(21, 1, 3, $TCPServerStart)
    }

    # Порт tcp-сурвера
    [void] Table21_4_TCPServerPort ([int]$TCPServerPort){
        $this.connect.editingValueInt(21, 1, 4, $TCPServerPort)
    }

    # Наличие wifi
    [void] Table21_5_WiFiAvailability ([int]$WiFiAvailability){
        $this.connect.editingValueInt(21, 1, 5, $WiFiAvailability)
    }

    # Использовать wifi
    [void] Table21_6_WiFiUse ([int]$WiFiUse){
        $this.connect.editingValueInt(21, 1, 6, $WiFiUse)
    }

    # wifi ssid
    [void] Table21_7_WiFissid ([string]$WiFissid){
        $this.connect.editingValueInt(21, 1, 7, $WiFissid)
    }

    # wifi passphrase
    [void] Table21_8_WiFipassphrase ([string]$WiFiphrase){
        $this.connect.editingValueInt(21, 1, 8, $WiFiphrase)
    }

    # RNDIS
    [void] Table21_9_RNDIS ([int]$RNDIS){
        $this.connect.editingValueInt(21, 1, 9, $RNDIS)
    }

    # Версия по wifi
    [void] Table21_10_WiFiSoftVersion ([int]$WiFiSoftVersion){
        $this.connect.editingValueInt(21, 1, 10, $WiFiSoftVersion)
    }

}