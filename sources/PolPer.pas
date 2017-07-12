unit PolPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, Db, RxMemDS, Mask, ToolEdit, IBCustomDataSet,
  IBQuery, IBDatabase, Menus;

type
  TPOL_PER = class(TForm)
    ToolBar1: TToolBar;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    BtnAll: TButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    StatusBar1: TStatusBar;
    RxMemRns: TRxMemoryData;
    RxMemRnsRNS_ID: TIntegerField;
    RxMemRnsTW_ART: TIntegerField;
    RxMemRnsTW_NAM: TStringField;
    RxMemRnsED_SHORT: TStringField;
    RxMemRnsTW_KOL: TFloatField;
    RxMemRnsOTG_KOL: TFloatField;
    RxMemRnsOTG_DATE: TDateField;
    RxMemRnsOTG_US: TIntegerField;
    RxMemRnsOTG_USS: TStringField;
    Label1: TLabel;
    RN_NUM_FULL: TEdit;
    Label2: TLabel;
    RN_DATE: TDateEdit;
    Label3: TLabel;
    SKL_FROM: TEdit;
    Label4: TLabel;
    RN_WHO: TEdit;
    RN_OSN: TMemo;
    Label6: TLabel;
    DsMem: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    RxMemRnsC: TIntegerField;
    PopupMenu1: TPopupMenu;
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N3: TMenuItem;
    MnAll: TMenuItem;
    Label5: TLabel;
    SKL_TO: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    RxMemRnsTW_ID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxMemRnsOTG_KOLChange(Sender: TField);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnAllClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  POL_PER: TPOL_PER;
  SAVE:boolean;
  CanChange:boolean;
  OTG_SKL:integer;

implementation

uses Mainform;

{$R *.DFM}

