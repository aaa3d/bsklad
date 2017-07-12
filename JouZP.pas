unit JouZP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, IBDatabase,Data1,b_utils,b_dbutils, Db,
  IBCustomDataSet, IBQuery, RxLookup, StdCtrls, Grids, DBGrids, RXDBCtrl;

type
  TJOU_ZP = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    JouTransaction: TIBTransaction;
    DicUsers: TIBQuery;
    DicUsersUS_ID: TIntegerField;
    DicUsersUS_FULL: TIBStringField;
    DicOtdels: TIBQuery;
    DicOtdelsOTDEL_ID: TIntegerField;
    DicOtdelsOTDEL_NAME: TIBStringField;
    DsUsers: TDataSource;
    DsOtdels: TDataSource;
    BtnInterval: TToolButton;
    ToolButton2: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    ToolButton3: TToolButton;
    OTDEL: TRxDBLookupCombo;
    USER: TRxDBLookupCombo;
    StatusBar2: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    JouZP: TIBQuery;
    DsZP: TDataSource;
    JouZPUS_ID: TIntegerField;
    JouZPUS_FULL: TIBStringField;
    JouZPOTDEL_ID: TIntegerField;
    JouZPOTDEL_NAME: TIBStringField;
    JouZPMESS: TIBStringField;
    JouZPTM: TDateTimeField;
    JouZPmess_full: TStringField;
    procedure FormShow(Sender: TObject);
    procedure refresh_list;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIntervalClick(Sender: TObject);
    procedure JouZPCalcFields(DataSet: TDataSet);
    procedure OTDELChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JOU_ZP: TJOU_ZP;
  DT1,DT2:tdatetime;
  G_KEY:char;
  CanRefresh:boolean;

implementation

uses SetJouDate, DateInterval, Mainform;

{$R *.DFM}

procedure TJOU_ZP.FormShow(Sender: TObject);
begin
   Top:=Main_Form.Top+22;
   Left:=Screen.DesktopLeft;
   Width:=Screen.DesktopWidth;
   Height:=Screen.Height-Main_Form.Top-22-28;
   CanRefresh:=False;
   JouTransaction.Active:=False;
   DicUsers.close;
   DicUsers.open;
   DicOtdels.close;
   DicOtdels.open;
   OTDEL.value:='-1';
   USER.value:='-1';
   dt1:=date()-7;
   dt2:=date();
   refresh_list;
   CanRefresh:=True;
end;

Procedure TJou_ZP.refresh_list;
begin
     if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;
     JouZP.close;
     JouZP.ParamByname('DT1').asdatetime:=DT1;
     JouZP.ParamByname('DT2').asdatetime:=DT2+1-SEKOND1;
     JouZP.ParamByname('US_ID').asinteger:=strtoint(USER.value);
     JouZP.ParamByname('OTDEL_ID').asinteger:=strtoint(OTDEL.value);
     JouZP.Open;
end;


procedure TJOU_ZP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if KEY='-' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1-1;
     DT2:=DT2-1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY='+' then begin
     {Сдвигаем даты на одну раньше}
     DT1:=DT1+1;
     DT2:=DT2+1;
     Refresh_list;
     Key:=#0;
  end;
  if KEY in ['c','C','С','c'] then begin
     {Дата сегодня}
     DT1:=date();
     DT2:=date();
     Refresh_list;
  end;
  if (KEY in ['i','I','ш','Ш']) and (BtnInterval.enabled) then begin
     Key:=#0;
     BtnInterval.click;
  end;
{  if key  in ['0'..'9'] then begin
     G_KEY:=Key;
     Key:=#0;
     BtnFind.click;
  end;}
  if key=#27 then Close;
  if key='/' then begin
     key:=#0;
     Application.createForm(TSET_JOUDATE,SET_JOUDATE);
     SET_JOUDATE.showModal;
     if SET_JOUDATE.tag>0 then begin
        DT1:=SET_JOUDATE.DateEdit1.date;
        DT2:=SET_JOUDATE.DateEdit1.date;
        Refresh_list;
     end;
     SET_JOUDATE.Destroy;
  end;

end;

procedure TJOU_ZP.BtnIntervalClick(Sender: TObject);
begin
  Application.createForm(TDate_interval,Date_Interval);
  Date_interval.Dt1.date:=DT1;
  Date_interval.Dt2.date:=DT2;
  Date_interval.Showmodal;
  if Date_interval.tag=2 then begin
    DT1:=Date_interval.Dt1.date;
    DT2:=Date_interval.Dt2.date;
    Refresh_list;
  end;
  Date_interval.destroy;
  RxDbgrid1.setfocus;
end;

procedure TJOU_ZP.JouZPCalcFields(DataSet: TDataSet);
begin
    if JouZP.fieldByname('mess').asstring='$1' then
       JouZP.fieldByname('mess_full').asstring:='Принят на работу!'
    else
       JouZP.fieldByname('mess_full').asstring:=JouZP.fieldByname('mess').asstring;

end;

procedure TJOU_ZP.OTDELChange(Sender: TObject);
begin
    if CanRefresh then Refresh_list;
end;

end.
