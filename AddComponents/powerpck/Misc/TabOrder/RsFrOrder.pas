{****************************************}
{                                        }
{           FastReport v2.4              }
{              Tab Order                 }
{                                        }
{ Copyright (c) 2001 by Цымбалюк Олег    }
{ Copyright (c) 2002 by Stalker SoftWare }
{                                        }
{****************************************}

unit RsFrOrder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Fr_Class, fr_dctrl;

type
  TSetOrderForm = class(TForm)
    OKBitBtn: TBitBtn;
    ExitBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    OrderListBox: TListBox;
    UpBitBtn: TBitBtn;
    DownBitBtn: TBitBtn;
    HintLabel: TLabel;
    procedure UpBitBtnClick(Sender: TObject);
    procedure DownBitBtnClick(Sender: TObject);
    procedure OrderListBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OrderListBoxEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure OrderListBoxDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FModifiedOrder :Boolean;
    FOldTabOrder :TList;
    FIsUndo :Boolean;
    procedure Localize;
    procedure UndoTabOrder;

  public
    procedure OnTabOrderSetClick(Sender: TObject);

  end;


implementation

{$R *.DFM}
{$R RsFrRes.res}
{$R RsFrResStr.res}

uses
  frOrderConst;

var
  SetOrderForm :TSetOrderForm;

{--------------------------------------------------------------------}
{ Отобразить форму мастера TabOrder                                  }
{--------------------------------------------------------------------}
procedure TSetOrderForm.FormShow(Sender: TObject);
var
  i       :Integer;
  IsEmpty :Boolean;

begin

 FModifiedOrder := frDesigner.Modified;
 FIsUndo := False;
 OrderListBox.Items.Clear;
 IsEmpty := True;

 try

   if CurPage.Objects.Count <= 0 then Exit;

   for i := 0 to CurPage.Objects.Count - 1 do begin

     if (not (TfrView(CurPage.Objects[i]) is TfrLabelControl)) and
        (not (TfrView(CurPage.Objects[i]) is TfrNonVisualControl)) then begin

       OrderListBox.Items.Add( TfrView(CurPage.Objects[i]).Name);
       IsEmpty := False;

     end; { if }

     FOldTabOrder.Add(CurPage.Objects[i]);

   end; { for }

 finally

   UpBitBtn.Enabled   := (not IsEmpty);
   DownBitBtn.Enabled := (not IsEmpty);
   if IsEmpty then OrderListBox.Items.Add('(None)');

 end; { try }

end; { FormShow }

{--------------------------------------------------------------------}
{ Передвинуть объект вверх на одну позицию                           }
{--------------------------------------------------------------------}
procedure TSetOrderForm.UpBitBtnClick(Sender: TObject);
var
  nIndex,i    :Integer;
  nIndObj     :Integer;
  nIndObjPrev :Integer;
  cObj        :String;
  cObjPrev    :String;

begin

 if OrderListBox.ItemIndex <> 0 then begin

   FModifiedOrder := True;
   FIsUndo := True;
   nIndObj := 0;
   nIndObjPrev := 0;

   nIndex := OrderListBox.ItemIndex;
   cObj := OrderListBox.Items[nIndex];        // Имя текущего объекта
   cObjPrev := OrderListBox.Items[nIndex-1];  // Имя объекта стоящего выше текущего

   OrderListBox.Items.Move(nIndex, nIndex - 1);
   OrderListBox.ItemIndex := nIndex - 1;

    for i := 0 to CurPage.Objects.Count - 1 do begin

      if TfrView(CurPage.Objects[i]).Name = cObj then
        nIndObj := i;

      if TfrView(CurPage.Objects[i]).Name = cObjPrev then
        nIndObjPrev := i;

    end; { for }

   CurPage.Objects.Move(nIndObj, nIndObjPrev);

 end; { if }

end; { BitBtnUpClick }

{--------------------------------------------------------------------}
{ Передвинуть объект вниз на одну позицию                            }
{--------------------------------------------------------------------}
procedure TSetOrderForm.DownBitBtnClick(Sender: TObject);
var
  nIndex,i    :Integer;
  nIndObj     :Integer;
  nIndObjNext :Integer;
  cObj        :String;
  cObjNext    :String;