procedure TPOL_PER.FormShow(Sender: TObject);
begin
     CanChange:=false;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
     {Читаем данные}
     WorkTransaction.active:=False;
     ADD_SQL(QueryWork,'select per.skl_to as skl_id,kln.kln_prefix,shop.shop_prefix,shop.shop_postfix, '+
      ' skl.skl_full as skl_from,(select skl.skl_full from skl where skl.skl_id=per.skl_to) as skl_to, '+
      ' per.per_num,per.per_date, per.per_osn,per.per_who '+
      ' from per,skl,shop,kln where per.per_id=:PER_ID and per.frm_id=kln.kln_id '+
      ' and per.skl_from=skl.skl_id ');
     QueryWork.ParamByname('PER_ID').asinteger:=POL_PER.tag;
     QueryWork.Open;
     RN_NUM_FULL.text:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
      QueryWork.fieldByname('SHOP_PREFIX').asstring+
      b_utils.right(datetostr(QueryWork.fieldByname('PER_DATE').asdatetime),2)+
      b_utils.right('0000000000'+QueryWork.fieldByname('PER_NUM').asstring,5)+
      QueryWork.fieldByname('SHOP_POSTFIX').asstring;
     RN_DATE.date:=QueryWork.fieldByname('PER_DATE').asdatetime;
     OTG_SKL:=QueryWork.fieldByname('SKL_ID').asinteger;
     SKL_FROm.text:=QueryWork.fieldByname('SKL_FROM').asstring;
     SKL_TO.text:=QueryWork.fieldByname('SKL_TO').asstring;
     RN_OSN.lines.clear;
     RN_OSN.lines.add(QueryWork.fieldByname('PER_OSN').asstring);
     RN_WHO.text:=QueryWork.fieldByname('PER_WHO').asstring;
     ADD_SQL(QueryWork,'select pers.tw_id,pers.pers_id,tw.tw_art,tw.tw_nam,ed.ed_short, '+
     ' pers.tw_kol,pers.pol_kol,pers.pol_date,pers.pol_us, '+
     ' kln.kln_fam||" "||Bg_toupper(BG_left(kln.kln_name,1))||". "|| '+
     ' Bg_toupper(BG_left(kln.kln_name2,1))||". " as otg_uss '+
     ' from pers,tw,ed,kln where pers.per_id=:rn_id '+
     ' and pers.tw_id=tw.tw_id and pers.pol_us=kln.kln_id '+
     ' and tw.ed_id=ed.ed_id order by pers_id ');
     QueryWork.ParamByname('RN_ID').asinteger:=POL_PER.tag;
     QueryWork.Open;
     RxMemRns.EmptyTable;
     while not QueryWork.eof do begin
           RxMemRns.Append;
           RxMemRns.FieldByname('TW_ID').asinteger:=QueryWork.FieldByname('TW_ID').asinteger;
           RxMemRns.FieldByname('RNS_ID').asinteger:=QueryWork.FieldByname('PERS_ID').asinteger;
           RxMemRns.FieldByname('TW_ART').asinteger:=QueryWork.FieldByname('TW_ART').asinteger;
           RxMemRns.FieldByname('TW_NAM').asstring:=QueryWork.FieldByname('TW_NAM').asstring;
           RxMemRns.FieldByname('ED_SHORT').asstring:=QueryWork.FieldByname('ED_SHORT').asstring;
           RxMemRns.FieldByname('TW_KOL').asfloat:=QueryWork.FieldByname('TW_KOL').asfloat;
           RxMemRns.FieldByname('OTG_DATE').asfloat:=QueryWork.FieldByname('POL_DATE').asfloat;
           RxMemRns.FieldByname('OTG_KOL').asfloat:=QueryWork.FieldByname('POL_KOL').asfloat;
           RxMemRns.FieldByname('OTG_US').asinteger:=QueryWork.FieldByname('POL_US').asinteger;
           RxMemRns.FieldByname('OTG_USS').asstring:=QueryWork.FieldByname('OTG_USS').asstring;
           RxMemRns.fieldByname('C').asinteger:=0;
           RxMemRns.Post;
           QueryWork.next;
     end;
     QueryWork.close;

     btnApply.enabled := check_dostup('$POL.SKL_ID='+inttostr(OTG_SKL)) or check_dostup('$POL.ALL_SKL');
     btnSave.Enabled:=btnApply.Enabled;


     SAVE:=true;
     CanChange:=True;
end;

procedure TPOL_PER.BtnSaveClick(Sender: TObject);
begin
     BtnApply.click;
     if SAVE then close;
end;

