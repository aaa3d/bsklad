{
* Экспорт отчета "Отчет об остатках товаров на складе" в MS Excel
* для системы BSklad. Используется в модуле: ReportOstNew
* доработка в соответствии с документом
* .."\BSklad\DOC\Denis Potapov\Экспорт в Excel отчета об остатках товаров\"
* Denis Potapov 2004 (c)
}
unit ReportRemainingGoods;

interface
uses Parent_Excel_Report, Gauges, IBQuery, Windows, Request_Response;

Const
 CN_MainSheetName = 'Лист1'; //название щита экселевской книги с первым отчетом
 CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
 CN_TemplateName = 'Отчет об остатках товаров.xlt'; //название файла шаблона отчета
 //название файла шаблона широкого варианта отчета
 CN_TemplateNameWideReport = 'Отчет об остатках товаров широкий.xlt';
 CN_TemplateNameLayoutByDepots =
   'Отчет об остатках товаров с разбивкой по складам.xlt'; //отчет с разбивкой по складам

Type
 //"Отчет об остатках товаров на складе"
 TReportRemainingGoods = class(TReportExcel)
   countRow, endReportRow, NumCol, StartTableRow:integer;
   EndReportCell, SummCell : TPoint;
   ReportName:String; //заголовок отчета
   ProgressBarObject:TGauge; //индикатор прогресса отчета
   QMain: TIBQuery; //основной отчет с данными
   QDepotNames: TIBQuery; //даные по названиям всех складов
   isAuditReportRequired : Boolean; //нужен ли отчет для ревизии или нет
   isLayoutByDepots : Boolean; //это отчет по всем складам или нет
   constructor Create; override;//конструктор
   destructor  Destroy; override; //деструктор
   //Открывает нужный отчет (нужный файл)
   procedure OpenReport;
   procedure TunePositions;
  private
    procedure MakeAuditReport;
    procedure MoveData(Const curRow, numCol :integer);
    procedure MoveData_LayoutByDepots(Const curRow, numCol :integer);
  public
   procedure CreateReport();
 end;

 //"Отчет об остатках товаров на складе" - выгрузка в тектовый файл
 //отчет нужен для импорта информации об остатков товаров на сайт фирмы
 TTXTReportRemainingGoods = class
//   FParamRequest: TParamRequest;
   constructor Create; virtual; //конструктор
   destructor  Destroy; //деструктор
   //создает отчет в соответствии с объектом параметров отчета
   procedure CreateReport(ParamRequest: TParamRequest);
 end;

implementation
uses sysutils, excel2000, B_DButils, Dialogs;
{ TReportRemainingGoods }

constructor TReportRemainingGoods.Create;
begin
  inherited;
  ReportName := FParamRequest.LocateVar('ReportName'); //заголовок отчета
  ProgressBarObject := TGauge(FParamRequest.LocateObj('ProgressBarObject'));//индикатор прогресса отчета
  QMain := TIBQuery(FParamRequest.LocateObj('QMain')); //основной отчет с данными
  isAuditReportRequired := FParamRequest.LocateVar('isAuditReportRequired'); //нужен ли отчет для ревизии или нет
  isLayoutByDepots := FParamRequest.LocateVar('isLayoutByDepots'); //это отчет с разбивкой по складам или нет
  if (isLayoutByDepots) then //в этом случае надо прочитать дополнительный запрос
   QDepotNames := TIBQuery(FParamRequest.LocateObj('QDepotNames')); //даные по названиям всех складов
end;

//формируем сам отчет
procedure TReportRemainingGoods.CreateReport;
Var
 CurRow : integer;
 curGroupName :String;
 _rng : Range;
 _tt:_Worksheet;

    r: Range;
    v : olevariant;
    startRow: integer;
    numRecords: integer;
    iRow: integer;
    numColumns: integer;
