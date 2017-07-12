unit OtgrRn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, Db, RxMemDS, Mask, ToolEdit, IBCustomDataSet,
  IBQuery, IBDatabase, Menus;

type
  TOTGR_RN = class(TForm)
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
    KLN: TEdit;
    Label4: TLabel;
    RN_WHO: TEdit;
    Label5: TLabel;
    RN_VID: TEdit;
    RN_OSN: TMemo;
    Label6: TLabel;
    DsMem: TDataSource;
    WorkTransaction: TIBTransaction;
    QueryWork: TIBQuery;
    RxMemRnsC: TIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MnAll: TMenuItem;
    Label7: TLabel;
    SKL: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    RxMemRnsTW_ID: TIntegerField;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    RN_DOST: TCheckBox;
    DOST_DATE: TDateEdit;
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
    procedure ToolButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OTGR_RN: TOTGR_RN;
  SAVE:boolean;
  CanChange:boolean;
  OTG_SKL:integer;

implementation

uses Mainform;

{$R *.DFM}

procedure TOTGR_RN.FormShow(Sender: TObject);
begin
     CanChange:=false;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
     {Читаем данные}
//     WorkTransaction.active:=False;
//     ADD_SQL(queryWork, 'select "Это перемещение на склад " || skl.skl_short label from rn, per, skl where rn_id =:RN_ID and rn_td_id=rn_id and skl.skl_id = per.skl_to ');
//      QueryWork.ParamByname('RN_ID').asinteger:=OTGR_RN.tag;
//     QueryWork.Open;
//     PER_SHOP_LABEL.Caption := queryWork.fieldbyname('LABEL').asstring;
//    QueryWork.close;


     ADD_SQL(QueryWork,'select RN.RN_DOST, RN.DOST_DATE, rntyp.rntyp_short,kln.kln_prefix,shop.shop_prefix,shop.shop_postfix, '+
     ' skl.skl_id,skl.skl_full,rn.rn_num,rn.rn_date ,rnvid.rnvid_nam, '+
     ' rn.rn_osn,rn.rn_who, '+
     ' (select kln_full from kln_data(rn.kln_id)) as kln_full '+
     ' from rn,skl,shop,rntyp,rnvid,kln '+
     ' where rn.rn_id=:rn_id and rn.frm_id=kln.kln_id '+
     ' and rn.skl_id=skl.skl_id and rn.rntyp_id=rntyp.rntyp_id '+
     '  and rn.rnvid_id=rnvid.rnvid_id ');
     QueryWork.ParamByname('RN_ID').asinteger:=OTGR_RN.tag;
     QueryWork.Open;
     SKL.text:=QueryWork.fieldByname('SKL_FULL').asstring;
     OTG_SKL:=QueryWork.fieldByname('SKL_ID').asinteger;
     RN_NUM_FULL.text:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
      QueryWork.fieldByname('SHOP_PREFIX').asstring+
      QueryWork.fieldByname('RNTYP_SHORT').asstring+
      b_utils.right(datetostr(QueryWork.fieldByname('RN_DATE').asdatetime),2)+
      b_utils.right('0000000000'+QueryWork.fieldByname('RN_NUM').asstring,5)+
      QueryWork.fieldByname('SHOP_POSTFIX').asstring;
     RN_DATE.date:=QueryWork.fieldByname('RN_DATE').asdatetime;

     if QueryWork.fieldByname('RN_DOST').AsString='1' then
     begin
        RN_DOST.Checked:=True;
        DOST_DATE.date:=QueryWork.fieldByname('DOST_DATE').asdatetime;
     end;

     RN_VID.text:=QueryWork.fieldByname('RNVID_NAM').asstring;
     KLN.text:=QueryWork.fieldByname('KLN_FULL').asstring;
     RN_OSN.lines.clear;
     RN_OSN.lines.add(QueryWork.fieldByname('RN_OSN').asstring);
     RN_WHO.text:=QueryWork.fieldByname('RN_WHO').asstring;
     ADD_SQL(QueryWork,'select rns.tw_id,rns.rns_id,tw.tw_art,tw.tw_nam,ed.ed_short, '+
     ' rns.tw_kol,rns.otg_kol,rns.otg_date,rns.otg_us, '+
     ' kln.kln_fam||" "||bg_toupper(BG_left(kln.kln_name,1))||". "|| '+
     ' bg_toupper(BG_left(kln.kln_name2,1))||". " as otg_uss '+
     ' from rns,tw,ed,kln where rns.rn_id=:rn_id '+
     ' and rns.tw_id=tw.tw_id and rns.otg_us=kln.kln_id '+
     ' and tw.ed_id=ed.ed_id order by rns_id ');
     QueryWork.ParamByname('RN_ID').asinteger:=OTGR_RN.tag;
     QueryWork.Open;
     RxMemRns.EmptyTable;
     while not QueryWork.eof do begin
           RxMemRns.Append;
           RxMemRns.FieldByname('TW_ID').asinteger:=QueryWork.FieldByname('TW_ID').asinteger;
           RxMemRns.FieldByname('RNS_ID').asinteger:=QueryWork.FieldByname('RNS_ID').asinteger;
           RxMemRns.FieldByname('TW_ART').asinteger:=QueryWork.FieldByname('TW_ART').asinteger;
           RxMemRns.FieldByname('TW_NAM').asstring:=QueryWork.FieldByname('TW_NAM').asstring;
           RxMemRns.FieldByname('ED_SHORT').asstring:=QueryWork.FieldByname('ED_SHORT').asstring;
           RxMemRns.FieldByname('TW_KOL').asfloat:=QueryWork.FieldByname('TW_KOL').asfloat;
           RxMemRns.FieldByname('OTG_KOL').asfloat:=QueryWork.FieldByname('OTG_KOL').asfloat;
           RxMemRns.FieldByname('OTG_DATE').asfloat:=QueryWork.FieldByname('OTG_DATE').asfloat;
           RxMemRns.FieldByname('OTG_US').asinteger:=QueryWork.FieldByname('OTG_US').asinteger;
           RxMemRns.FieldByname('OTG_USS').asstring:=QueryWork.FieldByname('OTG_USS').asstring;
           RxMemRns.fieldByname('C').asinteger:=0;
           RxMemRns.Post;
           QueryWork.next;
     end;
     QueryWork.close;

     btnApply.enabled := check_dostup('$OTGRUZ.SKL_ID='+inttostr(OTG_SKL)) or check_dostup('$OTGRUZ.ALL_SKL');
     btnSave.Enabled:=btnApply.Enabled;


     SAVE:=true;
     CanChange:=True;