procedure TPOL_PER.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     {Выделяем цветом Номер}
     Afont.color:=clWindowText;
     Background:=clWindow;
     if Field.Fieldname='OTG_KOL' then begin
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat) then
           if OTG_COLOR2>0 then Background:=OTG_COLOR2; {Отгружен полностью}
        if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=0
           then  if OTG_COLOR1>0 then Background:=OTG_COLOR1; {Совсем не отгружен}
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat<
              (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
              and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>0) then
              if OTG_COLOR3>0 then Background:=OTG_COLOR3; {Отгружен частично }
        if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>
           (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat) then
           if OTG_COLOR4>0 then Background:=OTG_COLOR4; {Что-то отгружено с излишком}
     end;
     if HighLight then  begin
        Afont.color:=clHighlighttext;
        Background:=clHighlight;
        if Field.Fieldname='OTG_KOL' then begin
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=
              (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat) then
              if OTG_COLOR2>0 then Afont.color:=OTG_COLOR2; {Отгружен полностью}
           if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat=0
              then  if OTG_COLOR1>0 then Afont.color:=OTG_COLOR1; {Совсем не отгружен}
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat<
              (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat)
              and ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>0) then
              if OTG_COLOR3>0 then Afont.color:=OTG_COLOR3; {Отгружен частично }
           if ((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('OTG_KOL').Asfloat>
              (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('TW_KOL').Asfloat) then
              if OTG_COLOR4>0 then Afont.color:=OTG_COLOR4; {Что-то отгружено с излишком}
        end;
     end;
end;

procedure TPOL_PER.RxMemRnsOTG_KOLChange(Sender: TField);
begin
     if CanChange then begin
        RxMemRns.fieldByname('OTG_DATE').asdatetime:=My_NOW;
        RxMemRns.fieldByname('OTG_US').asinteger:=USERID;
        RxMemRns.fieldByname('C').asinteger:=1;
        RxMemRns.fieldByname('OTG_USS').asstring:=USERFIO_SHORT;
     end;
end;

procedure TPOL_PER.BtnApplyClick(Sender: TObject);
var
   a,ID:integer;
begin

     if (not btnApply.enabled) then exit;   
     {Сохраняем}
     ID:=RxMemRNS.RecNo;
     RxMemRNS.Disablecontrols;
     RxMemRNS.First;
     Datamodule1.IBTransaction2.Active:=False;
     Datamodule1.IBTransaction2.StartTransaction;
     Try
     while not RxMemRNS.eof do begin
           if RxMemRNS.fieldByname('C').asinteger=1 then begin
              IBSAVE_CLEAR;
              IBSAVE_ADD('POL_KOL',RxMemRNS.fieldByname('OTG_KOL').asfloat);
              IBSAVE_ADD('POL_US',RxMemRNS.fieldByname('OTG_US').asinteger);
              IBSAVE_ADD('POL_DATE',RxMemRNS.fieldByname('OTG_DATE').asdatetime);
              IBSAVE_DOC('PERS',RxMemRNS.fieldByname('RNS_ID').asinteger);
              RxMemRNS.edit;
              RxMemRNS.fieldByname('C').asinteger:=0;
              RxMemRNS.Post;
           end;
           RxMemRNS.next;
     end;
     Datamodule1.IBTransaction2.Commit;
     Except
           Datamodule1.IBTransaction2.Rollback;
     end;
     Datamodule1.IBTransaction2.Active:=False;
     RxMemRNS.First;
     for a:=1 to ID-1 do RxMemRNS.next;
     RxMemRNS.Enablecontrols;
end;

procedure TPOL_PER.BtnAllClick(Sender: TObject);
var
   a,ID:integer;
begin
     ID:=RxMemRNS.RecNo;
     RxMemRNS.Disablecontrols;
     RxMemRNS.First;
     while not RxMemRNS.eof do begin
           if RxMemRNS.fieldByname('OTG_KOL').asfloat<RxMemRNS.fieldByname('TW_KOL').asfloat
           then begin
                RxMemRNS.Edit;
                RxMemRNS.fieldByname('OTG_KOL').asfloat:=RxMemRNS.fieldByname('TW_KOL').asfloat;
                RxMemRNS.Post;
           end;
           RxMemRNS.next;
     end;
     RxMemRNS.First;
     for a:=1 to ID-1 do RxMemRNS.next;
     RxMemRNS.Enablecontrols;
end;

procedure TPOL_PER.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TPOL_PER.ToolButton4Click(Sender: TObject);
begin
        PRINT_PER(POL_PER.tag);
end;

procedure TPOL_PER.ToolButton6Click(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(RxMemRNS.fieldbyname('TW_ID').asinteger,OTG_SKL);
     PRINT_CENNIK;
end;

procedure TPOL_PER.ToolButton7Click(Sender: TObject);
var
   a,ID:integer;
begin
     CLEAR_CENNIK;
     if RxMemRNS.RecordCount>0 then begin
         ID:=RxMemRNS.RecNo;
         RxMemRNS.DisableControls;
         RxMemRNS.First;
         while not RxMemRNS.eof do begin
               ADD_CENNIK(RxMemRNS.fieldbyname('TW_ID').asinteger,OTG_SKL);
               RxMemRNS.next;
         end;
         RxMemRNS.First;
         for a:=1 to ID-1 do RxMemRNS.next;
         RxMemRNS.EnableControls;
         PRINT_CENNIK;
     end;
end;

end.