begin
try
 CreateExcel(true);
 OpenReport; //открывает нужный файл шаблона Excel
 //если есть стоки, то отчет надо формировать и настроить первым делом все курсоры
 TunePositions; //настройка позиций начала и окончания отчета и позиции курсора, указателей столбцов
 //заполняем шапку отчета
 Value_to_Named_Cell(Sheet, 'ReportName', ReportName);
 //владельца
 Value_to_Named_Cell(Sheet, 'OwnerCell', 'Пользователь: ' + USERFIO_SHORT);
 //если это отчет с разбивкой по складам, то надо вписать названия складов из вспомогательного запроса
 numColumns:=9;
 if ((isLayoutByDepots) and (QDepotNames <> nil)) then //это отчет с разбивкой по складам
  begin
   if not (QDepotNames.Active) then QDepotNames.Open;
   QDepotNames.First;
   countRow :=1;
   numColumns:=17;
   While (not (QDepotNames.EOF) and (countRow<=10)) do
    begin //печатаем названия первых 10 складов (почему то так было сделано изначально)
     Sheet.Cells.Item[startTableRow-1, EndReportCell.X-10+countRow].Value :=
      QDepotNames.FieldByName('SKL_SHORT').asString;
     Inc(countRow);
     QDepotNames.Next();
    end;
  end;
 //заполняем отчет
 curRow:=StartTableRow;
 countRow := 1;
 iRow:=0;
 curGroupName := '';
 numRecords:=0;
 if not (QMain.Active) then QMain.Open;
 QMain.First;
 //Определяем общее количество элементов
  while not QMain.EOF do
  	begin
    if (QMain.FieldByName('TWTREE_FULL').asString <> curGroupName) then
     begin
     curGroupName := QMain.FieldByName('TWTREE_FULL').asString;
       	inc(numRecords);
     end;

  	inc(numRecords);
    QMain.Next;
    end;

 QMain.First;

 v := VarArrayCreate([0, numRecords, 0, numColumns], varVariant);

 curGroupName:='';

 while not QMain.EOF do
  begin
    //пишем название группы. Оно будет печататься только при смене значения

    if (QMain.FieldByName('TWTREE_FULL').asString <> curGroupName) then
     begin

      curGroupName := QMain.FieldByName('TWTREE_FULL').asString;

      _rng := SelectRange(curRow, 1, curRow, EndReportCell.X);
      _rng.Font.Size := 12;
      _rng.Font.Bold := True;


      v[iRow, 0] := curGroupName;
      inc(iRow);
      Inc(curRow);




     end;
    //переносит 1 логический элемент в текущую строку. Сначала-общие для всех отчетов данные
    //номер товара по порядку







    v[iRow, 0] := IntToStr(countRow);
    v[iRow, 1] := QMain.FieldByName('TW_ART').asString; //код товара
    v[iRow, 2] := QMain.FieldByName('TW_NAM').asString; //наименование товара
    v[iRow, 3] := QMain.FieldByName('ED_SHORT').asString; //ед. изм. товара
    v[iRow, 4] := QMain.FieldByName('TW_MROZ').asCurrency; //розн. цена товара
    if (isLayoutByDepots) then //это отчет с разбивкой по складам
    begin
      v[iRow, 5] := QMain.FieldByName('OST_ALL').asFloat; //остаток товара
      v[iRow, 6] := QMain.FieldByName('OST1').asFloat; //остаток товара
      v[iRow, 7] := QMain.FieldByName('OST2').asFloat; //остаток товара
      v[iRow, 8] := QMain.FieldByName('OST3').asFloat; //остаток товара
      v[iRow, 9] := QMain.FieldByName('OST4').asFloat; //остаток товара
      v[iRow, 10] := QMain.FieldByName('OST5').asFloat; //остаток товара
      v[iRow, 11] := QMain.FieldByName('OST6').asFloat; //остаток товара
      v[iRow, 12] := QMain.FieldByName('OST7').asFloat; //остаток товара
      v[iRow, 13] := QMain.FieldByName('OST8').asFloat; //остаток товара
      v[iRow, 14] := QMain.FieldByName('OST9').asFloat; //остаток товара
      v[iRow, 15] := QMain.FieldByName('OST10').asFloat; //остаток товара


