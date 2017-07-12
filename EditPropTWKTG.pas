unit EditPropTWKTG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup, Mask, ToolEdit, CurrEdit,Data1,b_utils,b_Dbutils, Db,
  IBCustomDataSet, IBQuery, IBDatabase;

type
  TEDIT_PROPTWKTG = class(TForm)
    Label1: TLabel;
    VID: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SUM1: TRxCalcEdit;
    SUM2: TRxCalcEdit;
    SUM3: TRxCalcEdit;
    KOL1: TRxCalcEdit;
    KOL2: TRxCalcEdit;
    KOL3: TRxCalcEdit;
    ED: TRxDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    BtnSave: TButton;
    Button2: TButton;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    EDTransaction: TIBTransaction;
    DicEd: TIBQuery;
    DsEd: TDataSource;
    DicEdED_ID: TIntegerField;
    DicEdED_SHORT: TIBStringField;
    DicEdED_FULL: TIBStringField;
    DicEdED_AUTO1: TIBStringField;
    DicEdED_AUTO2: TIBStringField;
    DicEdED_AUTO3: TIBStringField;
    DicEdTM: TDateTimeField;
    Label7: TLabel;
    NAME: TEdit;
    SKID1: TRxCalcEdit;
    SKID2: TRxCalcEdit;
    SKID3: TRxCalcEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure VIDChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SUM1Change(Sender: TObject);
    procedure KOL1Change(Sender: TObject);
    procedure EDChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSaveClick(Sender: TObject);
    procedure NAMEChange(Sender: TObject);
    procedure SKID1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EDIT_PROPTWKTG: TEDIT_PROPTWKTG;
  SAVE:boolean;

implementation

{$R *.DFM}

procedure TEDIT_PROPTWKTG.VIDChange(Sender: TObject);
var
  EN:boolean;
begin
   if VID.itemindex<0 then VID.itemIndex:=0;
   if VID.itemindex=0 then EN:=true else EN:=False;
   KOL1.enabled:=EN;
   KOL2.enabled:=EN;
   KOL3.enabled:=EN;
   SUM1.enabled:=not EN;
   SUM2.enabled:=not EN;
   SUM3.enabled:=not EN;
   SAVE:=True;
end;

procedure TEDIT_PROPTWKTG.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TEDIT_PROPTWKTG.FormShow(Sender: TObject);
begin
   EdTransaction.Active:=False;
   DicEd.close;
   DicEd.Open;
   if tag<0 then begin
      ED.value:=DicEd.fieldByname('ED_ID').asstring;
      VID.itemindex:=0;
      NAME.text:='';
   end else begin
      WorkTransaction.Active:=False;
      OPEN_SQL(QueryWork,'select * from proptwktg where proptwktg_id='+inttostr(tag));
      VID.itemindex:=QueryWork.fieldByname('VID').asinteger;
      NAME.text:=QueryWork.fieldByname('PROPTWKTG_NAME').asstring;
      if QueryWork.fieldByname('VID').asinteger=0 then begin
         KOL1.value:=QueryWork.fieldByname('VALUE1').asfloat;
         KOL2.value:=QueryWork.fieldByname('VALUE2').asfloat;
         KOL3.value:=QueryWork.fieldByname('VALUE3').asfloat;
      end else begin
         SUM1.value:=QueryWork.fieldByname('VALUE1').asfloat;
         SUM2.value:=QueryWork.fieldByname('VALUE2').asfloat;
         SUM3.value:=QueryWork.fieldByname('VALUE3').asfloat;
      end;
      SKID1.value:=QueryWork.fieldByname('SKID1').asfloat;
      SKID2.value:=QueryWork.fieldByname('SKID2').asfloat;
      SKID3.value:=QueryWork.fieldByname('SKID3').asfloat;
      ED.value:=QueryWork.fieldByname('ED_ID').asstring;
      QueryWork.close;
   end;
   VIDChange(Sender);
   SAVE:=False;
end;

procedure TEDIT_PROPTWKTG.SUM1Change(Sender: TObject);
begin
    SAVE:=True;
end;

procedure TEDIT_PROPTWKTG.KOL1Change(Sender: TObject);
begin
   SAVE:=True;
end;

procedure TEDIT_PROPTWKTG.EDChange(Sender: TObject);
begin
   SAVE:=True;
   Label5.caption:=ED.text;
   Label6.caption:=ED.text;
end;

procedure TEDIT_PROPTWKTG.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if SAVE then begin
      if Messbox('ƒанные изменены. ¬ы подтверждаете выход без сохранени€ изменений?',MessSubmit,4+48+256)<>6 then CanClose:=False;
   end;
end;

procedure TEDIT_PROPTWKTG.BtnSaveClick(Sender: TObject);
var
        rr:integer;
        r:double;
begin
  if trim(NAME.text)='' then Messbox('Ќаименование скидки не может быть пустой строкой!',MessSystem,48) else begin
           Datamodule1.IBTransaction2.Active:=False;
           Datamodule1.IBTransaction2.StartTransaction;
           try
                IBSAVE_CLEAR;
                IBSAVE_ADD('PROPTWKTG_NAME',NAME.text);
                IBSAVE_ADD('ED_ID',strtoint(ED.value));
                IBSAVE_ADD('VID',VID.itemindex);
                IBSAVE_ADD('PROPTWKTGTREE_ID',BtnSave.tag);
                IBSAVE_ADD('SKID1',SKID1.value);
                IBSAVE_ADD('SKID2',SKID2.value);
                IBSAVE_ADD('SKID3',SKID3.value);
                if VID.itemindex=0 then begin
                   IBSAVE_ADD('VALUE1',KOL1.value);
                   IBSAVE_ADD('VALUE2',KOL2.value);
                   IBSAVE_ADD('VALUE3',KOL3.value);
                end else begin
                   IBSAVE_ADD('VALUE1',SUM1.value);
                   IBSAVE_ADD('VALUE2',SUM2.value);
                   IBSAVE_ADD('VALUE3',SUM3.value);
                end;
                rr:=IBSAVE_DOC('PROPTWKTG',tag);
                if rr<0 then r:=sqrt(-1);
                Datamodule1.IBTransaction2.Commit;
                Datamodule1.IBTransaction2.Active:=False;
                tag:=rr;
                SAVE:=False;
                close;
           except
                Datamodule1.IBTransaction2.Rollback;
           end;
           Datamodule1.IBTransaction2.Active:=False;
  end;
end;

procedure TEDIT_PROPTWKTG.NAMEChange(Sender: TObject);
begin
   SAVE:=True;
end;

procedure TEDIT_PROPTWKTG.SKID1Change(Sender: TObject);
begin
    SAVE:=True;
end;

end.
