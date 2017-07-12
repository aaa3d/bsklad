{
* ������� ������ "����� �� �������� ������� �� ������" � MS Excel
* ��� ������� BSklad. ������������ � ������: ReportOstNew
* ��������� � ������������ � ����������
* .."\BSklad\DOC\Denis Potapov\������� � Excel ������ �� �������� �������\"
* Denis Potapov 2004 (c)
}
unit ReportRemainingGoods;

interface
uses Parent_Excel_Report, Gauges, IBQuery, Windows, Request_Response;

Const
 CN_MainSheetName = '����1'; //�������� ���� ����������� ����� � ������ �������
 CN_TemplateFolder = 'Excel_�������'; //����� �������
 CN_TemplateName = '����� �� �������� �������.xlt'; //�������� ����� ������� ������
 //�������� ����� ������� �������� �������� ������
 CN_TemplateNameWideReport = '����� �� �������� ������� �������.xlt';
 CN_TemplateNameLayoutByDepots =
   '����� �� �������� ������� � ��������� �� �������.xlt'; //����� � ��������� �� �������

Type
 //"����� �� �������� ������� �� ������"
 TReportRemainingGoods = class(TReportExcel)
   countRow, endReportRow, NumCol, StartTableRow:integer;
   EndReportCell, SummCell : TPoint;
   ReportName:String; //��������� ������
   ProgressBarObject:TGauge; //��������� ��������� ������
   QMain: TIBQuery; //�������� ����� � �������
   QDepotNames: TIBQuery; //����� �� ��������� ���� �������
   isAuditReportRequired : Boolean; //����� �� ����� ��� ������� ��� ���
   isLayoutByDepots : Boolean; //��� ����� �� ���� ������� ��� ���
   constructor Create; override;//�����������
   destructor  Destroy; override; //����������
   //��������� ������ ����� (������ ����)
   procedure OpenReport;
   procedure TunePositions;
  private
    procedure MakeAuditReport;
    procedure MoveData(Const curRow, numCol :integer);
    procedure MoveData_LayoutByDepots(Const curRow, numCol :integer);
  public
   procedure CreateReport();
 end;

 //"����� �� �������� ������� �� ������" - �������� � �������� ����
 //����� ����� ��� ������� ���������� �� �������� ������� �� ���� �����
 TTXTReportRemainingGoods = class
//   FParamRequest: TParamRequest;
   constructor Create; virtual; //�����������
   destructor  Destroy; //����������
   //������� ����� � ������������ � �������� ���������� ������
   procedure CreateReport(ParamRequest: TParamRequest);
 end;

implementation
uses sysutils, excel2000, B_DButils, Dialogs;
{ TReportRemainingGoods }

constructor TReportRemainingGoods.Create;
begin
  inherited;
  ReportName := FParamRequest.LocateVar('ReportName'); //��������� ������
  ProgressBarObject := TGauge(FParamRequest.LocateObj('ProgressBarObject'));//��������� ��������� ������
  QMain := TIBQuery(FParamRequest.LocateObj('QMain')); //�������� ����� � �������
  isAuditReportRequired := FParamRequest.LocateVar('isAuditReportRequired'); //����� �� ����� ��� ������� ��� ���
  isLayoutByDepots := FParamRequest.LocateVar('isLayoutByDepots'); //��� ����� � ��������� �� ������� ��� ���
  if (isLayoutByDepots) then //� ���� ������ ���� ��������� �������������� ������
   QDepotNames := TIBQuery(FParamRequest.LocateObj('QDepotNames')); //����� �� ��������� ���� �������
end;

