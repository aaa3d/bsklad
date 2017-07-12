unit KlnMerge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,Data1,b_utils,b_Dbutils, IBDatabase, Db,
  IBCustomDataSet, IBQuery;

type
  TKLN_MERGE = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    KLN1: TEdit;
    KOD1: TEdit;
    KLN2: TEdit;
    KOD2: TEdit;
    BtnMerge: TButton;
    Button2: TButton;
    BtnKln: TBitBtn;
    IBQuery1: TIBQuery;
    WorkTransaction: TIBTransaction;
    BitBtn1: TBitBtn;
    procedure Button2Click(Sender: TObject);
    procedure BtnKlnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnMergeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KLN_MERGE: TKLN_MERGE;
  KLN_ID1,KLN_ID2:integer;

implementation

uses DicKlient;

{$R *.DFM}

procedure TKLN_MERGE.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TKLN_MERGE.BtnKlnClick(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN_ID1;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID1 then begin
        KLN_ID1:=DIC_KLIENT.tag;
        {Отображаем название фирмы и банка}
        WorkTransaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        IbQuery1.Parambyname('KLN_ID').asinteger:=KLN_ID1;
        IbQuery1.Open;
        KLN1.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
        KOD1.text:=inttostr(KLN_ID1);
        IbQuery1.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TKLN_MERGE.BitBtn1Click(Sender: TObject);
begin
     Application.createForm(TDIC_KLIENT,DIC_KLIENT);
     DicKlnSet:=2; {Выбор клиента}
     DIC_KLIENT.tag:=KLN_ID2;
     DIC_KLIENT.ShowModal;
     if DIC_KLIENT.tag<>KLN_ID2 then begin
        KLN_ID2:=DIC_KLIENT.tag;
        {Отображаем название фирмы и банка}
        WorkTransaction.Active:=False;
        IbQuery1.Close;
        IbQuery1.SQL.clear;
        IbQuery1.SQL.add('select KLN_FULL FROM KLN_DATA( :KLN_ID)');
        IbQuery1.Parambyname('KLN_ID').asinteger:=KLN_ID2;
        IbQuery1.Open;
        KLN2.text:=IbQuery1.fieldByname('KLN_FULL').asstring;
        KOD2.text:=inttostr(KLN_ID1);
        IbQuery1.Close;
     end;
     DIC_KLIENT.Destroy;
end;

procedure TKLN_MERGE.FormShow(Sender: TObject);
begin
  KLN_ID1:=0;
  KLN_ID2:=0;
end;

procedure TKLN_MERGE.BtnMergeClick(Sender: TObject);
begin
    if KLN1=KLN2 then Messbox('Объединяемые контакты совпадают!',MessSystem,48) else begin
      KLN_ID2:=0;
      KOD2.text:='';
      KLN2.text:='';
    end;
end;

end.
