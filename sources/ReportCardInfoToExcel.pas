{
* Ёкспорт детальной информации о дисконтной карте в MS Excel
* дл€ системы BSklad. »спользуетс€ в модуле: EditCard, JouCard
* доработка в соответствии с документом
* .."\BSklad\DOC\Denis Potapov\Denis Potapov\»зменени€ по дисконтным картам (задание номер три)"
* Denis Potapov 2004 (c)
}
unit ReportCardInfoToExcel;

interface
uses Parent_Excel_Report, Gauges, IBQuery, Windows, Request_Response;

Const
 CN_TemplateFolder = 'Excel_шаблоны'; //папка отчетов
 CN_TemplateName = 'ќтчет дет.информаци€ по карте.xlt'; //название файла шаблона отчета

Type
 //"Ёкспорт списка дисконтных карт в MS Excel "
 TReportCardInfoToExcel = class(TReportExcel)
   countRow, StartTableCol, StartTableRow:integer;
   ProgressBarObject:TGauge; //индикатор прогресса отчета
      QMain: TIBQuery; //основной отчет с данными
   constructor Create; override;//конструктор
   destructor  Destroy; override; //деструктор
   //ќткрывает нужный отчет (нужный файл)
   procedure OpenReport;
   procedure TunePositions;
  private
    //функци€ вставл€ет указанные пол€ из компонента-таблицы IBQuery в Excel по N
    //штук через буфер обмена. ¬озвращает число успешно вставленных записей.
//    function InsertTableToExcel(Var StartRow, StartCol:integer; AQuery:TIBQuery;
//       SetFields: array of integer; CountRows:integer = 500):longint;
  public
   procedure CreateReport();
 end;

implementation

uses sysutils, excel2000, B_DButils, Dialogs;

{ TReportCardInfoToExcel }

constructor TReportCardInfoToExcel.Create;
begin
  inherited;
  ProgressBarObject := TGauge(FParamRequest.LocateObj('ProgressBarObject'));//индикатор прогресса отчета
  QMain := TIBQuery(FParamRequest.LocateObj('QMain')); //основной отчет с данными
end;

procedure TReportCardInfoToExcel.CreateReport;
Var
  iRow, CurRow : integer;
  _rng : Range;
  v : olevariant;
