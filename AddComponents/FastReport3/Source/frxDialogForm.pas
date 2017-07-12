{******************************************}
{ }
{ FastReport v3.0 }
{ Dialog form }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDialogForm;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxDialogForm = class(TForm)
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);
  private
    FOnModify:TNotifyEvent;
    procedure WMExitSizeMove(var Msg:TMessage); message WM_EXITSIZEMOVE;
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;
  public
    property OnModify:TNotifyEvent read FOnModify write FOnModify;
  end;

implementation

{$R *.DFM}

procedure TfrxDialogForm.WMExitSizeMove(var Msg:TMessage);
begin
  inherited;
  if Assigned(OnModify) then
    OnModify(Self);
end;

procedure TfrxDialogForm.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
  Message.Result:= DLGC_WANTARROWS or DLGC_WANTTAB;
end;

procedure TfrxDialogForm.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
  CanClose:= False;
end;

end.
