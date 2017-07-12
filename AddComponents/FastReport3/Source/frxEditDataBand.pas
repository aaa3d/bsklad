{******************************************}
{ }
{ FastReport v3.0 }
{ Data Band editor }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditDataBand;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, frxClass
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxDataBandEditorForm = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    Image1:TImage;
    DatasetsLB:TListBox;
    procedure DatasetsLBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure DatasetsLBDblClick(Sender:TObject);
    procedure FormHide(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormCreate(Sender:TObject);
  private
    { Private declarations }
    FDataBand:TfrxDataBand;
    FDesigner:TfrxCustomDesigner;
  public
    { Public declarations }
    property DataBand:TfrxDataBand read FDataBand write FDataBand;
  end;

implementation

{$R *.DFM}

uses frxUtils, frxRes;

procedure TfrxDataBandEditorForm.FormShow(Sender:TObject);
var
  i:Integer;
  dsList:TStringList;
begin
  FDesigner:= TfrxCustomDesigner(Owner);

  dsList:= TStringList.Create;
  FDesigner.Report.GetDatasetList(dsList);
  dsList.Sort;
  DatasetsLB.Items:= dsList;
  DatasetsLB.Items.InsertObject(0, frxResources.Get('dbNotAssigned'), nil);
  DatasetsLB.Items.InsertObject(1, frxResources.Get('dbSingleLine'), nil);
  dsList.Free;

  if FDataBand.DataSet = nil then
    if FDataBand.RowCount = 1 then
      i:= 1 else
      i:= 0
  else
    i:= DatasetsLB.Items.IndexOfObject(FDataBand.DataSet);
  if i =-1 then
    i:= 0;
  DatasetsLB.ItemIndex:= i;
end;

procedure TfrxDataBandEditorForm.FormHide(Sender:TObject);
begin
  if ModalResult = mrOk then
    if DatasetsLB.ItemIndex = 0 then
    begin
      FDataBand.DataSet:= nil;
      FDataBand.RowCount:= 0;
    end
    else if DatasetsLB.ItemIndex = 1 then
    begin
      FDataBand.DataSet:= nil;
      FDataBand.RowCount:= 1;
    end
    else
    begin
      FDataBand.DataSet:= TfrxDataSet(DatasetsLB.Items.Objects[DatasetsLB.ItemIndex]);
      FDataBand.RowCount:= 0;
    end;
end;

procedure TfrxDataBandEditorForm.DatasetsLBDrawItem(Control:TWinControl;
  Index:Integer; ARect:TRect; State:TOwnerDrawState);
var
  r:TRect;
begin
  r:= ARect;
  r.Right:= r.Left+18;
  r.Bottom:= r.Top+16;
  OffsetRect(r, 2, 0);
  with TListBox(Control) do
  begin
    Canvas.FillRect(ARect);
    if Index > 1 then
      Canvas.BrushCopy(r, Image1.Picture.Bitmap, Rect(0, 0, 18, 16),
        Image1.Picture.Bitmap.TransparentColor);
    Canvas.TextOut(ARect.Left+20, ARect.Top+1, Items[Index]);
  end;
end;

procedure TfrxDataBandEditorForm.DatasetsLBDblClick(Sender:TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfrxDataBandEditorForm.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
