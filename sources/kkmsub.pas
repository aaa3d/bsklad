unit KKMSUB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, RxGrdCpt,b_utils,b_dbutils;

type
  TKKM_SUB = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    KKM_SUMM: TRxCalcEdit;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KKM_SUB: TKKM_SUB;

implementation

{$R *.DFM}


procedure TKKM_SUB.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TKKM_SUB.FormShow(Sender: TObject);
begin
     KKM_SUMM.value:=0;
     tag:=0;
end;

procedure TKKM_SUB.Button1Click(Sender: TObject);
begin
        if KKM_SUMM.value<=0 then messbox('Вносимая сумма не может быть нулевой или отрицательной!',MessSystem,48) else begin
           tag:=2;
           close;
        end;

end;

end.