end;

procedure TOTGR_RN.BtnSaveClick(Sender: TObject);
begin
     BtnApply.click;
     if SAVE then close;
end;

procedure TOTGR_RN.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
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

procedure TOTGR_RN.RxMemRnsOTG_KOLChange(Sender: TField);
begin
     if CanChange then begin
        RxMemRns.fieldByname('OTG_DATE').asdatetime:=My_NOW;
        RxMemRns.fieldByname('OTG_US').asinteger:=USERID;
        RxMemRns.fieldByname('C').asinteger:=1;
        RxMemRns.fieldByname('OTG_USS').asstring:=USERFIO_SHORT;
     end;
end;

procedure TOTGR_RN.BtnApplyClick(Sender: TObject);
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
              IBSAVE_ADD('OTG_KOL',RxMemRNS.fieldByname('OTG_KOL').asfloat);
              IBSAVE_ADD('OTG_US',RxMemRNS.fieldByname('OTG_US').asinteger);
              IBSAVE_ADD('OTG_DATE',RxMemRNS.fieldByname('OTG_DATE').asdatetime);
              IBSAVE_DOC('RNS',RxMemRNS.fieldByname('RNS_ID').asinteger);
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

procedure TOTGR_RN.BtnAllClick(Sender: TObject);
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

procedure TOTGR_RN.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TOTGR_RN.ToolButton4Click(Sender: TObject);
begin
        PRINT_RN(OTGR_RN.tag);
end;

procedure TOTGR_RN.ToolButton6Click(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(RxMemRNS.fieldbyname('TW_ID').asinteger,OTG_SKL);
     PRINT_CENNIK;
end;

procedure TOTGR_RN.ToolButton7Click(Sender: TObject);
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

procedure TOTGR_RN.ToolButton10Click(Sender: TObject);
begin
  RN_SHOWPO(OTGR_RN.tag);
end;

end.