//��������� ��� �����
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
 OpenReport; //��������� ������ ���� ������� Excel
 //���� ���� �����, �� ����� ���� ����������� � ��������� ������ ����� ��� �������
 TunePositions; //��������� ������� ������ � ��������� ������ � ������� �������, ���������� ��������
 //��������� ����� ������
 Value_to_Named_Cell(Sheet, 'ReportName', ReportName);
 //���������
 Value_to_Named_Cell(Sheet, 'OwnerCell', '������������: ' + USERFIO_SHORT);
 //���� ��� ����� � ��������� �� �������, �� ���� ������� �������� ������� �� ���������������� �������
 numColumns:=9;
 if ((isLayoutByDepots) and (QDepotNames <> nil)) then //��� ����� � ��������� �� �������
  begin
   if not (QDepotNames.Active) then QDepotNames.Open;
   QDepotNames.First;
   countRow :=1;
   numColumns:=17;
   While (not (QDepotNames.EOF) and (countRow<=10)) do
    begin //�������� �������� ������ 10 ������� (������ �� ��� ���� ������� ����������)
     Sheet.Cells.Item[startTableRow-1, EndReportCell.X-10+countRow].Value :=
      QDepotNames.FieldByName('SKL_SHORT').asString;
     Inc(countRow);
     QDepotNames.Next();
    end;
  end;
 //��������� �����
 curRow:=StartTableRow;
 countRow := 1;
 iRow:=0;
 curGroupName := '';
 numRecords:=0;
 if not (QMain.Active) then QMain.Open;
 QMain.First;
 //���������� ����� ���������� ���������
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
    //����� �������� ������. ��� ����� ���������� ������ ��� ����� ��������

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
    //��������� 1 ���������� ������� � ������� ������. �������-����� ��� ���� ������� ������
    //����� ������ �� �������







    v[iRow, 0] := IntToStr(countRow);
    v[iRow, 1] := QMain.FieldByName('TW_ART').asString; //��� ������
    v[iRow, 2] := QMain.FieldByName('TW_NAM').asString; //������������ ������
    v[iRow, 3] := QMain.FieldByName('ED_SHORT').asString; //��. ���. ������
    v[iRow, 4] := QMain.FieldByName('TW_MROZ').asCurrency; //����. ���� ������
    if (isLayoutByDepots) then //��� ����� � ��������� �� �������
    begin
      v[iRow, 5] := QMain.FieldByName('OST_ALL').asFloat; //������� ������
      v[iRow, 6] := QMain.FieldByName('OST1').asFloat; //������� ������
      v[iRow, 7] := QMain.FieldByName('OST2').asFloat; //������� ������
      v[iRow, 8] := QMain.FieldByName('OST3').asFloat; //������� ������
      v[iRow, 9] := QMain.FieldByName('OST4').asFloat; //������� ������
      v[iRow, 10] := QMain.FieldByName('OST5').asFloat; //������� ������
      v[iRow, 11] := QMain.FieldByName('OST6').asFloat; //������� ������
      v[iRow, 12] := QMain.FieldByName('OST7').asFloat; //������� ������
      v[iRow, 13] := QMain.FieldByName('OST8').asFloat; //������� ������
      v[iRow, 14] := QMain.FieldByName('OST9').asFloat; //������� ������
      v[iRow, 15] := QMain.FieldByName('OST10').asFloat; //������� ������


//             MoveData_LayoutByDepots(curRow, numCol)
    end
    else //������� �����
    begin
      v[iRow, 5] := QMain.FieldByName('TW_OST').asFloat; //������� ������
      v[iRow, 6] := QMain.FieldByName('TW_KWM').asFloat; //������� ������
      v[iRow, 7] := QMain.FieldByName('TW_WEIGHT').asFloat; //������� ������
      v[iRow, 8] := QMain.FieldByName('TW_SUMM').asCurrency; //�� ����� � ����.
    end;





 {


    Sheet.Cells.Item[curRow, NumCol].Value := IntToStr(countRow);
    Sheet.Cells.Item[curRow, NumCol+1].Value :=
     QMain.FieldByName('TW_ART').asString; //��� ������
    Sheet.Cells.Item[curRow, NumCol+2].Value :=
     QMain.FieldByName('TW_NAM').asString; //������������ ������
    Sheet.Cells.Item[curRow, NumCol+3].Value :=
     QMain.FieldByName('ED_SHORT').asString; //��. ���. ������
    Sheet.Cells.Item[curRow, NumCol+4].Value :=
     QMain.FieldByName('TW_MROZ').asCurrency; //����. ���� ������
    //������ ��������� ������
    //���� ��� ����� � ��������� �� �������, �� ���� ���������, �����-������
    if (isLayoutByDepots) then //��� ����� � ��������� �� �������
     MoveData_LayoutByDepots(curRow, numCol)
    else //������� ����� �� ��������
     MoveData(curRow, numCol);
}
    //������ ����� �����
//    DrawFrame(SelectRange(curRow, NumCol, curRow, EndReportCell.X), [cnBottomBorder]);
    Inc(curRow);
    Inc(countRow);
    inc(iRow);
    QMain.Next;
  end;

  r := Sheet.Range[Sheet.Cells.Item[4, 1],  Sheet.Cells.Item[4+numRecords ,numColumns ]];
  r.Value := v;
  //����������� ����� ������, � ����� ������ ������ ���������
  _rng := SelectRange(StartTableRow, NumCol, curRow-1, EndReportCell.X);
  DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
  //������ �����
  Inc(curRow);
  if (isLayoutByDepots) then //��� ����� � ��������� �� �������
    //������: ����� ������� �� ������������ �������
   Sheet.Cells.Item[curRow, NumCol].Value := '����� ' +
     IntToStr(countRow-1) + ' ������������ �������.'
  else
   begin
    Sheet.Cells.Item[curRow, NumCol].Value := '����� ' +
      IntToStr(countRow-1) + ' ������������ ������� �� ����� � ��������� ����� :';
    Sheet.Cells.Item[curRow, NumCol + 7].Formula :=
       '=SUM(' + Chr(Ord('A')+SummCell.X-1) + IntToStr(SummCell.Y) + ':' +
          Chr(Ord('A')+SummCell.X-1) + IntToStr(curRow - 1) + ')';
   end;
  _rng := SelectRange(curRow, NumCol, curRow, EndReportCell.X);
  _rng.Font.Bold := True;
  //���������� ��������� ����������� ������ ������ ��� ���������� ������ ��� �������
  endReportRow := curRow;
  //���� ��������� ����������� ����� ��� ������� � ��� �� ����� �� ���� �������, �� ��� �������� �����
  if ((isAuditReportRequired) and not (isLayoutByDepots)) then
   MakeAuditReport() //�� ������ �������� ����� ������������ ����� ��� �������
  else //����� - ������� ���� ����!
   if not isLayoutByDepots then
   begin
    try
      ExcelApp.DisplayAlerts[0] := False;
     _tt:=Workbook.Worksheets.Item['��� �������'] as _Worksheet;
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
 if (isLayoutByDepots) then //��� ����� � ��������� �� �������
  s:= s + CN_TemplateNameLayoutByDepots
 else
 if not (FParamRequest.LocateVar('isWideReport')) then s:= s + CN_TemplateName
 else s:= s + CN_TemplateNameWideReport; //������ ����� �������. ������ �������- ������� �����
 OpenWithTemplate(s);
 ExcelApp.Interactive[0] := false;
 ExcelApp.ScreenUpdating[0] := false;
end;

procedure TReportRemainingGoods.TunePositions;
begin
  StartTableRow:=1 + Workbook.Names.Item('StartTable', EmptyParam, EmptyParam).RefersToRange.Row;
  NumCol:=Workbook.Names.Item('NumCell', EmptyParam, EmptyParam).RefersToRange.Column;
  SummCell:=getPosNamedCell('SummCell', 0, 1); //�����. ������ + 1 ������ ����
  EndReportCell := getPosNamedCell('EndReportCell', 0, 0); //������ �������� ������ ������
end;

//�� ������ �������� ����� ��������� ����� ��� �������
//����������� ����������� ��������� � ������ �������� � ������������� �����
procedure TReportRemainingGoods.MakeAuditReport();
Var
 AuditSheet : _WorkSheet; //�������� ������ ��� �������
 _rng :Range;
 EndAuditReportCol : integer;
begin
 try
 //���������� ������ �� ������ ���� �����
 AuditSheet := Workbook.Worksheets.Item['��� �������'] as _Worksheet;
 //�������� �������� ����� ������ �� ������ ����� �����
 _rng := SelectRange(1, NumCol, EndReportRow, NumCol+3); //����� ����� ������ ������ ������ ���������� �������
 //����������� ��� �� ������ ����
 //���������� �������� (���� ��������) - �� ������ ��������!
 _rng.Copy(SelectRange(1, NumCol, EndReportRow, NumCol+3, AuditSheet));
 //����������� ����� � ���������
 EndAuditReportCol := Workbook.Names.Item('EndAuditReportCell', EmptyParam, EmptyParam).RefersToRange.Column;
 _rng := SelectRange(StartTableRow, NumCol, EndReportRow-2, EndAuditReportCol, AuditSheet);
 DrawFrame(_rng, [cnTopBorder, cnBottomBorder, cnInsideHorizontalBorder]);
 //����� ������� �� ������������ �������
 AuditSheet.Cells.Item[EndReportRow, NumCol].Value := '����� ' +
    IntToStr(countRow-1) + ' ������������ �������.';
 //����������� ���� ������ ������� - ��� ������ ����� ������
 except
  //������� ������ ���� �� ������
 end;
end;

//��������� ���� ���� ������ ��� ������ � ��������� �� �������
//� ��������� ������, ������� (�������� �������������) � ���������� �������
procedure TReportRemainingGoods.MoveData_LayoutByDepots(Const curRow, numCol :integer);
Var
 i:integer;
