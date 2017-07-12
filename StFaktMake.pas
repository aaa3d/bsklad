unit StFaktMake;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, ComCtrls, ToolWin, RxLookup, StdCtrls, ExtCtrls,
  Db, IBCustomDataSet, IBQuery, IBDatabase, RxMemDS, Grids, DBGrids,
  RXDBCtrl, Menus;

type
  TSTFAKT_MAKE = class(TForm)
    ToolBar1: TToolBar;
    BtnADD: TToolButton;
    BtnDEL: TToolButton;
    ToolButton3: TToolButton;
    BtnPrint: TToolButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    RNTYP: TRxDBLookupCombo;
    MakeTransaction: TIBTransaction;
    QrRNTYP: TIBQuery;
    DsRNTYP: TDataSource;
    MemSTFAKTS: TRxMemoryData;
    DsSTFAKTS: TDataSource;
    MemSTFAKTSRN_NUM_FULL: TStringField;
    MemSTFAKTSRN_ID: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    MemSTFAKTSRN_DATA: TDateField;
    MemSTFAKTSRN_OPIS: TStringField;
    PopupMenu1: TPopupMenu;
    MnAdd: TMenuItem;
    MnDel: TMenuItem;
    N2: TMenuItem;
    MnPrint: TMenuItem;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QrRNTYPRNTYP_ID: TIntegerField;
    QrRNTYPRNTYP_SHORT: TIBStringField;
    QrRNTYPRNTYP_FULL: TIBStringField;
    QrRNTYPNUM_TYP: TSmallintField;
    QrRNTYPRNTYP_SPEED: TIBStringField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemSTFAKTSAfterDelete(DataSet: TDataSet);
    procedure MemSTFAKTSAfterPost(DataSet: TDataSet);
    procedure BtnDELClick(Sender: TObject);
    procedure BtnADDClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPrintClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STFAKT_MAKE: TSTFAKT_MAKE;
  G_KEY:ansistring;

implementation

uses FindDocNum;

{$R *.DFM}

procedure TSTFAKT_MAKE.FormShow(Sender: TObject);
begin
     MakeTransaction.Active:=False;
     QrRNTYP.Close;
     QrRNTYP.Open;
     G_KEY:=#0;
     MemSTFAKTS.EmptyTable;
     if tag<=0 then begin
       RNTYP.value:=QrRNTYP.fieldByname('RNTYP_ID').asstring;
     end else begin
         {Добавляем сразу накладную}
         WorkTransaction.Active:=False;
         ADD_SQL(QueryWork,'SELECT RNTYP_ID FROM RN WHERE RN_ID= :RN_ID');
         QueryWork.PAramByname('RN_ID').asinteger:=STFAKT_MAKE.tag;
         QueryWork.Open;
         RNTYP.value:=QueryWork.fieldByname('RNTYP_ID').asstring;
         ADD_SQL(QueryWork,'SELECT * FROM OPIS_RN( :RN_ID)');
         QueryWork.PAramByname('RN_ID').asinteger:=STFAKT_MAKE.tag;
         QueryWork.Open;
         if not QueryWork.eof then begin
            MemSTFAKTS.Insert;
            MemSTFAKTS.fieldByname('RN_ID').asinteger:=STFAKT_MAKE.tag;
            MemSTFAKTS.fieldByname('RN_DATA').asdatetime:=QueryWork.fieldByname('RN_DATE').asdatetime;
            MemSTFAKTS.fieldByname('RN_NUM_FULL').asstring:=QueryWork.fieldByname('FULL_NUM').asstring;
            MemSTFAKTS.fieldByname('RN_OPIS').asstring:=QueryWork.fieldByname('RN_OPIS').asstring;
            MemSTFAKTS.Post;
         end;
     end;
     if MemSTFAKTS.recordcount>0 then
        RNTYP.enabled:=False else RNTYP.enabled:=True;
     Label1.enabled:=RNTYP.enabled;
     BtnDEL.enabled:=not RNTYP.enabled;
     BtnPrint.enabled:=not RNTYP.enabled;
     MnDel.enabled:=not RNTYP.enabled;
     MnPrint.enabled:=not RNTYP.enabled;
end;

procedure TSTFAKT_MAKE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     QrRNTYP.Close;
     MakeTransaction.Active:=False;
end;

procedure TSTFAKT_MAKE.MemSTFAKTSAfterDelete(DataSet: TDataSet);
begin
     if MemSTFAKTS.recordcount>0 then
        RNTYP.enabled:=False else RNTYP.enabled:=True;
     Label1.enabled:=RNTYP.enabled;
     BtnDEL.enabled:=not RNTYP.enabled;
     BtnPrint.enabled:=not RNTYP.enabled;
     MnDel.enabled:=not RNTYP.enabled;
     MnPrint.enabled:=not RNTYP.enabled;
end;

procedure TSTFAKT_MAKE.MemSTFAKTSAfterPost(DataSet: TDataSet);
begin
     if MemSTFAKTS.recordcount>0 then
        RNTYP.enabled:=False else RNTYP.enabled:=True;
     Label1.enabled:=RNTYP.enabled;
     BtnDEL.enabled:=not RNTYP.enabled;
     BtnPrint.enabled:=not RNTYP.enabled;
     MnDel.enabled:=not RNTYP.enabled;
     MnPrint.enabled:=not RNTYP.enabled;
