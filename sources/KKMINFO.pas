unit KKMINFO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_Utils,B_DButils, Grids, DBGrids, RXDBCtrl, ExtCtrls, ComCtrls,
  ToolWin, StdCtrls, RxLookup, Db, IBCustomDataSet, IBQuery, IBDatabase,
  RxMemDS,KKMEDIT;

type
  TKKM_INFO = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    RxDBGrid1: TRxDBGrid;
    ToolBar2: TToolBar;
    BtnNew1: TToolButton;
    BtnOpen1: TToolButton;
    BtnDel1: TToolButton;
    BtnKKM: TToolButton;
    ToolButton11: TToolButton;
    KKM: TRxDBLookupCombo;
    Label1: TLabel;
    DsMem1: TDataSource;
    Mem1: TRxMemoryData;
    StringField1: TStringField;
    StringField3: TStringField;
    ToolButton1: TToolButton;
    BtnUp1: TToolButton;
    BtnDown1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Mem1VID_FULL: TStringField;
    WorkTransaction: TIBTransaction;
    KKMTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    QueryKKM: TIBQuery;
    DsKKM: TDataSource;
    procedure BtnKKMClick(Sender: TObject);
    procedure BtnNew1Click(Sender: TObject);
    procedure BtnOpen1Click(Sender: TObject);
    procedure BtnDel1Click(Sender: TObject);
    procedure BtnUp1Click(Sender: TObject);
    procedure BtnDown1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KKMChange(Sender: TObject);
    procedure DsMem1DataChange(Sender: TObject; Field: TField);
    procedure Mem1CalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function SAVEKKM:boolean;
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Mem1AfterDelete(DataSet: TDataSet);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    canSave: boolean;
  public
    { Public declarations }
    CFG_ID: integer;
  end;

var

  KKM_INFO: TKKM_INFO;
  CanInsert:boolean;

implementation

{$R *.DFM}

procedure TKKM_INFO.BtnKKMClick(Sender: TObject);
begin
     {}
end;

procedure TKKM_INFO.BtnNew1Click(Sender: TObject);
begin
     Application.createForm(TKKM_EDIT,KKM_EDIT);
     KKM_EDIT.showmodal;
     if KKM_EDIT.tag>0 then begin
      CANINSERT:=true;
      Mem1.append;
      Mem1.fieldbyname('TXT').asstring:=KKM_EDIT.Edit1.text;
      if KKM_EDIT.radiobutton2.checked then begin
        Mem1.fieldbyname('VID_SHORT').asstring:='C';
      end else begin
        Mem1.fieldbyname('VID_SHORT').asstring:='W';
      end;
      Mem1.Post;
      CANINSERT:=False;
     end;
     KKM_EDIT.destroy;
     RxDbgrid1.setfocus;
end;

procedure TKKM_INFO.BtnOpen1Click(Sender: TObject);
begin
     Application.createForm(TKKM_EDIT,KKM_EDIT);
     KKM_EDIT.Edit1.text:=Mem1.fieldbyname('TXT').asstring;
     if Mem1.fieldbyname('VID_SHORT').asstring='C'
     then KKM_EDIT.radiobutton2.checked:=true
     else KKM_EDIT.radiobutton1.checked:=true;
     KKM_EDIT.showmodal;
     if KKM_EDIT.tag>0 then begin
      Mem1.Edit;
      Mem1.fieldbyname('TXT').asstring:=KKM_EDIT.Edit1.text;
      if KKM_EDIT.radiobutton2.checked then begin
        Mem1.fieldbyname('VID_SHORT').asstring:='C';
      end else begin
        Mem1.fieldbyname('VID_SHORT').asstring:='W';
      end;
      Mem1.Post;
     end;
     KKM_EDIT.destroy;
     RxDbgrid1.setfocus;
end;

procedure TKKM_INFO.BtnDel1Click(Sender: TObject);
begin
     if Messbox('Удалить строку заголовка чека ?',MessSubmitDelete,4+48+256)=6 then begin
       Mem1.delete;
     end;
end;

procedure TKKM_INFO.BtnUp1Click(Sender: TObject);
var
  s1,s2:ansistring;
  s3,s4:ansistring;
begin
     if (Mem1.RecNo>1) and (Mem1.recordcount>1) then begin
         Mem1.disablecontrols;
         s1:=Mem1.fieldbyname('TXT').asstring;
         s2:=Mem1.fieldbyname('VID_SHORT').asstring;
         Mem1.Prior;
         s3:=Mem1.fieldbyname('TXT').asstring;
         s4:=Mem1.fieldbyname('VID_SHORT').asstring;
         Mem1.Edit;
         Mem1.fieldbyname('TXT').asstring:=s1;
         Mem1.fieldbyname('VID_SHORT').asstring:=s2;
         Mem1.Post;
         Mem1.next;
         Mem1.Edit;
         Mem1.fieldbyname('TXT').asstring:=s3;
         Mem1.fieldbyname('VID_SHORT').asstring:=s4;
         Mem1.Post;
         Mem1.Prior;
         Mem1.Enablecontrols;
     end;
     RxDbgrid1.setfocus;
end;

procedure TKKM_INFO.BtnDown1Click(Sender: TObject);
var
  s1,s2:ansistring;
  s3,s4:ansistring;
