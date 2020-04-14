

class TCPWorkWithFR {
    [string]$ipAdressFR
    [System.__ComObject]$drvFR

    TCPWorkWithFR([string]$ipAdressFR) {
        $this.drvFR = New-Object -ComObject AddIn.DrvFR
        $this.ipAdressFR = $ipAdressFR
    }

    [void] ConnectToFR() {
        $this.drvFR.UseIPAddress   = $true
        $this.drvFR.IPAddress      = $this.ipAdressFR
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
    
    $connect = [TCPWorkWithFR]::new($this.ipAdress)

    FiscalRegistrator([string]$ipAdress){
        $this.connect.ipAdressFR = $ipAdress
    }

    <#
    Таблица № 1
    Тип и режим кассы
    #>

    # Номер кассы в магазине
    [void] Table1_1_NumberinStore ([int]$numberInStore){
        $this.connect.editingValueInt(1, 1, 1, $numberInStore)
    }

    # Авт. Обнуление денежной наличности
    [void] Table1_2_AutoZeroingCash ([int]$AutoZeroingCash){
        $this.connect.editingValueInt(1, 1, 2, $AutoZeroingCash)
    }

    # Печать рекламного текста
    [void] Table1_3_PrintReklamaText ([int]$PrintReklamaText){
        $this.connect.editingValueInt(1, 1, 3, $PrintReklamaText)
    }

    # Печать необнуляемой суммы
    [void] Table1_4_PrintNonZeroAmount ([int]$PrintNonZeroAmount){
        $this.connect.editingValueInt(1, 1, 5, $PrintNonZeroAmount)
    }

    # Работа с денежным ящиком
    [void] Table1_6_WorkWithCashDrawer ([int]$WorkWithCashDrawer){
        $this.connect.editingValueInt(1, 1, 6, $WorkWithCashDrawer)
    }

    # Отрезка чека
    [void] Table1_7_CutCheck ([int]$CutCheck){
        $this.connect.editingValueInt(1, 1, 7, $CutCheck)
    }

    # Печатать дробное в количестве
    [void] Table1_8_PrintDecimalInQuanity ([int]$DecimalInQuanity){
        $this.connect.editingValueInt(1, 1, 8, $DecimalInQuanity)
    }

    # Лог. уровень дат. денежного ящика
    [void] Table1_9_LogLevelDatCashDrawer ([int]$LogLevelDatCashDrawer){
        $this.connect.editingValueInt(1, 1, 9, $LogLevelDatCashDrawer)
    }    

    # Длительность имп. денежного ящика
    [void] Table1_10_PulseDurationCashDrawer ([int]$PulseDurationCashDrawer){
        $this.connect.editingValueInt(1, 1, 10, $PulseDurationCashDrawer)
    }  

    # Длительность паузы имп. денежного ящика
    [void] Table1_11_PauseDurationCashDrawer ([int]$PauseDurationCashDrawer){
        $this.connect.editingValueInt(1, 1, 11, $PauseDurationCashDrawer)
    }

    # Количество имп. денежного ящика
    [void] Table1_12_ImpulseCountCashDrawer ([int]$ImpulseCountCashDrawer){
        $this.connect.editingValueInt(1, 1, 12, $ImpulseCountCashDrawer)
    }

    # Использование весовых датчиков
    [void] Table1_13_UseWeightSensor ([int]$UseWeightSensor){
        $this.connect.editingValueInt(1, 1, 13, $UseWeightSensor)
    }

    # Начисление налогов
    [void] Table1_14_TaxCharge ([int]$TaxCharge){
        $this.connect.editingValueInt(1, 1, 14, $TaxCharge)
    }

    # Автоматический перевод времени
    [void] Table1_15_AutoTimeTransfer ([int]$AutoTimeTransfer){
        $this.connect.editingValueInt(1, 1, 15, $AutoTimeTransfer)
    }

    # Печать налогов
    [void] Table1_16_PrintTaxes ([int]$PrintTaxes){
        $this.connect.editingValueInt(1, 1, 16, $PrintTaxes)
    }

    # Печать заголовка
    [void] Table1_17_PrintTitle ([int]$PrintTitle){
        $this.connect.editingValueInt(1, 1, 17, $PrintTitle)
    }

    # Печать единичного количества
    [void] Table1_18_PrintSingleQuantity ([int]$PrintSingleQuantity){
        $this.connect.editingValueInt(1, 1, 18, $PrintSingleQuantity)
    }

    # Сохранять строки в буфере чека
    [void] Table1_19_SaveStringsInClipboard ([int]$SaveStringsInClipboard){
        $this.connect.editingValueInt(1, 1, 19, $SaveStringsInClipboard)
    }

    # Печать чека по закрытию
    [void] Table1_20_PrintCheckWhenClosed ([int]$PrintCheckWhenClosed){
        $this.connect.editingValueInt(1, 1, 20, $PrintCheckWhenClosed)
    }

    # Промотка перед отрезкой
    [void] Table1_21_RewindBeforeCut ([int]$RewindBeforeCut){
        $this.connect.editingValueInt(1, 1, 21, $RewindBeforeCut)
    }

    # Отрезка при открытом чеке
    [void] Table1_22_CutWhenCheckOpen ([int]$CutWhenCheckOpen){
        $this.connect.editingValueInt(1, 1, 22, $CutWhenCheckOpen)
    }

    # Запрет нулевого чека
    [void] Table1_23_BanZeroCheck ([int]$BanZeroCheck){
        $this.connect.editingValueInt(1, 1, 23, $BanZeroCheck)
    }

    # Отступ в строке типов оплаты
    [void] Table1_24_IndientPaymentTypes ([int]$IndientPaymentTypes){
        $this.connect.editingValueInt(1, 1, 24, $IndientPaymentTypes)
    }

    # Использование Форматирования в чеке
    [void] Table1_25_UseFormattingInCheck ([int]$UseFormattingInCheck){
        $this.connect.editingValueInt(1, 1, 25, $UseFormattingInCheck)
    }

    # Обнуление счетчика чеков
    [void] Table1_26_ResetCounterChecks ([int]$ResetCounterChecks){
        $this.connect.editingValueInt(1, 1, 26, $ResetCounterChecks)
    }

    # Контроль времени
    [void] Table1_27_TimeControl ([int]$TimeControl){
        $this.connect.editingValueInt(1, 1, 27, $TimeControl)
    }

    # Отключение звука при ошибках
    [void] Table1_28_MuteWhenError ([int]$MuteWhenError){
        $this.connect.editingValueInt(1, 1, 28, $MuteWhenError)
    }

    # Межстрочный интервал
    [void] Table1_29_LineInterval ([int]$LineInterval){
        $this.connect.editingValueInt(1, 1, 29, $LineInterval)
    }

    # Тип суточного отчета
    [void] Table1_30_DayliReportType ([int]$DayliReportType){
        $this.connect.editingValueInt(1, 1, 30, $DayliReportType)
    }

    # Сжатие шрифта на чековой ленте
    [void] Table1_31_FontCompressionOnCheck ([int]$FontCompressionOnCheck){
        $this.connect.editingValueInt(1, 1, 31, $FontCompressionOnCheck)
    }

    # Разгон при печати
    [void] Table1_32_OverclockWhenPrint ([int]$OverclockWhenPrint){
        $this.connect.editingValueInt(1, 1, 32, $OverclockWhenPrint)
    }

    # Коррекция яркости
    [void] Table1_33_BrightnessСorrection ([int]$BrightnessСorrection){
        $this.connect.editingValueInt(1, 1, 33, $BrightnessСorrection)
    }

    # Яркость печати
    [void] Table1_34_BritnessPrint ([int]$BritnessPrint){
        $this.connect.editingValueInt(1, 1, 34, $BritnessPrint)
    }

    # Печать типов оплаты
    [void] Table1_35_PrintPyamenTypes ([int]$PrintPyamenTypes){
        $this.connect.editingValueInt(1, 1, 35, $PrintPyamenTypes)
    }

    # Положение принтера
    [void] Table1_36_PrinterPosition ([int]$PrinterPosition){
        $this.connect.editingValueInt(1, 1, 36, $PrinterPosition)
    }

    # Печать рнм
    [void] Table1_37_PrintRNM ([int]$PrintRNM){
        $this.connect.editingValueInt(1, 1, 37, $PrintRNM)
    }

    # Укороченное клише
    [void] Table1_38_ShortCliche ([int]$ShortCliche){
        $this.connect.editingValueInt(1, 1, 38, $ShortCliche)
    }

    # Печать клише после завершения документа
    [void] Table1_39_PrintClicheAfterDocument ([int]$PrintClicheAfterDocument){
        $this.connect.editingValueInt(1, 1, 39, $PrintClicheAfterDocument)
    }

    # Скорость печати 
    [void] Table1_40_PrintSpeed ([int]$PrintSpeed){
        $this.connect.editingValueInt(1, 1, 40, $PrintSpeed)
    }

    # Кодирование реквизитов чека
    [void] Table1_41_CodingDetailsCheck ([int]$CoddingDetailsCheck ){
        $this.connect.editingValueInt(1, 1, 41, $CoddingDetailsCheck)
    }

    # Кодирование ссылки
    [void] Table1_42_CodingLink ([int]$CodingLink){
        $this.connect.editingValueInt(1, 1, 42, $CodingLink)
    }

    # Автопечать журнала
    [void] Table1_43_AutoPrintJournal ([int]$AutoPrintJournal){
        $this.connect.editingValueInt(1, 1, 43, $AutoPrintJournal)
    }

    # Ведение журнала
    [void] Table1_44_ConductionJournal ([int]$ConductionJournal){
        $this.connect.editingValueInt(1, 1, 44, $ConductionJournal)
    }

    # Режим низкого потребления
    [void] Table1_45_LowConsumptionMode ([int]$LowConsumptionMode){
        $this.connect.editingValueInt(1, 1, 45, $LowConsumptionMode)
    }

    <#
    Таблица № 2
    Пароли Кассиров и администраторов
    #>

    [void] Table2_1_Password ([int]$Password){
        $this.connect.editingValueInt(2, 1, 1, $Password)
    }

    [void] Table2_1_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 1, 2, $PositionAndSurname)
    }

    [void] Table2_2_Password ([int]$Password){
        $this.connect.editingValueInt(2, 2, 1, $Password)
    }

    [void] Table2_2_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 2, 2, $PositionAndSurname)
    }


    [void] Table2_3_Password ([int]$Password){
        $this.connect.editingValueInt(2, 3, 1, $Password)
    }

    [void] Table2_3_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 3, 2, $PositionAndSurname)
    }


    [void] Table2_4_Password ([int]$Password){
        $this.connect.editingValueInt(2, 4, 1, $Password)
    }

    [void] Table2_4_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 4, 2, $PositionAndSurname)
    }

    [void] Table2_5_Password ([int]$Password){
        $this.connect.editingValueInt(2, 5, 1, $Password)
    }

    [void] Table2_5_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 5, 2, $PositionAndSurname)
    }

    [void] Table2_6_Password ([int]$Password){
        $this.connect.editingValueInt(2, 6, 1, $Password)
    }

    [void] Table2_6_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 6, 2, $PositionAndSurname)
    }

    [void] Table2_7_Password ([int]$Password){
        $this.connect.editingValueInt(2, 7, 1, $Password)
    }

    [void] Table2_7_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 7, 2, $PositionAndSurname)
    }

    [void] Table2_8_Password ([int]$Password){
        $this.connect.editingValueInt(2, 8, 1, $Password)
    }

    [void] Table2_8_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 8, 2, $PositionAndSurname)
    }


    [void] Table2_9_Password ([int]$Password){
        $this.connect.editingValueInt(2, 9, 1, $Password)
    }

    [void] Table2_9_PositionAndSurname ([string]$PositionAndSurname){
        $this.connect.editingValueString(2, 9, 2, $PositionAndSurname)
    }

    [void] Table2_10_Password ([int]$Password){
        $this.connect.editingValueInt(2, 10, 1, $Password)
    }

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
        $this.connect.editingValueString(4, 1, 1, $Reklama1)
    }

    # Реклама в чеке 2 строка
    [void] Table4_2_Reklama2 ([string]$Reklama2){
        $this.connect.editingValueString(4, 1, 2, $Reklama2)
    }

    # Реклама в чеке 3 строка
    [void] Table4_3_Reklama3 ([string]$Reklama3){
        $this.connect.editingValueString(4, 1, 3, $Reklama3)
    }

    # Клише 4 строка
    [void] Table4_4_Cliche4 ([string]$Cliche4){
        $this.connect.editingValueString(4, 1, 4, $Cliche4)
    }

    # Клише 5 строка
    [void] Table4_5_Cliche5 ([string]$Cliche5){
        $this.connect.editingValueString(4, 1, 5, $Cliche5)
    }

    # Клише 6 строка
    [void] Table4_6_Cliche6 ([string]$Cliche6){
        $this.connect.editingValueString(4, 1, 6, $Cliche6)
    }

    # Клише 7 строка
    [void] Table4_7_Cliche7 ([string]$Cliche7){
        $this.connect.editingValueString(4, 1, 7, $Cliche7)
    }

    # Клише 8 строка
    [void] Table4_8_Cliche8 ([string]$Cliche8){
        $this.connect.editingValueString(4, 1, 8, $Cliche8)
    }

    # Клише 9 строка
    [void] Table4_9_Cliche9 ([string]$Cliche9){
        $this.connect.editingValueString(4, 1, 9, $Cliche9)
    }

    # Клише 10 строка
    [void] Table4_10_Cliche10 ([string]$Cliche10){
        $this.connect.editingValueString(4, 1, 10, $Cliche10)
    }

    # Клише 11 строка
    [void] Table4_11_Cliche11 ([string]$Cliche11){
        $this.connect.editingValueString(4, 1, 11, $Cliche11)
    }

    # Клише 12 строка
    [void] Table4_12_Cliche12 ([string]$Cliche12){
        $this.connect.editingValueString(4, 1, 12, $Cliche12)
    }

    # Клише 13 строка
    [void] Table4_13_Cliche13 ([string]$Cliche13){
        $this.connect.editingValueString(4, 1, 13, $Cliche13)
    }

    # Клише 14 строка
    [void] Table4_14_Cliche14 ([string]$Cliche14){
        $this.connect.editingValueString(4, 1, 14, $Cliche14)
    }

    <#
    Таблица № 5
    Наименование типов оплаты
    #>

    # Тип оплаты 1
    [void] Table5_1_PaymentType1 ([string]$PaymentType1){
        $this.connect.editingValueString(5, 1, 1, $PaymentType1)
    }

    # Тип оплаты 2
    [void] Table5_2_PaymentType2 ([string]$PaymentType2){
        $this.connect.editingValueString(5, 1, 2, $PaymentType2)
    }

    # Тип оплаты 3
    [void] Table5_3_PaymentType3 ([string]$PaymentType3){
        $this.connect.editingValueString(5, 1, 3, $PaymentType3)
    }

    # Тип оплаты 4
    [void] Table5_4_PaymentType4 ([string]$PaymentType4){
        $this.connect.editingValueString(5, 1, 4, $PaymentType4)
    }

    # Тип оплаты 5
    [void] Table5_5_PaymentType5 ([string]$PaymentType5){
        $this.connect.editingValueString(5, 1, 5, $PaymentType5)
    }

    # Тип оплаты 6
    [void] Table5_6_PaymentType6 ([string]$PaymentType6){
        $this.connect.editingValueString(5, 1, 6, $PaymentType6)
    }

    # Тип оплаты 7
    [void] Table5_7_PaymentType7 ([string]$PaymentType7){
        $this.connect.editingValueString(5, 1, 7, $PaymentType7)
    }

    # Тип оплаты 8
    [void] Table5_8_PaymentType8 ([string]$PaymentType8){
        $this.connect.editingValueString(5, 1, 8, $PaymentType8)
    }

    # Тип оплаты 9
    [void] Table5_9_PaymentType9 ([string]$PaymentType9){
        $this.connect.editingValueString(5, 1, 9, $PaymentType9)
    }

    # Тип оплаты 10
    [void] Table5_10_PaymentType10 ([string]$PaymentType10){
        $this.connect.editingValueString(5, 1, 10, $PaymentType10)
    }

    # Тип оплаты 11
    [void] Table5_11_PaymentType11 ([string]$PaymentType11){
        $this.connect.editingValueString(5, 1, 11, $PaymentType11)
    }

    # Тип оплаты 12
    [void] Table5_12_PaymentType12 ([string]$PaymentType12){
        $this.connect.editingValueString(5, 1, 12, $PaymentType12)
    }

    # Тип оплаты 13
    [void] Table5_13_PaymentType13 ([string]$PaymentType13){
        $this.connect.editingValueString(5, 1, 13, $PaymentType13)
    }

    # Тип оплаты 14
    [void] Table5_14_PaymentType14 ([string]$PaymentType14){
        $this.connect.editingValueString(5, 1, 14, $PaymentType14)
    }

    # Тип оплаты 15
    [void] Table5_15_PaymentType15 ([string]$PaymentType15){
        $this.connect.editingValueString(5, 1, 15, $PaymentType15)
    }

    # Тип оплаты 16
    [void] Table5_16_PaymentType16 ([string]$PaymentType16){
        $this.connect.editingValueString(5, 1, 16, $PaymentType16)
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
    
    # Socks5 ip5
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
    [void] Table21_8_WiFipassphrase ([string]$WiFipassphrase){
        $this.connect.editingValueInt(21, 1, 8, $WiFipassphrase)
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
