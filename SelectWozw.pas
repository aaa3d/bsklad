unit SelectWozw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons,Data1, ComCtrls, Db,
  IBCustomDataSet, IBQuery, IBDatabase,b_utils,b_Dbutils, Grids, DBGrids,
  RXDBCtrl;

type
  TSelect_WOZW = class(TForm)
    Panel1: TPanel;
    BtnOk: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    DT1: TDateEdit;
    Label3: TLabel;
    DT2: TDateEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Query1Transaction: TIBTransaction;
    IBQuery1: TIBQuery;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    RxDBGrid1: TRxDBGrid;
    Image1: TImage;
    RepTransaction: TIBTransaction;
    QueryRep: TIBQuery;
    DsRep: TDataSource;
    QueryRepRN_ID: TIntegerField;
    QueryRepRNS_ID: TIntegerField;
    QueryRepRN_DATE: TDateTimeField;
    QueryRepRN_FULLNUM: TIBStringField;
    QueryRepRNS_KOL: TFloatField;
    QueryRepRNS_MONEY: TFloatField;
    QueryRepRNS_SUMM: TFloatField;
    QueryRepRNS_OST: TFloatField;
    QueryRepPNS_NDS: TIntegerField;
    Label4: TLabel;
    QueryRepNDS: TFloatField;
    QueryRepNP: TFloatField;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure QueryRepAfterOpen(DataSet: TDataSet);
    procedure refreshRep(S:string);
    procedure DT1Change(Sender: TObject);
    procedure DT2Change(Sender: TObject);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Select_WOZW: TSelect_WOZW;
  CanRefresh:boolean=False;

implementation

{$R *.DFM}

procedure TSelect_WOZW.Button2Click(Sender: TObject);
begin
    close;
end;

procedure TSelect_WOZW.BtnOkClick(Sender: TObject);
begin
   tag:=2;
   close;
end;

procedure TSelect_WOZW.SpeedButton1Click(Sender: TObject);
begin
   DT2.date:=date();
   DT1.date:=DT2.date-6;
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.SpeedButton2Click(Sender: TObject);
begin
   DT2.date:=date();
   DT1.date:=DT2.date-31;
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.SpeedButton3Click(Sender: TObject);
begin
   DT2.date:=date();
   DT1.date:=DT2.date-61;
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.SpeedButton4Click(Sender: TObject);
begin
   DT2.date:=date();
   DT1.date:=DT2.date-183;
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.FormShow(Sender: TObject);
begin
   CanRefresh:=False;
   if Label2.tag=1 then begin
      SELECT_WOZW.caption:='Возврат товара от покупателя. Выбор товара';
   end else if Label2.tag=2 then begin
      SELECT_WOZW.caption:='Возврат товара поставщику. Выбор товара';
   end;
   tag:=0;
   DT2.date:=date();
   DT1.date:=DT2.date-1;
   Edit1.setfocus;
   CanRefresh:=true;
//   if dt2.tag<> 0 then
//    CheckBox1.Visible:=true;

end;

procedure TSelect_WOZW.FormKeyPress(Sender: TObject; var Key: Char);
var
  STR:string;
  ID,N:integer;