begin
try
 CreateExcel(true);
 OpenReport; //открывает нужный файл шаблона Excel
 //если есть стоки, то отчет надо формировать и настроить первым делом все курсоры
 TunePositions; //настройка позиций начала и окончани€ отчета и позиции курсора, указателей столбцов
 //заполн€ем шапку отчета
 Value_to_Named_Cell(Sheet, 'CARD_NUM', FParamRequest.LocateVar('CARD_NUM'));
 Value_to_Named_Cell(Sheet, 'REG_DATE', FParamRequest.LocateVar('CARD_DATE'));
 Value_to_Named_Cell(Sheet, 'CARD_DATE', FParamRequest.LocateVar('CARD_DATE'));
 Value_to_Named_Cell(Sheet, 'CARD_ADDSUMM', FParamRequest.LocateVar('CARD_ADDSUMM'));
 Value_to_Named_Cell(Sheet, 'CARD_OSN',
  StringReplace(FParamRequest.LocateVar('CARD_OSN'), #13, ' ', [rfReplaceAll, rfIgnoreCase]));
 Value_to_Named_Cell(Sheet, 'CARD_SKID', FParamRequest.LocateVar('CARD_SKID'));
 Value_to_Named_Cell(Sheet, 'SKID_OPIS', FParamRequest.LocateVar('SKID_OPIS'));
 Value_to_Named_Cell(Sheet, 'REG_USER_FULL', FParamRequest.LocateVar('REG_USER_FULL'));
 Value_to_Named_Cell(Sheet, 'US_FULL', FParamRequest.LocateVar('US_FULL'));
 Value_to_Named_Cell(Sheet, 'KLN_FULL', FParamRequest.LocateVar('KLN_FULL'));
 Value_to_Named_Cell(Sheet, 'KLN_FIO', FParamRequest.LocateVar('KLN_FIO'));
 if (FParamRequest.LocateVar('KLN_BIRTHDAY') <>0) then
  Value_to_Named_Cell(Sheet, 'KLN_BIRTHDAY', FParamRequest.LocateVar('KLN_BIRTHDAY'));
 Value_to_Named_Cell(Sheet, 'KLN_ADDRESS',
  StringReplace(FParamRequest.LocateVar('KLN_ADDRESS'), #13, ' ', [rfReplaceAll, rfIgnoreCase]));
 Value_to_Named_Cell(Sheet, 'KLN_ADDINFO',
  StringReplace(FParamRequest.LocateVar('KLN_ADDINFO'), #13, ' ', [rfReplaceAll, rfIgnoreCase]));
 Value_to_Named_Cell(Sheet, 'CARD_SUMM', FParamRequest.LocateVar('CARD_SUMM'));
 Value_to_Named_Cell(Sheet, 'SKID_SUMM', FParamRequest.LocateVar('SKID_SUMM'));
 Value_to_Named_Cell(Sheet, 'SKID_PERCENT', FParamRequest.LocateVar('SKID_PERCENT'));
 curRow:=StartTableRow;
 if not (QMain.Active) then QMain.Open;
 QMain.DisableControls;
 QMain.Last;
 if (QMain.RecordCount<>0) then
 begin
  v := VarArrayCreate([0, QMain.RecordCount-1, 0, 5], varVariant); //6 колонок
  QMain.First;
  iRow := 0;
  //вставл€ем все данные из таблицы в ексель
  while not (QMain.eof) do
   begin
     v[iRow, 0] := QMain.FieldByName('RN_NUM_FULL').AsVariant;
     v[iRow, 1] := QMain.FieldByName('RN_DATE').AsVariant;
     v[iRow, 2] := QMain.FieldByName('KLN_FULL').AsVariant;
     v[iRow, 3] := QMain.FieldByName('RN_SUMM').AsVariant;
     v[iRow, 4] := QMain.FieldByName('SKID_SUMM').AsVariant;
     v[iRow, 5] := QMain.FieldByName('US_FULL').AsVariant;
     inc(iRow);
     QMain.Next;
   end;
  inc(curRow, iRow);
  _rng := SelectRange(StartTableRow, StartTableCol,
         StartTableRow+QMain.RecordCount-1,StartTableCol+5);
  _rng.Value := v;
  DrawFrame(_rng, [cnAllBorder]);
 end;
{
  //прорисовать линии сверху, и снизу каждой €чейки диапазона
  _rng := SelectRange(StartTableRow, NumCol, curRow-1, EndReportCell.X);
  DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
  //подвал очета
  Inc(curRow);
} finally
   QMain.EnableControls;
   ExcelApp.Interactive[0] := true;
   ExcelApp.ScreenUpdating[0] := true;
   ShowExcel;
 end;
end;

destructor TReportCardInfoToExcel.Destroy;
begin
  inherited;
  ProgressBarObject := nil;
  QMain := nil;
end;

procedure TReportCardInfoToExcel.OpenReport;
Var
 s : String;
begin
 s:= ExtractFilePath(ParamStr(0)) + CN_TemplateFolder + '\' +
  CN_TemplateName; //название шаблона отчета
 OpenWithTemplate(s);
 ExcelApp.Interactive[0] := false;
 ExcelApp.ScreenUpdating[0] := false;
end;

procedure TReportCardInfoToExcel.TunePositions;
begin
  StartTableRow:=Workbook.Names.Item('RN_NUM_FULL', EmptyParam, EmptyParam).RefersToRange.Row;
  StartTableCol:=Workbook.Names.Item('RN_NUM_FULL', EmptyParam, EmptyParam).RefersToRange.Column;
end;

end.