begin
     if (Mem1.RecNo<Mem1.recordcount) and (Mem1.recordcount>1) then begin
         Mem1.disablecontrols;
         s1:=Mem1.fieldbyname('TXT').asstring;
         s2:=Mem1.fieldbyname('VID_SHORT').asstring;
         Mem1.Next;
         s3:=Mem1.fieldbyname('TXT').asstring;
         s4:=Mem1.fieldbyname('VID_SHORT').asstring;
         Mem1.Edit;
         Mem1.fieldbyname('TXT').asstring:=s1;
         Mem1.fieldbyname('VID_SHORT').asstring:=s2;
         Mem1.Post;
         Mem1.Prior;
         Mem1.Edit;
         Mem1.fieldbyname('TXT').asstring:=s3;
         Mem1.fieldbyname('VID_SHORT').asstring:=s4;
         Mem1.Post;
         Mem1.Next;
         Mem1.Enablecontrols;
     end;
     RxDbgrid1.setfocus;
end;

procedure TKKM_INFO.FormShow(Sender: TObject);
begin
  KKMTransaction.Active:=False;
  QueryKKM.close;
  QueryKKM.open;
  CanSave:=false;

  KKM.EmptyValue:='0';
  KKM.DisplayEmpty:='Рекламный текст';
  KKM.Value := inttostR(CFG_ID);

  KKMChange(nil);


  CanSave:=true;

end;

procedure TKKM_INFO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QueryKKM.close;
  KKMTransaction.Active:=False;
end;

procedure TKKM_INFO.KKMChange(Sender: TObject);
begin
    if CFG_ID>=0 then begin
       SAVEKKM;
    end;;
    CFG_ID:=strtoint('0'+KKM.value);

    WorkTransaction.Active:=False;
    ADD_SQL(QueryWork,'select * from cfg where cfg_name="$CHECK.HEADER" '+
    ' and cfg_set1=:KKM_ID order by cfg_set2');
    QueryWork.parambyname('KKM_ID').asinteger:=CFG_ID;
    QueryWork.Open;
    Mem1.DisableControls;
    Mem1.EmptyTable;
    while not QueryWork.eof do begin
      CANINSERT:=true;
      Mem1.append;
      Mem1.fieldbyname('TXT').asstring:=QueryWork.fieldbyname('CFG_VALUE').asstring;
      if QueryWork.fieldbyname('CFG_set3').asinteger=1 then begin
        Mem1.fieldbyname('VID_SHORT').asstring:='C';
      end else begin
        Mem1.fieldbyname('VID_SHORT').asstring:='W';
      end;
      Mem1.Post;
      CANINSERT:=False;
      QueryWork.next;
    end;
    Mem1.First;
    Mem1.Enablecontrols;
    WorkTransaction.Active:=False;

end;

procedure TKKM_INFO.DsMem1DataChange(Sender: TObject; Field: TField);
begin
     if (Mem1.State in [dsInsert]) and ( not CanInsert) then Mem1.Cancel;
end;

procedure TKKM_INFO.Mem1CalcFields(DataSet: TDataSet);
begin
  if MEM1.fieldbyname('VID_SHORT').asstring='W' then
   MEM1.fieldbyname('VID_FULL').asstring:='Широкий'
  else MEM1.fieldbyname('VID_FULL').asstring:='Узкий';
end;

procedure TKKM_INFO.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SAVEKKM then CanClose:=true
  else begin
    Messbox('Ошибка при записи данных чека!',MessSystem,48);
    CanClose:=False;
  end;
end;

function TKKM_INFO.SAVEKKM:boolean;
var
 a,i:integer;
 C:integer;
 r:double;
begin
  result:=true;
  if not CanSave then exit;

  // Записываем все загловки
  Datamodule1.IBTransaction2.Active:=False;
  Datamodule1.IBTransaction2.StartTransaction;
  if Mem1.recordcount>0 then i:=Mem1.recno else i:=0;
  try
    ADD_SQL(DataModule1.IbSaveSQL,'delete from cfg where cfg_name="$CHECK.HEADER" '+
    ' and cfg_set1=:KKM_ID');
    DataModule1.IbSaveSQL.parambyname('KKM_ID').asinteger:=CFG_ID;
    DataModule1.IbSaveSQL.ExecSQL;
    Mem1.Disablecontrols;
    Mem1.first;
    c:=0;
    while not Mem1.eof do begin
      inc(C);
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','$CHECK.HEADER');
      IBSAVE_ADD('CFG_SET1',CFG_ID);
      IBSAVE_ADD('CFG_SET2',C);
      if Mem1.fieldbyname('VID_SHORT').asstring='C'
      then IBSAVE_ADD('CFG_SET3',1)
      else IBSAVE_ADD('CFG_SET3',0);
      IBSAVE_ADD('CFG_VALUE',Mem1.fieldbyname('TXT').asstring);
      if IBSAVE_DOC('CFG',-1)<0 then r:=sqrt(-1);
      Mem1.next;
    end;
    Datamodule1.IBTransaction2.Commit;
  Except
     result:=False;
     Datamodule1.IBTransaction2.Rollback;
     Messbox('Ошибка при записи загловка чека!',MessSystem,48);
  End;
  Datamodule1.IBTransaction2.Active:=False;
  Mem1.first;
  for a:=1 to i do Mem1.next;
  Mem1.Enablecontrols;


end;

procedure TKKM_INFO.RxDBGrid1DblClick(Sender: TObject);
begin
  if BtnOpen1.enabled then BtnOpen1.click;
end;

procedure TKKM_INFO.Mem1AfterDelete(DataSet: TDataSet);
var
  En:boolean;
begin
  if Mem1.recordcount=0 then En:=False else En:=true;
  BtnOpen1.enabled:=En;
  BtnDel1.enabled:=En;
  if (Mem1.recordcount>1) and En then BtnUp1.enabled:=true
  else BtnUp1.enabled:=False;
  BtnDown1.enabled:=BtnUp1.enabled;
end;

procedure TKKM_INFO.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=46) and (BtnDel1.enabled) then BtnDel1.click;
end;

procedure TKKM_INFO.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (BtnOpen1.enabled) then BtnOpen1.click;
end;

end.
