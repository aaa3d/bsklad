unit EditEdk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils,b_Dbutils, StdCtrls, Mask, ToolEdit, CurrEdit, Db,
  RxLookup, IBCustomDataSet, IBQuery, IBDatabase, ExtCtrls;

type
  TEDIT_EDK = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ListTransaction: TIBTransaction;
    QueryList: TIBQuery;
    QueryListED_ID: TIntegerField;
    QueryListED_SHORT: TIBStringField;
    QueryListED_FULL: TIBStringField;
    ED_ID: TRxDBLookupCombo;
    DsList: TDataSource;
    Label3: TLabel;
    EDK_KOL: TRxCalcEdit;
    Label4: TLabel;
    TW_MONEY: TRxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    EDK_RAZM: TEdit;
    EDK_UP: TEdit;
    BtnOk: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_EDK: TEDIT_EDK;

implementation

{$R *.DFM}

procedure TEDIT_EDK.FormShow(Sender: TObject);
begin
    listTransaction.Active:=False;
    QueryList.close;
    QueryList.ParamByname('TW_ID').asinteger:=Edit1.tag;
    QueryList.ParamByname('EDK_ID').asinteger:=EDIT_EDK.tag;
    QueryList.Open;
    if tag<0 then ED_ID.value:=QueryList.fieldByname('ED_ID').asstring
    else ED_ID.value:=inttostr(ED_ID.tag);
    tag:=0;
end;

procedure TEDIT_EDK.BtnOkClick(Sender: TObject);
begin
    tag:=2;
    close;
end;

procedure TEDIT_EDK.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TEDIT_EDK.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key=#27 then begin
       key:=#0;
       close;
    end;
end;

end.
