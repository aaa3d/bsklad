{
* ������� ������ ���������� ���� � MS Excel
* ��� ������� BSklad. ������������ � ������: JouCard
* ��������� � ������������ � ����������
* .."\BSklad\DOC\Denis Potapov\Denis Potapov\��������� �� ���������� ������ (������� ����� ���)"
* Denis Potapov 2004 (c)
}
unit ReportCardsToExcel;

interface
uses Parent_Excel_Report, Gauges, IBQuery, Windows, Request_Response;

Const
 CN_TemplateFolder = 'Excel_�������'; //����� �������
 CN_TemplateName = '����� ������ ���������� ����.xlt'; //�������� ����� ������� ������

Type
 //"������� ������ ���������� ���� � MS Excel "
 TReportCardsListToExcel = class(TReportExcel)
   countRow, endReportRow, NumCol, StartTableCol, StartTableRow:integer;
   ReportName:String; //��������� ������
   ProgressBarObject:TGauge; //��������� ��������� ������
   QMain: TIBQuery; //�������� ����� � �������
   ApplyFilterText:String; //����������� ������ � ������ ���� �������
   constructor Create; override;//�����������
   destructor  Destroy; override; //����������
   //��������� ������ ����� (������ ����)
   procedure OpenReport;
   procedure TunePositions;
  private
//    procedure MoveData(Const curRow, numCol :integer);
    //������� ��������� ��������� ���� �� ����������-������� IBQuery � Excel �� N
    //���� ����� ����� ������. ���������� ����� ������� ����������� �������.
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
  ReportName := FParamRequest.LocateVar('ReportName'); //��������� ������
  ApplyFilterText := FParamRequest.LocateVar('ApplyFilterText'); //����������� ������ � ������ ���� �������
  ProgressBarObject := TGauge(FParamRequest.LocateObj('ProgressBarObject'));//��������� ��������� ������
  QMain := TIBQuery(FParamRequest.LocateObj('QMain')); //�������� ����� � �������
end;

//��������� ��� �����
procedure TReportCardsListToExcel.CreateReport;
Var
 CurRow : integer;
 curGroupName :String;
 _rng : Range;
 _tt:_Worksheet;
begin
try
 CreateExcel(true);
 OpenReport; //��������� ������ ���� ������� Excel
 //���� ���� �����, �� ����� ���� ����������� � ��������� ������ ����� ��� �������
 TunePositions; //��������� ������� ������ � ��������� ������ � ������� �������, ���������� ��������
 //��������� ����� ������
 Value_to_Named_Cell(Sheet, 'ReportName', ReportName);
 //���������
 Value_to_Named_Cell(Sheet, 'OwnerCell', '������������: ' + USERFIO_SHORT);
 //������ ������� ��� ������ ���� �������
 Value_to_Named_Cell(Sheet, 'ApplyFilterText', '������: ' + ApplyFilterText);
 //��������� �����
 curRow:=StartTableRow;
 countRow := 1;
 if not (QMain.Active) then QMain.Open;
 QMain.First;
 //��������� ��� ������ �� ������� � ������                
 InsertTableToExcel(curRow, NumCol, QMain, [1,2,3,4,5,7,9,15,16,17,18, 19,20,21,22,23,24,25,26,27,28]);
{
  //����������� ����� ������, � ����� ������ ������ ���������
  _rng := SelectRange(StartTableRow, NumCol, curRow-1, EndReportCell.X);
  DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
  //������ �����
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
 AQuery.Last; //�������� ���-�� �������
 AQuery.RecordCount;
 v := VarArrayCreate([0, AQuery.RecordCount-1, 0, Length(SetFields)-1], varVariant);
 iRow := 0;
 AQuery.First;
 while not AQuery.Eof do
  begin
    for iCol:=0 to Length(SetFields)-1 do //���� �� ������� �������-��������� ���� ������ ������
      v[iRow, iCol] := AQuery.Fields[SetFields[iCol]].AsVariant;
    inc(iRow);
    AQuery.Next;
   end;
 _rng := SelectRange(StartRow, StartCol,
         StartRow+AQuery.RecordCount-1,StartCol + Length(SetFields)-1);
 _rng.Value := v;
 DrawFrame(_rng, [cnAllBorder]);

 { ������������� ������� - ��������� �� ������ ������
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
    for iCol:=0 to Length(SetFields)-1 do //���� �� ������� �������-��������� ���� ������ ������
      v[iRow, iCol] := Fields[SetFields[iCol]].AsVariant;

      if (iRow = CountRows -1) then //���� �������� ������ ������ � Excel
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
 //��������� ��������� ���� ������
 if (_cntLastParts<>0) then
  begin
    //������������ ������ ������� � �������
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
  CN_TemplateName; //�������� ������� ������
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
