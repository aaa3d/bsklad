unit ReportMinResult;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,B_utils,B_Dbutils, ComCtrls, StdCtrls, ExtCtrls, ToolWin, Db,
  IBCustomDataSet, IBQuery, IBDatabase, RxLookup, RXSpin, Menus;

type
  TReport_Min_result = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BtnSave: TToolButton;
    BtnApply: TToolButton;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    ZAK: TRxSpinEdit;
    Edit1: TEdit;
    Label4: TLabel;
    MOVE1: TRxSpinEdit;
    Edit2: TEdit;
    Label5: TLabel;
    SHOP1_1: TRxDBLookupCombo;
    SklTransaction: TIBTransaction;
    QuerySkl: TIBQuery;
    QuerySklSKL_SHORT: TIBStringField;
    QuerySklSKL_ID: TIntegerField;
    DsSkl: TDataSource;
    SHOP1_2: TRxDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    MOVE2: TRxSpinEdit;
    Edit3: TEdit;
    Label8: TLabel;
    SHOP2_1: TRxDBLookupCombo;
    Label9: TLabel;
    SHOP2_2: TRxDBLookupCombo;
    Label10: TLabel;
    MOVE3: TRxSpinEdit;
    Edit4: TEdit;
    Label11: TLabel;
    SHOP3_1: TRxDBLookupCombo;
    Label12: TLabel;
    SHOP3_2: TRxDBLookupCombo;
    Label13: TLabel;
    MOVE4: TRxSpinEdit;
    Edit5: TEdit;
    Label14: TLabel;
    SHOP4_1: TRxDBLookupCombo;
    Label15: TLabel;
    SHOP4_2: TRxDBLookupCombo;
    Label16: TLabel;
    MOVE5: TRxSpinEdit;
    Edit6: TEdit;
    Label17: TLabel;
    SHOP5_1: TRxDBLookupCombo;
    Label18: TLabel;
    SHOP5_2: TRxDBLookupCombo;
    Label19: TLabel;
    MOVE6: TRxSpinEdit;
    Edit7: TEdit;
    Label20: TLabel;
    SHOP6_1: TRxDBLookupCombo;
    Label21: TLabel;
    SHOP6_2: TRxDBLookupCombo;
    Label22: TLabel;
    MOVE7: TRxSpinEdit;
    Edit8: TEdit;
    Label23: TLabel;
    SHOP7_1: TRxDBLookupCombo;
    Label24: TLabel;
    SHOP7_2: TRxDBLookupCombo;
    Label25: TLabel;
    MOVE8: TRxSpinEdit;
    Edit9: TEdit;
    Label26: TLabel;
    SHOP8_1: TRxDBLookupCombo;
    Label27: TLabel;
    SHOP8_2: TRxDBLookupCombo;
    Label28: TLabel;
    MOVE9: TRxSpinEdit;
    Edit10: TEdit;
    Label29: TLabel;
    SHOP9_1: TRxDBLookupCombo;
    Label30: TLabel;
    SHOP9_2: TRxDBLookupCombo;
    Label31: TLabel;
    MOVE10: TRxSpinEdit;
    Edit11: TEdit;
    Label32: TLabel;
    SHOP10_1: TRxDBLookupCombo;
    Label33: TLabel;
    SHOP10_2: TRxDBLookupCombo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnApplyClick(Sender: TObject);
    procedure ZAKChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_Min_result: TReport_Min_result;
  SAVE:boolean;

implementation

uses ReportMinOst;

{$R *.DFM}

procedure TReport_Min_result.FormShow(Sender: TObject);
begin
     SklTransaction.Active:=False;
     QuerySKL.close;
     QuerySKL.open;
     SAVE:=True;
end;

procedure TReport_Min_result.BtnSaveClick(Sender: TObject);
begin
     if not Save then BtnApply.click;
     if Save then close;
end;

procedure TReport_Min_result.BtnApplyClick(Sender: TObject);
var
   s,s2:ansistring;
