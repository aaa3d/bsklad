unit SetSubDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, RxLookup, RxMemDS;

type
  TSet_SUBDOC = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    MemSubDoc: TRxMemoryData;
    DsSubDoc: TDataSource;
    SubDoc: TRxDBLookupCombo;
    MemSubDocNAME: TStringField;
    MemSubDocDOC: TIntegerField;
    MemSubDocID: TIntegerField;
    MemSubDocCNT: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Set_SUBDOC: TSet_SUBDOC;

implementation

uses B_Utils,B_DButils;

{$R *.DFM}

procedure TSet_SUBDOC.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TSet_SUBDOC.Button1Click(Sender: TObject);
begin
     {Создаем}
     tag:=strtoint(SubDoc.value);
     close;
end;

procedure TSet_SUBDOC.FormShow(Sender: TObject);
var
   a:integer;
   b:integer;
   canNewVipiska: boolean;
begin

     {Формируем список}
     b:=0;
     if CHECK_DOSTUP('$JOU.SPIS.NEW') then begin
       MemSubDoc.EmptyTable;
       MemSubDoc.Append;
       MemSubDoc.fieldbYname('NAME').asstring:='Акт списания';
       inc(b);
       MemSubDoc.fieldbYname('CNT').asinteger:=b;
       MemSubDoc.fieldbYname('ID').asinteger:=1;
       MemSubDoc.fieldbYname('TYP').asinteger:=0;
       MemSubDoc.Post;
     end;
     if CHECK_DOSTUP('$JOU.REMON.NEW') then begin
       MemSubDoc.Append;
       MemSubDoc.fieldbYname('NAME').asstring:='Акт переоценки';
       inc(b);
       MemSubDoc.fieldbYname('CNT').asinteger:=b;
       MemSubDoc.fieldbYname('ID').asinteger:=2;
       MemSubDoc.fieldbYname('TYP').asinteger:=0;
       MemSubDoc.Post;
     end;
     if CHECK_DOSTUP('$JOU.PER.NEW') then begin
       MemSubDoc.Append;
       MemSubDoc.fieldbYname('NAME').asstring:='Накладную перемещения';
       inc(b);
       MemSubDoc.fieldbYname('CNT').asinteger:=b;
       MemSubDoc.fieldbYname('ID').asinteger:=4;
       MemSubDoc.fieldbYname('TYP').asinteger:=0;
       MemSubDoc.Post;
     end;
     if CHECK_DOSTUP('$JOU.ST.NEW') then begin
       MemSubDoc.Append;
       MemSubDoc.fieldbYname('NAME').asstring:='Счёт';
       inc(b);
       MemSubDoc.fieldbYname('CNT').asinteger:=b;
       MemSubDoc.fieldbYname('ID').asinteger:=5;
       MemSubDoc.fieldbYname('TYP').asinteger:=0;
       MemSubDoc.Post;
     end;
     MemSubDoc.Append;
     MemSubDoc.fieldbYname('NAME').asstring:='Сообщение электронной почты';
     inc(b);
     MemSubDoc.fieldbYname('CNT').asinteger:=b;
     MemSubDoc.fieldbYname('ID').asinteger:=7;
     MemSubDoc.fieldbYname('TYP').asinteger:=0;
     MemSubDoc.Post;
     if CHECK_DOSTUP('$JOU.PN.NEW') then begin
       for a:=1 to CntPNTYP do begin
         MemSubDoc.Append;
         inc(b);
         MemSubDoc.fieldbYname('CNT').asinteger:=b;
         MemSubDoc.fieldbYname('NAME').asstring:=PNTYP[a].FULL;
         MemSubDoc.fieldbYname('ID').asinteger:=PNTYP[a].ID;
         MemSubDoc.fieldbYname('TYP').asinteger:=1;
         MemSubDoc.Post;
       end;
     end;
     canNewVipiska:= check_dostup('JOU.VIPISKA.CREATE');
     if ((CHECK_DOSTUP('$JOU.RN.NEW')) or (canNewVipiska)) then begin
       for a:=1 to CntRNTYP do begin
         if RNTYP[a].IsTemp then
         	if not canNewVipiska then
            	continue;


         MemSubDoc.Append;
         inc(b);
         MemSubDoc.fieldbYname('CNT').asinteger:=b;
         MemSubDoc.fieldbYname('NAME').asstring:=RNTYP[a].FULL;
         MemSubDoc.fieldbYname('ID').asinteger:=RNTYP[a].ID;
         MemSubDoc.fieldbYname('TYP').asinteger:=2;
         MemSubDoc.Post;
       end;
     end;
     MemSubDoc.first;
     SubDoc.value:=MemSubDoc.fieldbyname('CNT').asstring;
     tag:=0;
end;

procedure TSet_SUBDOC.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then close;
end;

end.
