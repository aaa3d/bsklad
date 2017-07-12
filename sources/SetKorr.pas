unit SetKorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls,Data1,b_utils,b_DButils, Db, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, DualList, IBDatabase, ActnList;

type
  TSET_KORR = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    DualListDialog1: TDualListDialog;
    SPIS: TCheckBox;
    ActionList1: TActionList;
    ActSave: TAction;
    ToolButton1: TToolButton;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActSaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SET_KORR: TSET_KORR;
  RNTYP_S:ansistring;
  RN_ID,SPIS_ID:integer;

implementation

{$R *.DFM}

procedure TSET_KORR.BitBtn1Click(Sender: TObject);
var
   a:integer;
   s,s2:ansistring;
begin
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     s:='';
     s2:='';
     if DualListDialog1.Execute then begin
        {Формируем строку для запроса}
        for a:=1 to DualListDialog1.list2.Count do begin
            if QueryWork.Locate('RNTYP_SHORT',DualListDialog1.List2.Strings[a-1],[])
            then begin
                 s:=s+' '+QueryWork.fieldByname('RNTYP_ID').asstring+' ';
                 s2:=s2+' '+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
            end;
        end;
        if length(s)>0 then s:=B_utils.left(s,length(s)-1);
        if length(s2)>0 then s2:=B_utils.left(s2,length(s2)-1);
        RNTYP_S:=s;
        Edit1.text:=s2;
     end;
end;

procedure TSET_KORR.FormShow(Sender: TObject);
var
   s3,s4:ansistring;
   a:integer;
begin
     WorkTransaction.Active:=false;
     // запрашиваем список расходных
     OPEN_SQL(QueryWork,'select * from cfg where cfg_name="SET_KORR_NDS" and cfg_set1=1');
     if QueryWork.eof then begin
        RNTYP_S:='';
        RN_ID:=-1;
     end else begin
         RNTYP_S:=QueryWork.fieldByname('cfg_value').asstring;
         RN_ID:=QueryWork.fieldByname('CFG_ID').asinteger;
     end;

     // запрашиваем настройку по списанию
     OPEN_SQL(QueryWork,'select * from cfg where cfg_name="SET_KORR_NDS" and cfg_set1=2');
     if QueryWork.eof then begin
        SPIS.checked:=false;
        SPIS_ID:=-1;
     end else begin
         if QueryWork.fieldByname('cfg_value').asinteger=1 then SPIS.checked:=true
                                                           else SPIS.checked:=false;
         SPIS_ID:=QueryWork.fieldByname('CFG_ID').asinteger;
     end;

     {Заполняем DualListDialog}
     s4:='';
     s3:=' '+RNTYP_S+' ';
     for a:=1 to length(s3) do if s3[a]=',' then s3[a]:=' ';
     WorkTransaction.Active:=False;
     OPEN_SQL(QueryWork,'select RNTYP_SHORT,RNTYP_ID from RNTYP WHERE IN_USE=1 order by RNTYP_ID');
     DualListDialog1.Title:='Список типов расходных накладных';
     DualListDialog1.List1.Clear;
     DualListDialog1.List2.Clear;
     while not QueryWork.eof do begin
           if pos(' '+QueryWork.fieldByname('RNTYP_ID').asstring+' ',s3)>0 then begin
              DualListDialog1.List2.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
              s4:=s4+QueryWork.fieldByname('RNTYP_SHORT').asstring+',';
           end else
           DualListDialog1.List1.Add(QueryWork.fieldByname('RNTYP_SHORT').asstring);
           QueryWork.next;
     end;
     if length(s4)>0 then s4:=B_utils.left(s4,length(s4)-1);
     Edit1.text:=s4;
end;

procedure TSET_KORR.ActSaveExecute(Sender: TObject);
var
  ID:integer;
  r:double;
begin
   // сохраняем настройки
   Datamodule1.IBTransaction2.Active:=False;
   Datamodule1.IBTransaction2.StartTransaction;
   try
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','SET_KORR_NDS');
      IBSAVE_ADD('CFG_SET1',1);
      IBSAVE_ADD('CFG_VALUE',trim(RNTYP_S));
      ID:=ibsave_doc('CFG',RN_ID);
      if ID<0 then r:=sqrt(-1) else RN_ID:=ID;
      IBSAVE_CLEAR;
      IBSAVE_ADD('CFG_NAME','SET_KORR_NDS');
      IBSAVE_ADD('CFG_SET1',2);
      if SPIS.checked then IBSAVE_ADD('CFG_VALUE',1)
                      else IBSAVE_ADD('CFG_VALUE',0);
      ID:=ibsave_doc('CFG',SPIS_ID);
      if ID<0 then r:=sqrt(-1) else SPIS_ID:=ID;
      Datamodule1.IBTransaction2.Commit;
      Datamodule1.IBTransaction2.Active:=False;
      close;
   except
   end;
   Datamodule1.IBTransaction2.Active:=False;
end;

end.