begin
  //��������� ������� �����, ������� �� 10 ������� � ������ ���� �����
  //�� ����� ���, ��� ������� ������ ���� ��� �� �������, ���� ������
  Sheet.Cells.Item[curRow, NumCol+5].Value :=
   QMain.FieldByName('OST_ALL').asFloat; //������� �����
  //� ����� ���������� ������� �� 10 �������
  for i:= 1 to 10 do
   begin
    Sheet.Cells.Item[curRow, NumCol+5+i].Value :=
     QMain.FieldByName('OST'+IntToStr(i)).asFloat; //������� �� ������ ����� i
     //������ ���� ����� �� ����� ���, ��� ������� ������ ���� ��� �� �������, ���� ������
     if (QMain.FieldByName('OST'+IntToStr(i)).asFloat<>0) then
      if (QMain.FieldByName('OST'+IntToStr(i)).asFloat<0)
         then Sheet.Cells.Item[curRow, NumCol+5+i].Interior.Color:=$005151FF //�������
      else Sheet.Cells.Item[curRow, NumCol+5+i].Interior.Color:=$00FFB9B9 //�����;
   end;
end;

//��������� ���� ���� ������ ��� �������� ������ �� ��������
//� ��������� ������, ������� (�������� �������������) � ���������� �������
procedure TReportRemainingGoods.MoveData(Const curRow, numCol :integer);
begin
  Sheet.Cells.Item[curRow, NumCol+5].Value :=
   QMain.FieldByName('TW_OST').asFloat; //������� ������
  Sheet.Cells.Item[curRow, NumCol+6].Value :=
   QMain.FieldByName('TW_SUMM').asCurrency; //�� ����� � ����.
end;

{ TTXTReportRemainingGoods }

constructor TTXTReportRemainingGoods.Create;
begin
 inherited;
end;

//������� ����� � ������������ � �������� ���������� ������
procedure TTXTReportRemainingGoods.CreateReport(
  ParamRequest: TParamRequest);
Var
 ReportFile : TextFile;
 s, curGroupName, FileName : String;
 QMain: TIBQuery;
begin
 //������� ��������� ����, ��� �������
 try
  FileName := ParamRequest.LocateVar('FileName');
  QMain := TIBQuery(ParamRequest.LocateObj('QMain')); //�������� ����� � �������
  if (FileName = '') or (QMain = nil) then
    raise Exception.Create('�� ������� ��� �����');
  AssignFile(ReportFile, FileName);
  Rewrite(ReportFile);
  //��������� ������ ������
  curGroupName := '';
  if not (QMain.Active) then QMain.Open;
  QMain.First;
  while not QMain.EOF do
   begin
    //����� �������� ������. ��� ����� ���������� ������ ��� ����� �������� � ��������� ������� ����
    if (QMain.FieldByName('TWTREE_FULL').asString <> curGroupName) then
     begin
      curGroupName := QMain.FieldByName('TWTREE_FULL').asString;
      //��� ������(�������, ����� ��� ��� ������)      ��� ������
      //������������ ������	��.	����. ����	�������
      //1- ��� �������� ������, 0- �������� ������
      s:='1;' + QMain.FieldByName('TWTREE_ID').asString + ';' +
         QMain.FieldByName('TWTREE_FULL').asString + ';' +
          ';' + ';';
      //����� ��� � ����
      Writeln(ReportFile, s);
     end;
    //��� ������(�������� ������ ��� ��� ������)      ��� ������
    //������������ ������	��.	����. ����	�������
    //1- ��� �������� ������, 0- �������� ������
    s:='0;' + QMain.FieldByName('TW_ART').asString + ';' +
      QMain.FieldByName('TW_NAM').asString + ';' +
       QMain.FieldByName('ED_SHORT').asString + ';' +
        QMain.FieldByName('TW_MROZ').asString + ';' +
         QMain.FieldByName('TW_OST').asString;
    //����� ��� � ����
    Writeln(ReportFile, s);
    QMain.Next;
   end;
   //������� �� ������
   //��������� ����
   CloseFile(ReportFile);
   ShowMessage('��������� ���� ������ ������� �����������. ���� � �����: ' +
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
    ShowMessage('������ ��� ������������ ���������� ����� ������ "�� ' +
      '�������� ������". (' + e.Message + ')');
   end;
 end;
end;

destructor TTXTReportRemainingGoods.Destroy;
begin
 inherited;
end;

end.
