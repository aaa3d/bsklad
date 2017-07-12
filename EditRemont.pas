unit EditRemont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ToolWin, ComCtrls, CurrEdit, RXSpin, Mask, ToolEdit;

type
  TEdit_REMONT = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label7: TLabel;
    Memo1: TMemo;
    Label8: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    Label9: TLabel;
    Edit5: TEdit;
    Memo2: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    Label12: TLabel;
    RxCalcEdit2: TRxCalcEdit;
    Label13: TLabel;
    Memo3: TMemo;
    ToolButton1: TToolButton;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Edit_REMONT: TEdit_REMONT;

implementation

{$R *.DFM}

procedure TEdit_REMONT.Button3Click(Sender: TObject);
begin
     close;
end;

end.
