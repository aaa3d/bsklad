{
* Экспорт списка дисконтных карт в MS Excel
* для системы BSklad. Используется в модуле: JouCard
* доработка в соответствии с документом
* .."\BSklad\DOC\Denis Potapov\Denis Potapov\Изменения по дисконтным картам (задание номер три)"
* Denis Potapov 2004 (c)
}
unit ReportCardsToExcel;

interface
uses Parent_Excel_Report, Gauges, IBQuery, Windows, Request_Response;

Const
 CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
 CN_TemplateName = 'Отчет список дисконтных карт.xlt'; //название файла шаблона отчета

Type
 //"Экспорт списка дисконтных карт в MS Excel "
 TReportCardsListToExcel = class(TReportExcel)
   countRow, endReportRow, NumCol, StartTableCol, StartTableRow:integer;
   ReportName:String; //заголовок отчета
   ProgressBarObject:TGauge; //индикатор прогресса отчета
   QMain: TIBQuery; //основной отчет с данными
   ApplyFilterText:String; //Примененный фильтр к списку карт словами
   constructor Create; override;//конструктор
   destructor  Destroy; override; //деструктор
   //Открывает нужный отчет (нужный файл)
   procedure OpenReport;
   procedure TunePositions;
  private
//    procedure MoveData(Const curRow, numCol :integer);
    //функция вставляет указанные поля из компонента-таблицы IBQuery в Excel по N
    //штук через буфер обмена. Возвращает число успешно вставленных записей.
    function InsertTableToExcel(Var StartRow, StartCol:integer; AQuery:TIBQuery;
       SetFields: array of integer; CountRows:integer = 500):longint;
  public
   procedure CreateReport();
 end;

implementation

uses sysutils, excel2000, B_DButils, Dialogs;

{ TReportCardsListToExcel }

constructor TReportCardsListToExcel.Create;
begin
  inherited;
  ReportName := FParamRequest.LocateVar('ReportName'); //заголовок отчета
  ApplyFilterText := FParamRequest.LocateVar('ApplyFilterText'); //Примененный фильтр к списку карт словами
  ProgressBarObject := TGauge(FParamRequest.LocateObj('ProgressBarObject'));//индикатор прогресса отчета
  QMain := TIBQuery(FParamRequest.LocateObj('QMain')); //основной отчет с данными
end;

//формируем сам отчет
procedure TReportCardsListToExcel.CreateReport;
Var
 CurRow : integer;
 curGroupName :String;
 _rng : Range;
 _tt:_Worksheet;
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
 //строку фильтра для списка карт словами
 Value_to_Named_Cell(Sheet, 'ApplyFilterText', 'Фильтр: ' + ApplyFilterText);
 //заполняем отчет
 curRow:=StartTableRow;
 countRow := 1;
 if not (QMain.Active) then QMain.Open;
 QMain.First;
 //вставляем все данные из таблицы в ексель                
 InsertTableToExcel(curRow, NumCol, QMain, [1,2,3,4,5,7,9,15,16,17,18, 19,20,21,22,23,24,25,26,27,28]);
{
  //прорисовать линии сверху, и снизу каждой ячейки диапазона
  _rng := SelectRange(StartTableRow, NumCol, curRow-1, EndReportCell.X);
  DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
  //подвал очета
  Inc(curRow);
} finally
  ExcelApp.Interactive[0] := true;
  ExcelApp.ScreenUpdating[0] := true;
  ShowExcel;
 end;
end;

destructor TReportCardsListToExcel.Destroy;
begin
  inherited;
  ProgressBarObject := nil;
  QMain := nil;
end;

function TReportCardsListToExcel.InsertTableToExcel(Var StartRow,
  StartCol: integer; AQuery: TIBQuery; SetFields: array of integer;
  CountRows: integer): longint;
Var
  v : olevariant;
  iRow, iCol, iParts: longint;
//  _cntParts, _cntRowsInLastParts : integer;
  _rng : Range;
begin
try
 result := 0;
 if not AQuery.Active then AQuery.Open;
 AQuery.DisableControls;
 AQuery.Last; //выясняем кол-во записей
 AQuery.RecordCount;
 v := VarArrayCreate([0, AQuery.RecordCount-1, 0, Length(SetFields)-1], varVariant);
 iRow := 0;
 AQuery.First;
 while not AQuery.Eof do
  begin
    for iCol:=0 to Length(SetFields)-1 do //цикл по массиву колонок-формируем одну строку данных
      v[iRow, iCol] := AQuery.Fields[SetFields[iCol]].AsVariant;
    inc(iRow);
    AQuery.Next;
   end;
 _rng := SelectRange(StartRow, StartCol,
         StartRow+AQuery.RecordCount-1,StartCol + Length(SetFields)-1);
 _rng.Value := v;
 DrawFrame(_rng, [cnAllBorder]);

 { универсальные задумки - оставляем до лучших времен
 _cntParts := AQuery.RecordCount div CountRows;
 _cntRowsInLastParts := AQuery.RecordCount mod CountRows;
 if (_cntParts>0) then
  v := VarArrayCreate([0, CountRows-1, 0, Length(SetFields)-1], varVariant);
 if (_cntRowsInLastParts>0) then
  v_last := VarArrayCreate([0, _cntRowsInLastParts-1, 0, Length(SetFields)-1], varVariant);
 AQuery.First;
 iRow := 0;
 iParts := 0;
 while not AQuery.Eof do
  begin
    for iCol:=0 to Length(SetFields)-1 do //цикл по массиву колонок-формируем одну строку данных
      v[iRow, iCol] := Fields[SetFields[iCol]].AsVariant;

      if (iRow = CountRows -1) then //надо сбросить массив данных в Excel
        begin
         _rng := SelectRange(StartRow+iParts*CountRows, StartCol,
             StartRow+(iParts+1)*CountRows ,StartCol + Length(SetFields)-1);
         _rng.Value := v;
         Inc(iParts);
         iRow := 0;
        end;
     end;
    Inc(iRow);
    Next;
   end;
 //выгружаем последний блок данных
 if (_cntLastParts<>0) then
  begin
    //корректируем размер массива с данными
//    SetLength(v,_cntLastParts);
    _rng := SelectRange(StartRow+iParts*CountRows, StartCol,
         StartRow+(iParts+1)*CountRows,StartCol + Length(SetFields)-1);
    _rng.Value := v;
  end;
}
 finally
  AQuery.EnableControls;
//  v:=nil;
 end;
end;

procedure TReportCardsListToExcel.OpenReport;
Var
 s : String;
begin
 s:= ExtractFilePath(ParamStr(0)) + CN_TemplateFolder + '\' +
  CN_TemplateName; //название шаблона отчета
 OpenWithTemplate(s);
 ExcelApp.Interactive[0] := false;
 ExcelApp.ScreenUpdating[0] := false;
end;

procedure TReportCardsListToExcel.TunePositions;
begin
  StartTableRow:=1 + Workbook.Names.Item('StartTable', EmptyParam, EmptyParam).RefersToRange.Row;
//  StartTableCol:=Workbook.Names.Item('StartTable', EmptyParam, EmptyParam).RefersToRange.Row;
  NumCol:=Workbook.Names.Item('NumCell', EmptyParam, EmptyParam).RefersToRange.Column;
end;

end.
