unit PolPn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, Db, RxMemDS, Mask, ToolEdit, IBCustomDataSet,
  IBQuery, IBDatabase, Menus;

type
  TPOL_PN = class(TForm)
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
    MnSave: TMenuItem;
    MnApply: TMenuItem;
    N3: TMenuItem;
    MnAll: TMenuItem;
    Label7: TLabel;
    SKL: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    BtnPrint: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    RxMemRnsTW_ID: TIntegerField;
    RxMemRnsPOL_ID: TIntegerField;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxMemRnsOTG_KOLChange(Sender: TField);
    procedure BtnApplyClick(Sender: TObject);
    procedure BtnAllClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  POL_PN: TPOL_PN;
  SAVE:boolean;
  CanChange:boolean;
  OTG_SKL:integer;

implementation

uses Mainform, SelectZone, ToolZoneDistribute;

{$R *.DFM}

procedure TPOL_PN.FormShow(Sender: TObject);
var
   MetFast:boolean;
begin
     CanChange:=false;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
     MetFast:=False;
//     {Читаем данные}
//     ADD_SQL(QueryWork,'select "Это перемещение со склада "||skl.skl_short label from pn$,  per, skl where per.rn_td_id = pn$.rn_td_id and skl.skl_id = per.skl_from and pn$.pn$_id=:pn_id');
//     QueryWork.ParamByname('PN_ID').asinteger:=POL_PN.tag;
//     QueryWork.Open;
//     POL_PN_LABEL.Caption := queryWork.fieldbyname('LABEL').asstring;
//     queryWork.close;
//     WorkTransaction.active:=False;
     ADD_SQL(QueryWork,'select pn$.skl_id,pntyp.pntyp_short,kln.kln_prefix,shop.shop_prefix,shop.shop_postfix, '+
     ' skl.skl_full,pn$.pn$_num,pn$.pn$_date ,pnvid.pnvid_nam, '+
     ' pn$.pn$_osn,pn$.pn$_who, '+
     ' (select kln_full from kln_data(pn$.kln_id)) as kln_full '+
     ' from pn$,skl,shop,pntyp,pnvid,kln '+
     ' where pn$.pn$_id=:pn_id and pn$.frm_id=kln.kln_id '+
     ' and pn$.skl_id=skl.skl_id and pn$.pntyp_id=pntyp.pntyp_id '+
     '  and pn$.pnvid_id=pnvid.pnvid_id ');
     QueryWork.ParamByname('PN_ID').asinteger:=POL_PN.tag;
     QueryWork.Open;
     SKL.text:=QueryWork.fieldByname('SKL_FULL').asstring;
     OTG_SKL:=QueryWork.fieldByname('SKL_ID').asinteger;
     RN_NUM_FULL.text:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
      QueryWork.fieldByname('SHOP_PREFIX').asstring+
      QueryWork.fieldByname('PNTYP_SHORT').asstring+
      b_utils.right(datetostr(QueryWork.fieldByname('PN$_DATE').asdatetime),2)+
      b_utils.right('0000000000'+QueryWork.fieldByname('PN$_NUM').asstring,5)+
      QueryWork.fieldByname('SHOP_POSTFIX').asstring;
     RN_DATE.date:=QueryWork.fieldByname('PN$_DATE').asdatetime;
     RN_VID.text:=QueryWork.fieldByname('PNVID_NAM').asstring;
     if Not CHECK_DOSTUP('$FIND.PN') then KLN.text:='Данные недоступны! Ограничение доступа!'
     else KLN.text:=QueryWork.fieldByname('KLN_FULL').asstring;
     RN_OSN.lines.clear;
     RN_OSN.lines.add(QueryWork.fieldByname('PN$_OSN').asstring);
     RN_WHO.text:=QueryWork.fieldByname('PN$_WHO').asstring;
     ADD_SQL(QueryWork,'select pol.pol_id,pns$.tw_id,pns$.pns$_id,tw.tw_art,tw.tw_nam,ed.ed_short, '+
     ' pns$.tw_kol,pol.pol_kol,pol.pol_date,pol.pol_us, '+
     ' kln.kln_fam||" "||Bg_toupper(bg_left(kln.kln_name,1))||". "|| '+
     ' bg_toupper(bg_left(kln.kln_name2,1))||". " as otg_uss '+
     ' from pns$,pol,tw,ed,kln where pns$.pn$_id=:pn_id and POL.DOC_TYP=1 and POL.DOC_ID=PNS$.PNS$_ID '+
     ' and pns$.tw_id=tw.tw_id and pol.pol_us=kln.kln_id '+
     ' and tw.ed_id=ed.ed_id order by pns$_id ');
     QueryWork.ParamByname('PN_ID').asinteger:=POL_PN.tag;
     QueryWork.Open;
     RxMemRns.EmptyTable;
     while not QueryWork.eof do begin
           RxMemRns.Append;
           RxMemRns.FieldByname('TW_ID').asinteger:=QueryWork.FieldByname('TW_ID').asinteger;
           RxMemRns.FieldByname('RNS_ID').asinteger:=QueryWork.FieldByname('PNS$_ID').asinteger;
           RxMemRns.FieldByname('POL_ID').asinteger:=QueryWork.FieldByname('POL_ID').asinteger;
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