begin
     STR:=edit1.text;
     if timer1.enabled and (key in ['0','1','2','3','4','5','6','7','8','9',#8,#13,#27]) then begin
       case key of
         #8: begin
             if length(STR)>0 then begin
                if length(STR)=1 then STR:=''
                else begin
                  if (length(STR)=2) and (B_Utils.left(STR,1)='Б') then STR:='' else
                  STR:=B_utils.left(STR,length(STR)-1);
                end;
             end;
         end;
         #13: begin
              key:=#0;
              if RxDbGrid1.Focused then begin
                 if BtnOk.enabled then BtnOk.click;
              end;
              if Edit1.focused then begin
                {Ввод закончен}
                if length(STR)>0 then begin
                 {Добавляем строку}
                 RefreshRep(Edit1.text);
                 key:=#0;
                end;
              end;
         end;
         else begin
           if length(STR)<10 then begin
             if (key='0') and (STR='') then key:='Б';
             STR:=STR+key;
           end;
         end;
       end;
     end;
     edit1.text:=STR;

end;

procedure TSELECT_WOZW.refreshRep(S:string);
var
 N,ID:integer;
begin
  if CanRefresh then begin
                 Query1Transaction.Active:=False;
                 IBQuery1.close;
                 IBQuery1.SQL.clear;
                 IBQuery1.SQL.add('select TW_ID,TW_NAM, TW_SHORT_NAM from TW where TW_ART=:TW_ART and TW_BRAK=:TW_BRAK');
                 if B_utils.left(S,1)='Б' then begin
                    N:=strtoint(B_Utils.right(S,length(S)-1));
                    IBQuery1.ParamByname('TW_ART').asinteger:=N;
                    IBQuery1.ParamByname('TW_BRAK').asstring:='1';
                 end else begin
                    N:=strtoint(S);
                    IBQuery1.ParamByname('TW_ART').asinteger:=N;
                    IBQuery1.ParamByname('TW_BRAK').asstring:='0';
                 end;
                 Panel1.tag:=N;
                 IBQuery1.Open;
                 if not IBQuery1.eof then begin

                    ID:=IBQuery1.fieldbyname('TW_ID').asinteger;
                    RxDbGrid1.tag:=ID;
                    Statusbar1.panels[0].text:='OK!';
                    Statusbar1.panels[1].text:=IBQuery1.fieldbyname('TW_NAM').asstring;
                    Edit2.text:=IBQuery1.fieldbyname('TW_NAM').asstring;
                    Edit3.text:=IBQuery1.fieldbyname('TW_SHORT_NAM').asstring;
                    RepTransaction.Active:=False;
                    QueryRep.close;
                    QueryRep.ParamByname('DT1').asdatetime:=Dt1.date;
                    QueryRep.ParamByname('DT2').asdatetime:=Dt2.date+1-sekond1;
                    QueryRep.ParamByname('TW_ID').asinteger:=ID;
                    QueryRep.ParamByname('PNRNTYP_ID').asinteger:=BtnOk.tag;
                    QueryRep.ParamByname('TYP').asinteger:=Label2.tag;
                    QueryRep.ParamByname('FRM_ID').asinteger:=DT1.tag;


                    QueryRep.ParamByname('KLN_ID').asinteger:= 0;
                    if CheckBox1.Checked then
                      QueryRep.ParamByname('KLN_ID').asinteger:= dt2.tag;

                    QueryRep.ParamByname('SKL_ID').asinteger:=label4.tag;   //склад для актов списания
                    QueryRep.ParamByname('SHOP_ID').asinteger:=SpeedButton3.tag;   //магазин для актов списания
                    if (SpeedButton4.tag > 0) then QueryRep.ParamByname('US_ID').asinteger:=SpeedButton4.tag;   //виновный для актов списания


                    QueryRep.Open;
                    RxDbgrid1.setfocus;
                 end else begin
                        Statusbar1.panels[0].text:='';
                        Edit2.text:='';
                        messbox('Не существует товара с кодом: '+inttostr(N)+' !',MessSystem,48);
                 end;
  end;
end;

procedure TSelect_WOZW.Timer1Timer(Sender: TObject);
begin
    if Image1.Visible then Image1.Visible:=False else Image1.Visible:=True;
end;

procedure TSelect_WOZW.Edit1Enter(Sender: TObject);
begin
   timer1.enabled:=True;
end;

procedure TSelect_WOZW.Edit1Exit(Sender: TObject);
begin
   timer1.enabled:=False;
   Image1.Visible:=False;
end;

procedure TSelect_WOZW.RxDBGrid1DblClick(Sender: TObject);
begin
   if QueryRep.Active then begin
     if BtnOk.enabled then BtnOk.Click;
   end
end;

procedure TSelect_WOZW.QueryRepAfterOpen(DataSet: TDataSet);
begin
   BtnOk.enabled:=not QueryRep.eof;
end;

procedure TSelect_WOZW.DT1Change(Sender: TObject);
begin
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.DT2Change(Sender: TObject);
begin
   RefreshRep(Edit1.text);
end;

procedure TSelect_WOZW.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
     key:=#0;
     if BtnOk.enabled then BtnOk.Click;
   end
end;

procedure TSelect_WOZW.CheckBox1Click(Sender: TObject);
begin
   RefreshRep(Edit1.text);
end;

end.

