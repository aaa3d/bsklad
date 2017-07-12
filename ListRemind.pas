unit ListRemind;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, StdCtrls, IBDatabase, Db,
  IBCustomDataSet, IBQuery;

type
  TLIST_REMIND = class(TForm)
    ToolBar1: TToolBar;
    BtnNew: TToolButton;
    BtnOpen: TToolButton;
    ToolButton8: TToolButton;
    BtnPropertis: TToolButton;
    ToolButton14: TToolButton;
    ToolButton16: TToolButton;
    BtnInterval: TToolButton;
    StatusBar2: TStatusBar;
    RxDBGrid1: TRxDBGrid;
    CheckBox1: TCheckBox;
    ToolButton1: TToolButton;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    IBQuery1REMIND_ID: TIntegerField;
    IBQuery1REMIND_DATE: TDateTimeField;
    IBQuery1REMIND_USER_FIO: TIBStringField;
    IBQuery1REMIND_TEXT: TBlobField;
    IBQuery1REMIND_END: TIBStringField;
    IBQuery1REMIND_END_TM: TDateTimeField;
    IBQuery1SOST: TIBStringField;
    DataSource1: TDataSource;
    IBQuery1ttt: TStringField;
    procedure BtnIntervalClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Refresh_List;
    procedure BtnOpenClick(Sender: TObject);
    procedure IBQuery1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }

    dt1, dt2: TDateTime;
  public
    { Public declarations }
  end;

var
  LIST_REMIND: TLIST_REMIND;

implementation

uses DateInterval, SetJouDate, DocRemind, Data1, b_dbUtils, b_utils, vclutils;

{$R *.DFM}


procedure TLIST_REMIND.Refresh_List;
begin

 if (dt1=date()) and (dt2=date()) then begin
        Statusbar2.Font.Style:=[FsBold];
        StatusBar2.Panels[0].text:='За СЕГОДНЯ!'
     end else begin
        Statusbar2.Font.Style:=[];
        StatusBar2.Panels[0].text:='За период с '+date_sokr(DT1)+' по '+date_sokr(DT2);
     end;


  Delay(1);

  ibquery1.DisableControls;
  ibquery1.Close;
  ibquery1.ParamByName('dt1').asDateTime:=dt1;
  ibquery1.ParamByName('dt2').asDateTime:=dt2+1-SEKOND1;
  if CheckBox1.Checked then
    ibquery1.ParamByName('SHOW_ALL').asInteger:=1
  else
    ibquery1.ParamByName('SHOW_ALL').asInteger:=0;

  if CHECK_DOSTUP('REMIND.SHOW_ALL') then
    ibquery1.ParamByName('US_ID').asInteger:= 0
  else
     ibquery1.ParamByName('US_ID').asInteger:=USERID;

  ibquery1.Open;

  ibquery1.EnableControls;

end;

procedure TLIST_REMIND.BtnIntervalClick(Sender: TObject);
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

procedure TLIST_REMIND.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TLIST_REMIND.BtnOpenClick(Sender: TObject);
var DOC_REMIND: TDOC_REMIND;
begin
 if rxDBGrid1.DataSource.DataSet.FieldbyName('REMIND_ID').asInteger > 0 then
 begin
      DOC_REMIND := TDOC_REMIND.Create(nil);
      DOC_REMIND.Load(-1, rxDBGrid1.DataSource.DataSet.FieldbyName('REMIND_ID').asInteger);
      DOC_REMIND.ShowModal;
      FreeAndNil(DOC_REMIND);

      Refresh_List;
 end;
end;

procedure TLIST_REMIND.IBQuery1CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('ttt').asString := DataSet.FieldByName('remind_text').asString;
end;

procedure TLIST_REMIND.FormShow(Sender: TObject);
begin
  {Сдвигаем даты на одну раньше}

  self.Caption := 'Напоминания '+USERFIO_SHORT;


  if CHECK_DOSTUP('REMIND.SHOW_ALL') then
    self.Caption := 'Напоминания всех пользователей';




  btnNew.Enabled := CHECK_DOSTUP('REMIND.NEW');  


  DT1:=0;//date();
  DT2:=date();
  Refresh_list;

end;

procedure TLIST_REMIND.BtnNewClick(Sender: TObject);
var DOC_REMIND: TDOC_REMIND;
begin
 begin
      DOC_REMIND := TDOC_REMIND.Create(nil);
      DOC_REMIND.Load(0, 0);
      DOC_REMIND.ShowModal;
      FreeAndNil(DOC_REMIND);


      Refresh_List;
 end;
end;

procedure TLIST_REMIND.RxDBGrid1DblClick(Sender: TObject);
begin
  btnOpen.Click;
end;


procedure TLIST_REMIND.CheckBox1Click(Sender: TObject);
begin
  Refresh_list;
end;

end.