end;

procedure TSTFAKT_MAKE.BtnDELClick(Sender: TObject);
begin
     if Messbox('Удалить из списка накладных для формирования счёт-фактуры накладную № '+
       MemSTFAKTS.fieldByname('RN_NUM_FULL').asstring+' ?',MessSubmitDelete,4+48+256)=6 then begin
       MemSTFAKTS.delete;
     end;
end;

procedure TSTFAKT_MAKE.BtnADDClick(Sender: TObject);
var
   a,b,c:integer;
begin
  Application.createForm(TFIND_DOCNUM,FIND_DOCNUM);
  FIND_DOCNUM.Label1.tag:=3; {Метка, что искать в расходных}
  FIND_DOCNUM.Edit1.tag:=Strtoint(RNTYP.value); {Тип расходной накладной}
  if G_KEY<>#0 then
  FIND_DOCNUM.Edit1.text:=G_Key;
  G_KEY:=#0;
  FIND_DOCNUM.ShowModal;
  if FIND_DOCNUM.tag>0 then begin
     {Определяем, нет ли такой-же накладной}
     a:=0;
     if MemSTFAKTS.recordcount>0 then begin
        b:=MemSTFAKTS.recno;
        MemSTFAKTS.disablecontrols;
        MemSTFAKTS.first;
        while not MemSTFAKTS.eof do begin
              if MemSTFAKTS.fieldByname('RN_ID').asinteger=FIND_DOCNUM.tag then inc(a);
              MemSTFAKTS.next;
        end;
        MemSTFAKTS.first;
        for c:=2 to b do MemSTFAKTS.next;
        MemSTFAKTS.Enablecontrols;
     end;
     if a=0 then begin
        {Определяем, не присутствует ли накладная в каком-либо счёте}
        WorkTransaction.Active:=False;
        ADD_SQL(QueryWork,'SELECT * FROM STFAKTS where RN_ID= :RN_ID');
        QueryWork.ParamByname('RN_ID').asinteger:=FIND_DOCNUM.tag;
        QueryWork.oPEN;
        if not QueryWork.eof then Messbox('Накладная № '+FIND_DOCNUM.FindNumQuery.fieldByname('FULL_NUM').asstring+' уже имеет связанный с ней счёт-фактуру и не будет добавлена!',MessSystem,48)
        else begin
          MemSTFAKTS.Insert;
          MemSTFAKTS.fieldByname('RN_ID').asinteger:=FIND_DOCNUM.tag;
          MemSTFAKTS.fieldByname('RN_DATA').asdatetime:=FIND_DOCNUM.FindNumQuery.fieldByname('DOC_DATE').asdatetime;
          MemSTFAKTS.fieldByname('RN_NUM_FULL').asstring:=FIND_DOCNUM.FindNumQuery.fieldByname('FULL_NUM').asstring;
          MemSTFAKTS.fieldByname('RN_OPIS').asstring:=FIND_DOCNUM.FindNumQuery.fieldByname('DOC_OPIS').asstring;
          MemSTFAKTS.Post;
        end;
     end else Messbox('Накладная № '+FIND_DOCNUM.FindNumQuery.fieldByname('FULL_NUM').asstring+' уже присутствует в списке и не будет добавлена!',MessSystem,48);
  end;
  FIND_DOCNUM.destroy;

end;

procedure TSTFAKT_MAKE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     BtnADD.click;
  end;
  if key='+' then begin
     G_KEY:='';
     Key:=#0;
     BtnADD.click;
  end;
end;

procedure TSTFAKT_MAKE.BtnPrintClick(Sender: TObject);
var
   r:double;
   ID2,ID:integer;
   NALOG5:boolean;
begin
     {Формируем счёт-фактуру}
     if Messbox('Выделять налог с продаж?','Вопрос?',4+48+256)=6 then
       NALOG5:=True else NALOG5:=False;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
        IBSAVE_CLEAR;
        IBSAVE_ADD('STFAKT_DATE',strtodatetime(datetostr(date())+' '+timetostr(time())));
        IBSAVE_ADD('STFAKT_NUM',NEW_STFAKT_NUM(date()));
        IBSAVE_ADD('US_ID',USERID);
        IBSAVE_ADD('SHOP_ID',SHOPID);
        IBSAVE_ADD('STFAKT_NALOG5',NALOG5);
        ID:=IBSAVE_DOC('STFAKT',-1);
        if ID<0 then r:=Sqrt(-1)
        else begin
           MemSTFAKTS.First;
           while not MemSTFAKTS.eof do begin
                 IBSAVE_CLEAR;
                 IBSAVE_ADD('STFAKT_ID',ID);
                 IBSAVE_ADD('RN_ID',MemSTFAKTS.fieldByname('RN_ID').asinteger);
                 ID2:=IBSAVE_DOC('STFAKTS',-1);
                 if ID2<0 then r:=Sqrt(-1);
                 MemSTFAKTS.next;
           end;
        end;
        Datamodule1.IBTransaction2.Commit;
        Datamodule1.IBTransaction2.Active:=False;
        PRINT_STFAKTDOC(ID);
        close;
     Except
        Datamodule1.IBTransaction2.RollBAck;
     End;
     Datamodule1.IBTransaction2.Active:=False;
end;

procedure TSTFAKT_MAKE.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

end.