//             MoveData_LayoutByDepots(curRow, numCol)
    end
    else //Обычный отчет
    begin
      v[iRow, 5] := QMain.FieldByName('TW_OST').asFloat; //остаток товара
      v[iRow, 6] := QMain.FieldByName('TW_KWM').asFloat; //остаток товара
      v[iRow, 7] := QMain.FieldByName('TW_WEIGHT').asFloat; //остаток товара
      v[iRow, 8] := QMain.FieldByName('TW_SUMM').asCurrency; //на сумму в розн.
    end;





 {


    Sheet.Cells.Item[curRow, NumCol].Value := IntToStr(countRow);
    Sheet.Cells.Item[curRow, NumCol+1].Value :=
     QMain.FieldByName('TW_ART').asString; //код товара
    Sheet.Cells.Item[curRow, NumCol+2].Value :=
     QMain.FieldByName('TW_NAM').asString; //наименование товара
    Sheet.Cells.Item[curRow, NumCol+3].Value :=
     QMain.FieldByName('ED_SHORT').asString; //ед. изм. товара
    Sheet.Cells.Item[curRow, NumCol+4].Value :=
     QMain.FieldByName('TW_MROZ').asCurrency; //розн. цена товара
    //теперь особенные данные
    //если это отчет с разбивкой по складам, то одна процедура, иначе-другая
    if (isLayoutByDepots) then //это отчет с разбивкой по складам
     MoveData_LayoutByDepots(curRow, numCol)
    else //обычный отчет по остаткам
     MoveData(curRow, numCol);
}
    //рисуем линию внизу
//    DrawFrame(SelectRange(curRow, NumCol, curRow, EndReportCell.X), [cnBottomBorder]);
    Inc(curRow);
    Inc(countRow);
    inc(iRow);
    QMain.Next;
  end;

  r := Sheet.Range[Sheet.Cells.Item[4, 1],  Sheet.Cells.Item[4+numRecords ,numColumns ]];
  r.Value := v;
  //прорисовать линии сверху, и снизу каждой ячейки диапазона
  _rng := SelectRange(StartTableRow, NumCol, curRow-1, EndReportCell.X);
  DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
  //подвал очета
  Inc(curRow);
  if (isLayoutByDepots) then //это отчет с разбивкой по складам
    //ПРОСТО: Итого столько то наименований товаров
   Sheet.Cells.Item[curRow, NumCol].Value := 'Итого ' +
     IntToStr(countRow-1) + ' наименований товаров.'
  else
   begin
    Sheet.Cells.Item[curRow, NumCol].Value := 'Итого ' +
      IntToStr(countRow-1) + ' наименований товаров на сумму в розничных ценах :';
    Sheet.Cells.Item[curRow, NumCol + 7].Formula :=
       '=SUM(' + Chr(Ord('A')+SummCell.X-1) + IntToStr(SummCell.Y) + ':' +
          Chr(Ord('A')+SummCell.X-1) + IntToStr(curRow - 1) + ')';
   end;
  _rng := SelectRange(curRow, NumCol, curRow, EndReportCell.X);
  _rng.Font.Bold := True;
  //запоминаем последнюю фактическую строку отчета для возможного отчета для ревизии
  endReportRow := curRow;
  //если требуется пропечатать отчет для ревизии и это не отчет по всем складам, то это делается здесь
  if ((isAuditReportRequired) and not (isLayoutByDepots)) then
   MakeAuditReport() //на второй странице книги сформировать отчет для ревизии
  else //иначе - удалить этот лист!
   if not isLayoutByDepots then
   begin
    try
      ExcelApp.DisplayAlerts[0] := False;
     _tt:=Workbook.Worksheets.Item['Для ревизии'] as _Worksheet;
     _tt.Delete(0);
    finally
      ExcelApp.DisplayAlerts[0] := true;
    end;
   end; 
 finally
  ExcelApp.Interactive[0] := true;
  ExcelApp.ScreenUpdating[0] := true;
  ShowExcel;
 end;
