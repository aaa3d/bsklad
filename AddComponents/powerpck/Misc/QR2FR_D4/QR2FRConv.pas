{*******************************************************}
{                                                       }
{       QuickReport To FastReport Convertor             }
{       QR2FRConv                                                }
{       Copyright (c) 2001 Albert Gubaidullin           }
{       albert@lemm.ru                                  }
{*******************************************************}

unit QR2FRConv;

{$I FR.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRCtrls, QRPrntr, Printers, FR_Class, FR_BDEQuery, DB, DBTables,
  FR_BDETable
{$IFNDEF Delphi6}
, DsgnIntf
{$ELSE}
, DesignIntf, DesignEditors
{$ENDIF};

type

  TQR2FRConv = class(TComponent)
  private
    { Private declarations }
    FSource: TQuickRep;
    FTarget: TfrReport;
    FDataSetPage: TfrPage;
    FReportPage: TfrPage;
    sl: TStringList;
    BandList: TStringList;
    procedure SetSource(Value: TQuickRep);
  protected
    { Protected declarations }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetAlignment(comp: TComponent; v: TfrView);
    procedure SetBandAlignment(Control: TControl; v: TfrView);
    function AddAndGetName(DataSet: TDataSet): String;
    function AddAndGetBandName(Band: TQRBand): String;

  public
    { Public declarations }
    property DataSetPage: TfrPage read FDataSetPage;
    property ReportPage: TfrPage read FReportPage;
    procedure Convert;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Source: TQuickRep read FSource write SetSource;
    property Target: TfrReport read FTarget write FTarget;
  end;

  TQR2FRConvEditor = class( TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('LeMM', [TQR2FRConv]);
  RegisterComponentEditor(TQR2FRConv, TQR2FRConvEditor);
end;

constructor TQR2FRConv.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  sl := TSTringList.Create;
  BandList := TStringList.Create;
  if Assigned(AOwner) and (AOwner is TQuickRep) then
    FSource := AOwner as TQuickRep
  else
    ShowMessage(AOwner.Name+':'+AOwner.ClassName);  
end;

destructor TQR2FRConv.Destroy;
begin
  BandList.Free;
  sl.Free;
  inherited Destroy;
end;

procedure TQR2FRConv.SetSource(Value: TQuickRep);
begin
  FSource := Value;
end;

procedure TQR2FRConv.Notification(AComponent: TComponent; Operation: TOperation);
begin
  if Operation = opRemove then
  begin
    if AComponent = FSource then
      FSource := nil;
    if AComponent = FTarget then
      FTarget := nil;
  end;
  inherited Notification(AComponent, Operation);
end;

procedure TQR2FRConv.Convert;
var b: TfrBandView; v: TfrView; qrb: TQRBand; Control: TControl;
   i, j: Integer; //MasterBand: TfrBandView;
begin
  // Определяем источники данных для нашего
  if FSource = nil then
    raise Exception.Create('Unknown source (TQuickRep)');
  if FTarget = nil then
    raise Exception.Create('Unknown source (TfrReport)');
  sl.Clear;
  {- Создаем страницы -}
  Target.Pages.Clear;
  Target.Pages.Add;
  Target.Pages.Add;
  FDataSetPage := Target.Pages[0]; // Датасеты
  DataSetPage.PageType := ptDialog;
  FReportPage := Target.Pages[1];  // Собственно отчет
  ReportPage.pgOr := poLandscape;
  ReportPage.pgSize := DMPAPER_A4; // A4 Windows.DMPAPER_A4 = 9
  ReportPage.pgMargins := Rect(36, 36, 36, 36);
    // Здесь лучше бы конечно использовать константы из FastReport, но они не определены
  {- Импорт бандов и контролов -}
  for i:=0 to FSource.BandList.Count-1 do
  begin
    qrb := TQRBand(FSource.BandList[i]);
    b := TfrBandView(frCreateObject(gtBand, ''));
    b.SetBounds(qrb.Left, qrb.Top{-Trunc(Source.Page.TopMargin)+ReportPage.pgMargins.Top}, qrb.Width, qrb.Height);
    b.Name := qrb.Name;
    {- Конвертируем банд -}
    case qrb.BandType of
      rbTitle:        b.BandType := btReportTitle;
      rbPageHeader:   b.BandType := btPageHeader;
      rbDetail:       b.BandType := btMasterData;
      rbPageFooter:   b.BandType := btPageFooter;
      rbSummary:      b.BandType := btReportSummary;
      rbGroupHeader:  b.BandType := btGroupHeader;
      rbGroupFooter:  b.BandType := btGroupFooter;
      rbSubDetail:    b.BandType := btDetailData;
      rbColumnHeader: b.BandType := btMasterHeader;
      rbOverlay:      b.BandType := btOverlay;
      rbChild:        b.BandType := btChild;
      else
        b.BandType := btNone;
    end;
    {- Делаем ссылку на Child-банд -}
    if b.BandType <> btPageFooter then
      if Assigned(qrb.ChildBand) then
        b.ChildBand := qrb.ChildBand.Name;
(*    {- Пытаемся привязать датасет к мастер-банду -}
    if b.BandType = btMasterData then MasterBand := b;*)
    {- Отрисовка линий фрейма -}
    if qrb.Frame.DrawTop then
    begin

    end;
    {- Встявляем банд в страницу с отчетом -}
    ReportPage.Objects.Add(b);
    {- Вставка контролов в банд -}
    for j:=0 to qrb.ControlCount-1 do
    begin
      Control := qrb.Controls[j];
     {TQRCustomLabelLabel
        TQRDBText (WordWrap)
        TQRExpr   (WordWrap)
        TQRLabel  (WordWrap)
        TQRMemo   (WordWrap)
        TQRSysData
      TQRPrintable
        TQRImage
        TQRDBImage
      }
      if Control is TQRCustomLabel then
      begin
        v := frCreateObject(gtMemo, '');
        v.Name := Control.Name;
        v.SetBounds(Control.Left + ReportPage.LeftMargin, Control.Top + qrb.Top, Control.Width, Control.Height);
        SetAlignment(Control, v);
        SetBandAlignment(Control, v);
        (v as TfrMemoView).Font := (Control as TQRCustomLabel).Font;
        v.FillColor := (Control as TQRCustomLabel).Color;
        v.Visible := (Control as TQRCustomLabel).Visible;
        if Control is TQRDBText then
        begin
          v.Memo.Add('[DialogForm.'+AddAndGetName((Control as TQRDBText).DataSet)+'."'+(Control as TQRDBText).DataField+'"]');
          if (Control as TQRDBText).WordWrap then
            v.Flags := v.Flags or flWordWrap
          else
            v.Flags := v.Flags and (not flWordWrap);
        end
        else
        if Control is TQRLabel then
        begin
          v.Memo.Add((Control as TQRLabel).Caption);
          if (Control as TQRLabel).WordWrap then
            v.Flags := v.Flags or flWordWrap
          else
            v.Flags := v.Flags and (not flWordWrap);
        end
        else
        if Control is TQRMemo then
        begin
          v.Memo.AddStrings((Control as TQRMemo).Lines);
          if (Control as TQRMemo).WordWrap then
            v.Flags := v.Flags or flWordWrap
          else
            v.Flags := v.Flags and (not flWordWrap);
        end
        else
        if Control is TQRExpr then
        begin
          v.Memo.Add((Control as TQRExpr).Expression);
          if (Control as TQRExpr).WordWrap then
            v.Flags := v.Flags or flWordWrap
          else
            v.Flags := v.Flags and (not flWordWrap);
        end;
        ReportPage.Objects.Add(v);
      end;
    end;
  end;
  {- Показ отчета пользователю -}
  sl.Clear;
  Target.Dictionary.BandDatasources.Insert(0, 'DialogForm._Q_Spec2');
  Target.PrepareReport;
  Target.DesignReport;
end;

var AlignConv: array [taLeftJustify .. taCenter] of Integer = (frtaLeft, frtaRight, frtaCenter);

procedure TQR2FRConv.SetAlignment(comp: TComponent; v: TfrView);
begin
  if (Comp is TQRCustomLabel) then
    if (v is TfrMemoView) then
      (v as TfrMemoView).Alignment := AlignConv[(Comp as TQRCustomLabel).Alignment];
end;

procedure TQR2FRConv.SetBandAlignment(Control: TControl; v: TfrView);
var Alignment: TAlignment; AlignToBand: Boolean;
begin
{ baNone = 0;   //Выводить объект без выравнивания по бэнду.
  baLeft = 1;   //Прижать объект к левому краю бэнда.
  baRight = 2;  //Прижать объект к правому краю бэнда.
  baCenter = 3; //Центрировать объект внутри бэнда по горизонтали.
  baWidth = 4;  //Растянуть объект по ширине бэнда.
  baBottom = 5; //Прижать объект к нижнему краю бэнда.}
  if Control is TQRCustomLabel then
  begin
    AlignToBand := False;
    Alignment := (Control as TQRCustomLabel).Alignment;
    if (Control is TQRDBText) then
      AlignToBand := (Control as TQRDBText).AlignToBand
    else if (Control is TQRExpr) then
      AlignToBand := (Control as TQRExpr).AlignToBand
    else if (Control is TQRLabel) then
      AlignToBand := (Control as TQRLabel).AlignToBand
    else if (Control is TQRMemo) then
      AlignToBand := (Control as TQRMemo).AlignToBand
    else if (Control is TQRSysData) then
      AlignToBand := (Control as TQRSysData).AlignToBand;
    if AlignToBand then
      case Alignment of
        taLeftJustify:  v.BandAlign := baLeft;
        taRightJustify: v.BandAlign := baRight;
        taCenter:       v.BandAlign := baCenter;
      end;
  end;
end;

function TQR2FRConv.AddAndGetName(DataSet: TDataSet): String;
var frBDEQuery: TfrBDEQuery; frBDETable: TfrBDETable; Index: Integer;
begin
  {- Импорт датасетов -}
  Index := sl.IndexOfObject(DataSet);
  if Index = -1 then
  begin
    Index := sl.AddObject(DataSet.Name, DataSet);
    if DataSet is TQuery then
    begin
      frBDEQuery := TfrBDEQuery.Create;
      frBDEQuery.Query.Name := (DataSet as TQuery).Name;
      frBDEQuery.Name := (DataSet as TQuery).Name;
      frBDEQuery.Query.SQL.Assign((DataSet as TQuery).SQL);
      frBDEQuery.Query.DatabaseName := (DataSet as TQuery).DatabaseName;
      DatasetPage.Objects.Add(frBDEQuery);
//      Target.Dictionary.BandDatasources.Insert(0, 'DialogForm._'+frBDEQuery.Name);
    end
    else if DataSet is TTable then
    begin
      frBDETable := TfrBDETable.Create;
      frBDETable.Table.Name := (DataSet as TTable).Name;
      frBDETable.Name := (DataSet as TTable).Name;
      frBDETable.Table.TableName := (DataSet as TTable).TableName;
      frBDETable.Table.DatabaseName := (DataSet as TTable).DatabaseName;
      DataSetPage.Objects.Add(frBDETable);
    end;
  end;
  Result := TDataSet(SL.Objects[Index]).Name;
end;

function TQR2FRConv.AddAndGetBandName(Band: TQRBand): String;
var Index: Integer;
begin
  Index := BandList.IndexOfObject(Band);
  if Index = -1 then
    Index := BandList.AddObject(Band.Name, Band);
  Result := TDataSet(SL.Objects[Index]).Name;
end;


procedure TQR2FRConvEditor.ExecuteVerb(Index: Integer);
begin
  (Component as TQR2FRConv).Convert;
end;

function TQR2FRConvEditor.GetVerb(Index: Integer): string;
begin
  Result := 'Unknown method';
  case Index of
    0: Result := 'Convert and Preview';
  end;
end;

function TQR2FRConvEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;



end.