procedure TPOL_PN.BtnSaveClick(Sender: TObject);
begin
     BtnApply.click;
     if SAVE then close;
end;

procedure TPOL_PN.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
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

procedure TPOL_PN.RxMemRnsOTG_KOLChange(Sender: TField);
begin
     if CanChange then begin
        RxMemRns.fieldByname('OTG_DATE').asdatetime:=My_NOW;
        RxMemRns.fieldByname('OTG_US').asinteger:=USERID;
        RxMemRns.fieldByname('C').asinteger:=1;
        RxMemRns.fieldByname('OTG_USS').asstring:=USERFIO_SHORT;
     end;
end;

procedure TPOL_PN.BtnApplyClick(Sender: TObject);
var
   a,ID:integer;
begin
     {Сохраняем}

     if (not btnApply.enabled) then exit;

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
              IBSAVE_DOC('POL',RxMemRNS.fieldByname('POL_ID').asinteger);
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

procedure TPOL_PN.BtnAllClick(Sender: TObject);
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

procedure TPOL_PN.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TPOL_PN.BtnPrintClick(Sender: TObject);
begin
        PRINT_PN(POL_PN.tag,POL_PN.top+BtnPrint.top+4+BtnPrint.Height,POL_PN.left+BtnPrint.left+4+BtnPrint.Width);
end;

procedure TPOL_PN.ToolButton4Click(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(RxMemRNS.fieldbyname('TW_ID').asinteger,OTG_SKL);
     PRINT_CENNIK;

end;

procedure TPOL_PN.ToolButton6Click(Sender: TObject);
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

procedure TPOL_PN.N1Click(Sender: TObject);
var pos: TPoint;
begin
        GetCursorPos(pos);

        pos := POL_PN.ScreenToClient(pos);
//        ClientToScreen
     Application.createForm(Ttool_zone_distribute,tool_zone_distribute);
     tool_zone_distribute.top:=pos.y;
     tool_zone_distribute.Left:=pos.x;

     tool_zone_distribute.tw_name.Caption := RxMemRNS.fieldbyname('TW_ART').asString + ' ' +RxMemRNS.fieldbyname('TW_NAM').asString;
     tool_zone_distribute.tw_kol.Caption := RxMemRNS.fieldbyname('TW_KOL').asString;
     tool_zone_distribute.full_tw_kol := RxMemRNS.fieldbyname('TW_KOL').asFloat;
     tool_zone_distribute.pns_id := RxMemRNS.fieldbyname('RNS_ID').asInteger;
     tool_zone_distribute.tw_id := RxMemRNS.fieldbyname('tw_ID').asInteger;
     tool_zone_distribute.skl_id := OTG_SKL;


//     Select_zone.top:=ToSHop.height+ToSHop.top+Tabsheet1.top+Pagecontrol1.top+POL_PN.top+ToolBar1.Height+20;
//     Select_zone.Left:=ToSHop.Left+Tabsheet1.Left+Pagecontrol1.Left+POL_PN.Left;
     tool_zone_distribute.showModal;
     if tool_zone_distribute.tag>0 then begin
        SAVE:=False;
//        TO_TXT.text:=SHOP_TMP;
//        TO_ID:=-Select_Shop.tag-2;
     end;
     tool_zone_distribute.Destroy;
end;

end.