begin
     s:='';
     s2:='';
     if ZAK.Value>0 then begin
        s:='ZAK@'+floattostrf(ZAK.value,fffixed,19,4);
        s2:='Закупка '+floattostrf(ZAK.value,fffixed,19,4);
     end;
     if (MOVE1.Value>0) and (SHOP1_1.value<>SHOP1_2.value) then s:=s+' MOVE1@'+floattostrf(MOVE1.value,fffixed,19,4)+'@'+SHOP1_1.value+'@'+SHOP1_2.value;
     if (MOVE2.Value>0) and (SHOP2_1.value<>SHOP2_2.value) then s:=s+' MOVE2@'+floattostrf(MOVE2.value,fffixed,19,4)+'@'+SHOP2_1.value+'@'+SHOP2_2.value;
     if (MOVE3.Value>0) and (SHOP3_1.value<>SHOP3_2.value) then s:=s+' MOVE3@'+floattostrf(MOVE3.value,fffixed,19,4)+'@'+SHOP3_1.value+'@'+SHOP3_2.value;
     if (MOVE4.Value>0) and (SHOP4_1.value<>SHOP4_2.value) then s:=s+' MOVE4@'+floattostrf(MOVE4.value,fffixed,19,4)+'@'+SHOP4_1.value+'@'+SHOP4_2.value;
     if (MOVE5.Value>0) and (SHOP5_1.value<>SHOP5_2.value) then s:=s+' MOVE5@'+floattostrf(MOVE5.value,fffixed,19,4)+'@'+SHOP5_1.value+'@'+SHOP5_2.value;
     if (MOVE6.Value>0) and (SHOP6_1.value<>SHOP6_2.value) then s:=s+' MOVE6@'+floattostrf(MOVE6.value,fffixed,19,4)+'@'+SHOP6_1.value+'@'+SHOP6_2.value;
     if (MOVE7.Value>0) and (SHOP7_1.value<>SHOP7_2.value) then s:=s+' MOVE7@'+floattostrf(MOVE7.value,fffixed,19,4)+'@'+SHOP7_1.value+'@'+SHOP7_2.value;
     if (MOVE8.Value>0) and (SHOP8_1.value<>SHOP8_2.value) then s:=s+' MOVE8@'+floattostrf(MOVE8.value,fffixed,19,4)+'@'+SHOP8_1.value+'@'+SHOP8_2.value;
     if (MOVE9.Value>0) and (SHOP9_1.value<>SHOP9_2.value) then s:=s+' MOVE9@'+floattostrf(MOVE9.value,fffixed,19,4)+'@'+SHOP9_1.value+'@'+SHOP9_2.value;
     if (MOVE10.Value>0) and (SHOP10_1.value<>SHOP10_2.value) then s:=s+' MOVE10@'+floattostrf(MOVE10.value,fffixed,19,4)+'@'+SHOP10_1.value+'@'+SHOP10_2.value;

     if (MOVE1.Value>0) and (SHOP1_1.value<>SHOP1_2.value) then s2:=s2+','+SHOP1_1.text+'>'+SHOP1_2.text+' '+floattostrf(MOVE1.value,fffixed,19,4);
     if (MOVE2.Value>0) and (SHOP2_1.value<>SHOP2_2.value) then s2:=s2+','+SHOP2_1.text+'>'+SHOP2_2.text+' '+floattostrf(MOVE2.value,fffixed,19,4);
     if (MOVE3.Value>0) and (SHOP3_1.value<>SHOP3_2.value) then s2:=s2+','+SHOP3_1.text+'>'+SHOP3_2.text+' '+floattostrf(MOVE3.value,fffixed,19,4);
     if (MOVE4.Value>0) and (SHOP4_1.value<>SHOP4_2.value) then s2:=s2+','+SHOP4_1.text+'>'+SHOP4_2.text+' '+floattostrf(MOVE4.value,fffixed,19,4);
     if (MOVE5.Value>0) and (SHOP5_1.value<>SHOP5_2.value) then s2:=s2+','+SHOP5_1.text+'>'+SHOP5_2.text+' '+floattostrf(MOVE5.value,fffixed,19,4);
     if (MOVE6.Value>0) and (SHOP6_1.value<>SHOP6_2.value) then s2:=s2+','+SHOP6_1.text+'>'+SHOP6_2.text+' '+floattostrf(MOVE6.value,fffixed,19,4);
     if (MOVE7.Value>0) and (SHOP7_1.value<>SHOP7_2.value) then s2:=s2+','+SHOP7_1.text+'>'+SHOP7_2.text+' '+floattostrf(MOVE7.value,fffixed,19,4);
     if (MOVE8.Value>0) and (SHOP8_1.value<>SHOP8_2.value) then s2:=s2+','+SHOP8_1.text+'>'+SHOP8_2.text+' '+floattostrf(MOVE8.value,fffixed,19,4);
     if (MOVE9.Value>0) and (SHOP9_1.value<>SHOP9_2.value) then s2:=s2+','+SHOP9_1.text+'>'+SHOP9_2.text+' '+floattostrf(MOVE9.value,fffixed,19,4);
     if (MOVE10.Value>0) and (SHOP10_1.value<>SHOP10_2.value) then s2:=s2+','+SHOP10_1.text+'>'+SHOP10_2.text+' '+floattostrf(MOVE10.value,fffixed,19,4);
     if B_utils.left(s2,1)=',' then s2:=B_utils.right(s2,length(s2)-2);
     Report_Min_Ost.MemReport.edit;
     Report_Min_Ost.MemReport.fieldByname('result').asstring:=s2;
     Report_Min_Ost.MemReport.fieldByname('result_sec').asstring:=s;
     Report_Min_Ost.MemReport.Post;
     SAVE:=true;
end;

procedure TReport_Min_result.ZAKChange(Sender: TObject);
begin
     SAVE:=False;
end;

end.