begin

  if OrderListBox.ItemIndex <> OrderListBox.Items.Count - 1 then begin

    FModifiedOrder := True;
    FIsUndo := True;
    nIndObj := 0;
    nIndObjNext := 0;

    nIndex   := OrderListBox.ItemIndex;
    cObj     := OrderListBox.Items[nIndex];    // Имя текущего объекта
    cObjNext := OrderListBox.Items[nIndex+1];  // Имя объекта стоящего ниже текущего

    OrderListBox.Items.Move(nIndex, nIndex + 1);
    OrderListBox.ItemIndex := nIndex + 1;

    for i := 0 to CurPage.Objects.Count - 1 do begin

      if TfrView(CurPage.Objects[i]).Name = cObj then
        nIndObj := i;

      if TfrView(CurPage.Objects[i]).Name = cObjNext then
        nIndObjNext := i;

    end; { for }

    CurPage.Objects.Move(nIndObj, nIndObjNext);

  end; { if }

end; { BitBtnDnClick }

{--------------------------------------------------------------------}
{ Передвинуть объект мышью                                           }
{--------------------------------------------------------------------}
procedure TSetOrderForm.OrderListBoxEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  nIndex,i :Integer;
  nIndObj  :Integer;
  nIndObj2 :Integer;
  cObj     :String;
  cObj2    :String;

begin

 if (Sender = OrderListBox) and (Target = OrderListBox) then begin

   nIndObj := 0;
   nIndObj2 := 0;

   nIndex := OrderListBox.ItemAtPos(Point(X, Y), True);
   if nIndex < 0 then nIndex := OrderListBox.Items.Count - 1;
   cObj  := OrderListBox.Items[OrderListBox.ItemIndex];
   cObj2 := OrderListBox.Items[nIndex];
   OrderListBox.Items.Move(OrderListBox.ItemIndex, nIndex);

    for i := 0 to CurPage.Objects.Count - 1 do begin

      if TfrView(CurPage.Objects[i]).Name = cObj then
        nIndObj := i;

      if TfrView(CurPage.Objects[i]).Name = cObj2 then
        nIndObj2 := i;

    end; { if }

    CurPage.Objects.Move(nIndObj, nIndObj2);
    OrderListBox.ItemIndex := nIndex;

   FModifiedOrder := True;
   FIsUndo := True;

 end; { if }

end; { OrderListBoxEndDrag }

procedure TSetOrderForm.OrderListBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin

 if (ssLeft in Shift) then
    OrderListBox.BeginDrag(False)
 else
 if OrderListBox.Dragging then
   OrderListBox.EndDrag(False);

end; { OrderListBoxMouseMove }

procedure TSetOrderForm.OrderListBoxDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
 Accept := (Sender = OrderListBox) and (Source = OrderListBox) and (OrderListBox.Items.Count > 1)
end; { OrderListBoxDragOver }

{--------------------------------------------------------------------}
{ Откат изменений сделанных в TabOrder                               }
{--------------------------------------------------------------------}
procedure TSetOrderForm.UndoTabOrder;
var
  nInd :Integer;

begin

 for nInd := 0 to FOldTabOrder.Count-1 do
   CurPage.Objects[nInd] := FOldTabOrder[nInd];

end; { UndoTabOrder }

{--------------------------------------------------------------------}
{ Запуск мастера TabOrder                                            }
{--------------------------------------------------------------------}
procedure TSetOrderForm.OnTabOrderSetClick(Sender: TObject);
begin

 if CurPage.PageType <> ptDialog then
   MessageDlg(LoadStr(S_WARNING), mtWarning, [mbOK], 0)
 else begin

  FOldTabOrder := TList.Create;
  try
    if (ShowModal = mrCancel) and (FIsUndo) then
      UndoTabOrder;
  finally
    frDesigner.Modified := FModifiedOrder;
    FOldTabOrder.Free;
  end; { try }

 end; { if }

end; { OnTabOrderSetClick }

{--------------------------------------------------------------------}
{ Локализация                                                        }
{--------------------------------------------------------------------}
procedure TSetOrderForm.Localize;
begin
 ExitBitBtn.Caption := LoadStr(S_EXIT);
 UpBitBtn.Hint := LoadStr(S_UP_HINT);
 DownBitBtn.Hint := LoadStr(S_DOWN_HINT);
 Caption := LoadStr(S_CAPTION);
 HintLabel.Caption := LoadStr(S_LAB);
end; { Localize }

procedure TSetOrderForm.FormCreate(Sender: TObject);
begin
 Localize;
end; { FormCreate }

var
  BmpOrder :TBitmap;

initialization
  SetOrderForm := TSetOrderForm.Create(nil);
  BmpOrder := TBitmap.Create;
  BmpOrder.Handle := LoadBitmap(hInstance, 'RS_SETORDER');
  frRegisterTool(LoadStr(S_MASTER), BmpOrder, TSetOrderForm(SetOrderForm).OnTabOrderSetClick);

finalization
  BmpOrder.Free;
  SetOrderForm.Free;
  SetOrderForm := nil;

end.

