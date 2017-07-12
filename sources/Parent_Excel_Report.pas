{
* Базовый объект для работы с Еxcel-овскими файлами по созданию отчетов
* Denis Potapov 2002 (c)
}
unit Parent_Excel_Report;

interface
uses Excel2000, classes, OLEServer, Request_Response, Windows;

Const
 cnDef=-1; // по умолчанию
 cnNotDefDgt=-9999; //переменная не определена
 {названия макросов}
 cnClearSheet='ClearSheet'; //очищает рабочий лист
 {константы для работы с макросами}
 cnAutoFit:integer=-1; //ширина колонки - автоматически
 cnSetHorAlign=10;
 cnSetWarp=20;
 cnSetOrient=30;
 cnSetFit=40;
 cnSetWidth=50;
 cnSetMerge=60;
 cnBorder=70;
 cnTypeFont=80;
 cnEveryCol=-1;
 cnEveryRow=1; //построчно
 cnAll=0;

 cnAuto=-2;
 cnNotDef=-1;
 cnLeft=-1;
 cnCentre=0;
 cnRight=1;
 cnYesWarp=0;
 cnNoWarp=1;
 cnYesFit=1;
 cnNoFit=0;
 cnHor=0;
 cnVert=1;
 cnYesMerge=0;
 cnNoMerge=1;
 cnItalic=-1;
 cnNormal=0;
 cnBold=1;

 cnTopBorder = xlEdgeTop;
 cnBottomBorder = xlEdgeBottom;
 cnInsideHorizontalBorder = xlInsideHorizontal;
 cnAllBorder = 2002;
 cnLeftBorder = xlEdgeLeft;
 cnRightBorder = xlEdgeRight;


// xlShiftDown=-4121; //вставка со сдвигом вниз;

 Type
 TOleEnum = type Integer;

 {объект - родоначальник всех отчетов по OLE технологии}
 TReportExcel=class(TObject)
   FExcelApp: TExcelApplication;
   FWorkbook: _Workbook;
   FSheet: _Worksheet;
   ListTitle:TStringList; //Заголовок отчета
   constructor Create;  overload; virtual;//конструктор
   constructor Create(ParamRequest: TParamRequest; AOwner:TComponent); overload; virtual;
   destructor  Destroy; override;
  private
  protected
    FParamRequest: TParamRequest;
    function  GetPathOLEOFORM: String;
    procedure ShowReport;
    procedure CreateExcel (NewInstance: boolean);
    procedure ShowExcel;
    procedure HideExcel;
    procedure ReleaseExcel;
    procedure CloseWorkBook(DisplayAlerts: boolean);
    procedure OpenWithTemplate(const TemplateName:String);
    //вставляет значение в поименованную ячейку.
    procedure Value_to_Named_Cell(Sheet:_Worksheet; NameCell:string; Value:OLEVariant); overload;
    //возвращяет координаты поименованной ячейки или ошибку, если такой нет.
    //Смещения - если надо сразу поправить значение возвращаемой кординаты.
    function getPosNamedCell(NameCell:String; shiftX:integer = 0; shiftY:integer = 0):TPoint;
    //чертит рамку вокруг текущего выделенного диапазона ячеек
    procedure DrawFrame(IRange:Range; Frame: array of integer);
    //выделяет диапазон ячеек на заданной странице (по умолчанию страница не определена и будет использована FSheet)
    function SelectRange(TopRow, TopCol, BottomRow,
             BottomCol: integer; aSheet: _Worksheet = nil):Range;
    //выделяет диапазон столбцов
    function SelectColumns(StartCol, EndCol: integer): Range;
    //выделяет диапазон строк
    function SelectRows(StartRow, EndRow: integer): Range;
    //чертит рамку вокруг текущего выделенного диапазона ячеек
    procedure JoinCells(IRange:Range; Params: array of integer);
    //говорит "да", если удалось положить список aList с указанных координат aStartRow, aStartCol
    //без эксцессов
    function PutListToReport(aList:TStringList; aStartRow, aStartCol:integer): boolean;
  public
    { Public declarations }
    class function getFormattedString(Mantiss:integer):String;
    property  ExcelApp: TExcelApplication read FExcelApp;
    property  Workbook: _Workbook read FWorkBook;
    property  Sheet: _Worksheet read FSheet write FSheet;
 end;

implementation
uses SysUtils;
{ TReportExcel }

constructor TReportExcel.Create;
begin
 inherited;
end;

procedure TReportExcel.CreateExcel(NewInstance: boolean);
begin
  if not Assigned(ExcelApp) then begin
    FExcelApp := TExcelApplication.Create(nil);
    if NewInstance then FExcelApp.ConnectKind := ckNewInstance;
    FExcelApp.Connect;
  end;
end;

destructor TReportExcel.Destroy;
begin
  inherited;
  ReleaseExcel; // святое дело
end;