end;

destructor TReportRemainingGoods.Destroy;
begin
  inherited;
  ProgressBarObject := nil;
  QMain := nil;
  QDepotNames := nil;
end;

procedure TReportRemainingGoods.OpenReport;
Var
 s : String;
begin
 s:= ExtractFilePath(ParamStr(0)) + CN_TemplateFolder + '\';
 if (isLayoutByDepots) then //это отчет с разбивкой по складам
  s:= s + CN_TemplateNameLayoutByDepots
 else
 if not (FParamRequest.LocateVar('isWideReport')) then s:= s + CN_TemplateName
 else s:= s + CN_TemplateNameWideReport; //разные файлы отчетов. Второй вариант- широкий отчет
 OpenWithTemplate(s);
 ExcelApp.Interactive[0] := false;
 ExcelApp.ScreenUpdating[0] := false;
end;

procedure TReportRemainingGoods.TunePositions;
begin
  StartTableRow:=1 + Workbook.Names.Item('StartTable', EmptyParam, EmptyParam).RefersToRange.Row;
  NumCol:=Workbook.Names.Item('NumCell', EmptyParam, EmptyParam).RefersToRange.Column;
  SummCell:=getPosNamedCell('SummCell', 0, 1); //коорд. ячейки + 1 строка вниз
  EndReportCell := getPosNamedCell('EndReportCell', 0, 0); //коордю конечной ячейки отчета
end;

//на второй странице книги формирует отчет для ревизии
//посредством копирования инфорации с первой страницы и дорисовывания линий
procedure TReportRemainingGoods.MakeAuditReport();
Var
 AuditSheet : _WorkSheet; //страница отчета для ревизии
 _rng :Range;
 EndAuditReportCol : integer;
begin
 try
 //определить ссылку на второй лист книги
 AuditSheet := Workbook.Worksheets.Item['Для ревизии'] as _Worksheet;
 //выделить диапазон ячеек данных на первом листе книге
 _rng := SelectRange(1, NumCol, EndReportRow, NumCol+3); //здесь лучше жестко зашить четыре копируемые колонки
 //скопировать его на второй лист
 //Выделяемый диапазон (куда копируем) - на другой странице!
 _rng.Copy(SelectRange(1, NumCol, EndReportRow, NumCol+3, AuditSheet));
 //прорисовать линии в диапазоне
 EndAuditReportCol := Workbook.Names.Item('EndAuditReportCell', EmptyParam, EmptyParam).RefersToRange.Column;
 _rng := SelectRange(StartTableRow, NumCol, EndReportRow-2, EndAuditReportCol, AuditSheet);
 DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
 //Итого столько то наименований товаров
 AuditSheet.Cells.Item[EndReportRow, NumCol].Value := 'Итого ' +
    IntToStr(countRow-1) + ' наименований товаров.';
 //скопировать верх отчета целиком - где указан автор отчета
 except
  //никаких ошибок быть не должно
 end;
end;

//переносит один блок данных для отчета с разбивкой по складам
//в указанную строку, начиная (смещение фиксированное) с начального столбца
procedure TReportRemainingGoods.MoveData_LayoutByDepots(Const curRow, numCol :integer);
Var
 i:integer;
begin
  //переносим остаток всего, остатки по 10 складам и меняем цвет ячеек
  //на синий там, где остаток больше нуля или на красный, если меньше
  Sheet.Cells.Item[curRow, NumCol+5].Value :=
   QMain.FieldByName('OST_ALL').asFloat; //остаток всего
  //в цакле выставляем остатки по 10 складам
  for i:= 1 to 10 do
   begin
    Sheet.Cells.Item[curRow, NumCol+5+i].Value :=
     QMain.FieldByName('OST'+IntToStr(i)).asFloat; //остаток на складе номер i
     //меняем цвет ячеек на синий там, где остаток больше нуля или на красный, если меньше
     if (QMain.FieldByName('OST'+IntToStr(i)).asFloat<>0) then
      if (QMain.FieldByName('OST'+IntToStr(i)).asFloat<0)
         then Sheet.Cells.Item[curRow, NumCol+5+i].Interior.Color:=$005151FF //красный
      else Sheet.Cells.Item[curRow, NumCol+5+i].Interior.Color:=$00FFB9B9 //синий;
   end;
