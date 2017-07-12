unit SelectPrintRemon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,B_utils,B_DButils, Mask, ToolEdit, RxLookup, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TSelect_Print_Remon = class(TForm)
    Label1: TLabel;
    CheckBox1: TCheckBox;
    SKLTransaction: TIBTransaction;
    QuerySKL: TIBQuery;
    DsSKL: TDataSource;
    Button1: TButton;
    Button2: TButton;
    SKL: TRxDBLookupCombo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_Print_Remon: TSelect_Print_Remon;

implementation

{$R *.DFM}

procedure TSelect_Print_Remon.Button1Click(Sender: TObject);
begin
     SKL.tag:=1;
     tag:=strtoint(SKL.value);
     close;
end;

procedure TSelect_Print_Remon.FormShow(Sender: TObject);
begin
     SKLtransaction.active:=False;
     QuerySKL.close;
     QuerySKL.Open;
     QuerySKL.locate('SKL_ID',Select_Print_remon.tag,[]);
     SKL.value:=inttostr(Select_Print_remon.tag);
     SKL.setfocus;
     tag:=0;
end;

procedure TSelect_Print_Remon.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TSelect_Print_Remon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     QuerySKL.close;
     SKLtransaction.active:=False;
end;

procedure TSelect_Print_Remon.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
        key:=#0;
        close;
     end;
end;

procedure TSelect_Print_Remon.Button3Click(Sender: TObject);
begin
     SKL.tag:=2;
     tag:=strtoint(SKL.value);
     close;
end;

end.