//выделяет диапазон ячеек на заданной странице
//(по умолчанию страница не определена и будет использована FSheet)
function TReportExcel.SelectRange(TopRow, TopCol, BottomRow,
     BottomCol: integer; aSheet:_Worksheet = nil):Range;
begin
 if (aSheet = nil) then aSheet := Sheet;
 Result := aSheet.Range[aSheet.Cells.Item[TopRow, TopCol],
                       aSheet.Cells.Item[BottomRow, BottomCol]];
end;

//выделяет диапазон столбцов
function TReportExcel.SelectColumns(StartCol, EndCol: integer):Range;
begin
{try
 Result := Sheet.Range[Sheet.Columns.Cells.Item[emptyParam, StartCol],
      Sheet.Columns.Cells.Item[emptyParam, EndCol]];
except
end;
}try
 Result := Sheet.Range[Sheet.Cells.Item[emptyParam, StartCol],
      Sheet.Cells.Item[emptyParam, EndCol]].EntireColumn;
except
end;
end;

//выделяет диапазон строк
function TReportExcel.SelectRows(StartRow, EndRow: integer):Range;
begin
{try
 Result := Sheet.Range[Sheet.Cells.Item[StartRow, emptyParam],
      Sheet.Cells.Item[EndRow, emptyParam]].EntireRow;
except
end;
}try
 Result := Sheet.Range[Sheet.Rows.Item[StartRow, emptyParam],
      Sheet.Rows.Item[EndRow, emptyParam]].EntireRow;
except
end;
end;

//чертит рамку вокруг текущего выделенного диапазона ячеек
procedure TReportExcel.DrawFrame(IRange:Range; Frame: array of integer);
Var
 i:integer;
begin
 for i:=Low(Frame) to High(Frame) do
  begin
   if (Frame[i]=cnTopBorder) or (Frame[i]=cnAllBorder) then
    begin
     IRange.Borders[xlEdgeTop].LineStyle := xlContinuous;
     IRange.Borders[xlEdgeTop].Weight := xlThin;
     IRange.Borders[xlEdgeTop].ColorIndex := xlAutomatic;
    end;
   if (Frame[i]=cnBottomBorder) or (Frame[i]=cnAllBorder) then
    begin
     IRange.Borders[xlEdgeBottom].LineStyle := xlContinuous;
     IRange.Borders[xlEdgeBottom].Weight := xlThin;
     IRange.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
    end;
   if (Frame[i]=cnLeftBorder) or (Frame[i]=cnAllBorder) then
    begin
     IRange.Borders[xlEdgeLeft].LineStyle := xlContinuous;
     IRange.Borders[xlEdgeLeft].Weight := xlThin;
     IRange.Borders[xlEdgeLeft].ColorIndex := xlAutomatic;
    end;
   if (Frame[i]=cnRightBorder) or (Frame[i]=cnAllBorder) then
    begin
     IRange.Borders[xlEdgeRight].LineStyle := xlContinuous;
     IRange.Borders[xlEdgeRight].Weight := xlThin;
     IRange.Borders[xlEdgeRight].ColorIndex := xlAutomatic;
    end;
   if (Frame[i]=xlInsideVertical) or (Frame[i]=cnAllBorder) then
    begin
     IRange.Borders[xlInsideVertical].LineStyle := xlContinuous;
     IRange.Borders[xlInsideVertical].Weight := xlThin;
     IRange.Borders[xlInsideVertical].ColorIndex := xlAutomatic;
    end;
//   if (Frame[i]=cnRightBorder) or (Frame[i]=cnAllBorder) then
//   if ((Frame[i]=xlInsideHorizontal) or (Frame[i]=cnAllBorder)) and not
//      ((High(Frame) - Low(Frame)) = 0) then
  try
   if ((Frame[i]=xlInsideHorizontal) or (Frame[i]=cnAllBorder)) then
    begin
     IRange.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
     IRange.Borders[xlInsideHorizontal].Weight := xlThin;
     IRange.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;
    end;
   except
   end;
   if (Frame[i]=cnAllBorder) then Break;
end;
end;

class function TReportExcel.getFormattedString(Mantiss: integer): String;
Var i:integer;
begin
 result:='';
 if mantiss>0 then result:='0,';
 for i:=1 to mantiss do
  result:=result+'0';
end;

function TReportExcel.GetPathOLEOFORM: String;
begin

end;

procedure TReportExcel.HideExcel;
begin
  if Assigned(ExcelApp) then
  begin
    ExcelApp.Visible[0] := false;
  end;
end;

procedure TReportExcel.OpenWithTemplate(
  const TemplateName: String);
begin
//  FullFileName := ExtractFilePath(ParamStr(0)) + 'Книга1.xlt';
   if Assigned(ExcelApp) and (not Assigned(Workbook) ) then
    try
      try
        FWorkbook := ExcelApp.Workbooks.Add(TemplateName, 0);
        try
          FSheet := Workbook.Worksheets.Item['Лист1'] as _Worksheet;
        except
          FSheet := Workbook.Worksheets.Item['Sheet1'] as _Worksheet;
        end;
      finally
