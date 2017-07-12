unit OtgrSpis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_DButils, StdCtrls, ComCtrls, ToolWin, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, Db, RxMemDS, Mask, ToolEdit, IBCustomDataSet,
  IBQuery, IBDatabase, Menus;

type
  TOTGR_SPIS = class(TForm)
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
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OTGR_SPIS: TOTGR_SPIS;
  SAVE:boolean;
  CanChange:boolean;
  OTG_SKL:integer;

implementation

uses Mainform;

{$R *.DFM}

procedure TOTGR_SPIS.FormShow(Sender: TObject);
begin
     CanChange:=false;
     Top:=Main_Form.Top+22;
     Left:=Screen.DesktopLeft;
     Width:=Screen.DesktopWidth;
     Height:=Screen.DesktopHeight-Main_Form.Top-22-29;
     {Читаем данные}
     WorkTransaction.active:=False;
     ADD_SQL(QueryWork,'select spis.skl_id,kln.kln_prefix,shop.shop_prefix,shop.shop_postfix, '+
     ' skl.skl_full,spis.spis_num,spis.spis_date ,spisvid.spisvid_nam, '+
     ' spis.spis_osn,spis.spis_who '+
     ' from spis,skl,shop,spisvid,kln '+
     ' where spis.spis_id=:spis_id and spis.frm_id=kln.kln_id '+
     ' and spis.skl_id=skl.skl_id '+
     '  and spis.spisvid_id=spisvid.spisvid_id ');
     QueryWork.ParamByname('SPIS_ID').asinteger:=OTGR_SPIS.tag;
     QueryWork.Open;
     if QueryWork.eof then begin
       ADD_SQL(QueryWork,'select spis.skl_id,kln.kln_prefix,shop.shop_prefix,shop.shop_postfix, '+
       ' skl.skl_full,spis.spis_num,spis.spis_date ,spisvid.spisvid_nam, '+
       ' spis.spis_osn,spis.spis_who '+
       ' from spis,skl,shop,spisvid,kln '+
       ' where spis.spis_id=:spis_id and spis.frm_id=kln.kln_id '+
       ' and spis.skl_id=skl.skl_id '+
       '  and spis.spisvid_id=spisvid.spisvid_id ');
       QueryWork.ParamByname('SPIS_ID').asinteger:=OTGR_SPIS.tag;
       QueryWork.Open;
       BtnAll.enabled:=False;
       BtnSave.enabled:=False;
       BtnApply.enabled:=False;
       MnSave.enabled:=False;
       MnApply.enabled:=False;
       MnAll.enabled:=False;
       RxDbGrid1.readonly:=True;
      Otgr_SPIS.caption:=Otgr_SPIS.caption+'. Только чтение';
     end;
     SKL.text:=QueryWork.fieldByname('SKL_FULL').asstring;
     OTG_SKL:=QueryWork.fieldByname('SKL_ID').asinteger;
     RN_NUM_FULL.text:=QueryWork.fieldByname('KLN_PREFIX').asstring+' '+
      QueryWork.fieldByname('SHOP_PREFIX').asstring+
      b_utils.right(datetostr(QueryWork.fieldByname('SPIS_DATE').asdatetime),2)+
      b_utils.right('0000000000'+QueryWork.fieldByname('SPIS_NUM').asstring,5)+
      QueryWork.fieldByname('SHOP_POSTFIX').asstring;
     RN_DATE.date:=QueryWork.fieldByname('SPIS_DATE').asdatetime;
     RN_VID.text:=QueryWork.fieldByname('SPISVID_NAM').asstring;
     RN_OSN.lines.clear;
     RN_OSN.lines.add(QueryWork.fieldByname('SPIS_OSN').asstring);
     RN_WHO.text:=QueryWork.fieldByname('SPIS_WHO').asstring;
     ADD_SQL(QueryWork,'select spiss.tw_id,spiss.spiss_id,tw.tw_art,tw.tw_nam,ed.ed_short, '+
     ' spiss.tw_kol,spiss.otg_kol,spiss.otg_date,spiss.otg_us, '+
     ' kln.kln_fam||" "||Bg_toupper(BG_left(kln.kln_name,1))||". "|| '+
     ' Bg_toupper(BG_left(kln.kln_name2,1))||". " as otg_uss '+
     ' from spiss,tw,ed,kln where spiss.spis_id=:spis_id '+
     ' and spiss.tw_id=tw.tw_id and spiss.otg_us=kln.kln_id '+
     ' and tw.ed_id=ed.ed_id order by spiss_id ');
     QueryWork.ParamByname('spis_ID').asinteger:=OTGR_spis.tag;
     QueryWork.Open;
     RxMemRns.EmptyTable;
     while not QueryWork.eof do begin
           RxMemRns.Append;
           RxMemRns.FieldByname('TW_ID').asinteger:=QueryWork.FieldByname('TW_ID').asinteger;
           RxMemRns.FieldByname('RNS_ID').asinteger:=QueryWork.FieldByname('SPISS_ID').asinteger;
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

procedure TOTGR_SPIS.BtnSaveClick(Sender: TObject);
begin
     BtnApply.click;
     if SAVE then close;
end;

procedure TOTGR_SPIS.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
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

procedure TOTGR_SPIS.RxMemRnsOTG_KOLChange(Sender: TField);
begin
     if CanChange then begin
        RxMemRns.fieldByname('OTG_DATE').asdatetime:=My_NOW;
        RxMemRns.fieldByname('OTG_US').asinteger:=USERID;
        RxMemRns.fieldByname('C').asinteger:=1;
        RxMemRns.fieldByname('OTG_USS').asstring:=USERFIO_SHORT;
     end;
end;

procedure TOTGR_SPIS.BtnApplyClick(Sender: TObject);
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
              IBSAVE_DOC('SPISS',RxMemRNS.fieldByname('RNS_ID').asinteger);
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

procedure TOTGR_SPIS.BtnAllClick(Sender: TObject);
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

procedure TOTGR_SPIS.ToolButton1Click(Sender: TObject);
begin
     My_lock;
end;

procedure TOTGR_SPIS.ToolButton4Click(Sender: TObject);
begin
        PRINT_SPIS(OTGR_SPIS.tag);
end;

procedure TOTGR_SPIS.ToolButton7Click(Sender: TObject);
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

procedure TOTGR_SPIS.ToolButton6Click(Sender: TObject);
begin
     CLEAR_CENNIK;
     ADD_CENNIK(RxMemRNS.fieldbyname('TW_ID').asinteger,OTG_SKL);
     PRINT_CENNIK;
end;

end.