end;

//переносит один блок данных для обычного отчета по остаткам
//в указанную строку, начиная (смещение фиксированное) с начального столбца
procedure TReportRemainingGoods.MoveData(Const curRow, numCol :integer);
begin
  Sheet.Cells.Item[curRow, NumCol+5].Value :=
   QMain.FieldByName('TW_OST').asFloat; //остаток товара
  Sheet.Cells.Item[curRow, NumCol+6].Value :=
   QMain.FieldByName('TW_SUMM').asCurrency; //на сумму в розн.
end;

{ TTXTReportRemainingGoods }

constructor TTXTReportRemainingGoods.Create;
begin
 inherited;
end;

//создает отчет в соответствии с объектом параметров отчета
procedure TTXTReportRemainingGoods.CreateReport(
  ParamRequest: TParamRequest);
Var
 ReportFile : TextFile;
 s, curGroupName, FileName : String;
 QMain: TIBQuery;
begin
 //создаем текстовый файл, где сказано
 try
  FileName := ParamRequest.LocateVar('FileName');
  QMain := TIBQuery(ParamRequest.LocateObj('QMain')); //основной отчет с данными
  if (FileName = '') or (QMain = nil) then
    raise Exception.Create('не указано имя файла');
  AssignFile(ReportFile, FileName);
  Rewrite(ReportFile);
  //формируем строку данных
  curGroupName := '';
  if not (QMain.Active) then QMain.Open;
  QMain.First;
  while not QMain.EOF do
   begin
    //пишем название группы. Оно будет печататься только при смене значения с указанием особого типа
    if (QMain.FieldByName('TWTREE_FULL').asString <> curGroupName) then
     begin
      curGroupName := QMain.FieldByName('TWTREE_FULL').asString;
      //Код строки(признак, товар это или группа)      Код группы
      //Наименование группы	Ед.	Розн. цена	Остаток
      //1- код описания группы, 0- описание товара
      s:='1;' + QMain.FieldByName('TWTREE_ID').asString + ';' +
         QMain.FieldByName('TWTREE_FULL').asString + ';' +
          ';' + ';';
      //пишем все в файл
      Writeln(ReportFile, s);
     end;
    //Код строки(описание товара это или группы)      Код товара
    //Наименование товара	Ед.	Розн. цена	Остаток
    //1- код описания группы, 0- описание товара
    s:='0;' + QMain.FieldByName('TW_ART').asString + ';' +
      QMain.FieldByName('TW_NAM').asString + ';' +
       QMain.FieldByName('ED_SHORT').asString + ';' +
        QMain.FieldByName('TW_MROZ').asString + ';' +
         QMain.FieldByName('TW_OST').asString;
    //пишем все в файл
    Writeln(ReportFile, s);
    QMain.Next;
   end;
   //говорим об успехе
   //закрываем файл
   CloseFile(ReportFile);
   ShowMessage('Текстовый файл отчета успешно сформирован. Путь к файлу: ' +
                FileName);
{   try
    if (ParamRequest.LocateVar('isShowReportAfterCreating')) then
     ExecProgram('NOTEPAD.EXE' + FileName, 0);
   except
   end;
} except
  on e: Exception do
   begin
    CloseFile(ReportFile);
    ShowMessage('Ошибка при формировании текстового файла отчета "об ' +
      'остатках товара". (' + e.Message + ')');
   end;
 end;
end;

destructor TTXTReportRemainingGoods.Destroy;
begin
 inherited;
end;

end.