//        Application.BringToFront;
      end;
    except on E:Exception do 
     begin
      FSheet := nil;
      raise Exception.Create('Не могу создать книгу!' + E.Message);
     end; 
    end;
end;

procedure TReportExcel.ReleaseExcel;
begin
  // Tricks:
  //        Верни пользователю его Excel!!!
  //        Считаем, что если остается хотя бы одна открытая книга, значит пользователь ее хотел
  //        бы потом увидеть. А то ж можно сделать Excel-у Hide и Release. И что?
  //        Если там осталась книга, которая правилась - процесс останется, но в списке приложений
  //        его не увидишь - только в списке процессов.
  //        Так решим эту проблему следующим образом:
  if Assigned(ExcelApp) then begin
    // если есть книга и мы невидимы
    if (ExcelApp.Workbooks.Count > 0) and (not ExcelApp.Visible[0]) then begin
      // положим аккуратненько (правильно написал это слово?) его вниз,
      ExcelApp.WindowState[0] := TOLEEnum(xlMinimized);
      // а потом покажем,
      ExcelApp.Visible[0] := true;
      // ну, и после вернем фокус форме и приложению, а то после Visible - у эксела SetFocus
      // происходит.
      // Собственно говоря, набор свойств Visible, ScreenUpdating, Activate (еще остановимся) и
      // WindowState меня периодически пугает своей неоднозначностью.
      // Дельфийная альтернатива Visible, SetFocus, WindowState работает четко.
//      if not(csDestroying in ComponentState) then Self.SetFocus; // а это объяснять необходимо?
      // Объясню вопросом. Какой SetFocus, если приложение (форма) закрывается?
//      Application.BringToFront;
    end;
  end;
  // Tricks:
  // Главное мое правило: поюзал интерфейс - сам его и освободи.
  // Эта привычка выработана давно. Освобождаю даже локально объявленные переменные-интерфейсы.
  // То есть блок finally всегда присутствует с такими присваиваниями.
  FreeAndNil(FExcelApp);
//  FExcelApp := nil;
end;

procedure TReportExcel.ShowExcel;
begin
  if Assigned(ExcelApp) then begin
    ExcelApp.Visible[0] := true;
    if ExcelApp.WindowState[0] = TOLEEnum(xlMinimized) then
      ExcelApp.WindowState[0] := TOLEEnum(xlNormal);
    ExcelApp.ScreenUpdating[0] := true;
    ExcelApp.DisplayAlerts[0] := true;
  end;
end;

procedure TReportExcel.ShowReport;
begin

end;

procedure TReportExcel.Value_to_Named_Cell(Sheet:_Worksheet; NameCell: string;
  Value: OLEVariant);
begin
  Sheet.Cells.Item[WorkBook.Names.Item(NameCell, EmptyParam, EmptyParam).RefersToRange.Row
       , WorkBook.Names.Item(NameCell, EmptyParam, EmptyParam).RefersToRange.Column]
         := Value;
end;

procedure TReportExcel.CloseWorkBook(DisplayAlerts: boolean);
begin
 if Workbook<>nil then
  Workbook.Close(DisplayAlerts, emptyparam, emptyparam, 0);
  FSheet:=nil;
  FWorkbook:=nil;
end;

constructor TReportExcel.Create(ParamRequest: TParamRequest;
  AOwner: TComponent);
begin
 FParamRequest:=ParamRequest;
 Create;
end;

procedure TReportExcel.JoinCells(IRange: Range; Params: array of integer);
begin
 IRange.Merge(False);
end;

//говорит "да", если удалось положить список aList с указанных
//координат aStartRow, aStartCol без эксцессов
function TReportExcel.PutListToReport(aList:TStringList; aStartRow,
  aStartCol: integer): boolean;
Var
 i:integer;  
begin
 try
  for i:= 0 to aList.Count-1 do
    Sheet.Cells.Item[aStartRow+i, aStartCol].Value:=aList[i];
  result:=True;
 except
   result:=false;
 end;
end;

//возвращяет координаты поименованной ячейки или ошибку, если такой нет.
//Смещения - если надо сразу поправить значение возвращаемой кординаты.
function TReportExcel.getPosNamedCell(NameCell:String; shiftX, shiftY: integer): TPoint;
begin
 try
  result.X:=Workbook.Names.Item(NameCell, EmptyParam, EmptyParam).RefersToRange.Column + shiftX;
  result.Y:=Workbook.Names.Item(NameCell, EmptyParam, EmptyParam).RefersToRange.Row + shiftY;
 except
  on Exception do
    raise Exception.Create('Невозможно определить положение поименованной ячейки (' +
     NameCell+ ')');
 end;
end;

end.

