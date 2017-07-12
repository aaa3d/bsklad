unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ExtCtrls, DBCtrls, Grids, DBGrids, dbf, Menus, Buttons,
  ComCtrls;

type
  TMainForm = class(TForm)
    DemoButton: TButton;
    DbfDemo: TDbf;
    DataSourceDemo: TDataSource;
    DbfDisco: TDbf;
    DatasourceDisco: TDataSource;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    DbfDiscoCALCPRICE: TCurrencyField;
    DbfDiscoAUTHOR: TStringField;
    DbfDiscoTITLE: TStringField;
    DbfDiscoCOMPANY: TStringField;
    DbfDiscoCOUNTRY: TStringField;
    DbfDiscoYEAR: TSmallintField;
    DbfDiscoPRICE: TFloatField;
    DbfDiscoNOTE: TStringField;
    DbfDiscoQTY: TSmallintField;
    Bevel3: TBevel;
    Image1: TImage;
    DBRichEdit1: TDBRichEdit;
    procedure DbfDemoAfterScroll(DataSet: TDataSet);
    procedure DemoButtonClick(Sender: TObject);
    procedure DbfDiscoFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DbfDemoCalcFields(DataSet: TDataSet);
    procedure DbfDiscoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceDemoStateChange(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    lastForm:TForm;
  end;
var
  MainForm: TMainForm;

implementation

uses EditTopics, Simple, Index, Search, Filter, Calc, Schema, Schema2,
  CreateTable;

{$R *.DFM}

  

procedure TMainForm.DbfDemoAfterScroll(DataSet: TDataSet);
begin
  DemoButton.Enabled:=length(trim(DbfDemo.FieldByName('DEMO').AsString))>0;
end;

procedure TMainForm.DemoButtonClick(Sender: TObject);
var
  demo:string;
  newForm:TForm;
begin
  newForm:=nil;
  demo:=trim(DbfDemo.FieldByName('DEMO').AsString);
  if demo='simple' then newForm:=simpleForm
  else if demo='index' then newForm:=indexForm
  else if demo='search' then newForm:=SearchForm
  else if demo='filter' then newForm:=FilterForm
  else if demo='memo' then newForm:=EditTopicsForm
  else if demo='calc' then newForm:=calcForm
  else if demo='schema' then newForm:=FormSchema1
  else if demo='schema2' then newForm:=FormSchema2
  else if demo='create' then newForm:=CreateTableForm
  else ;
  if (lastForm<>newForm) and (lastform<>nil) then lastForm.Hide;
  if (newform<>nil) then newForm.Show;
  lastForm:=newForm;
end;

procedure TMainForm.DbfDiscoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  year:integer;
  country:string;
  correct_year:boolean;
  correct_country:boolean;
begin
  year:=StrToIntDef(DbfDiscoYear.AsString,0);
  Country:=DbfDiscoCountry.AsString;
  correct_year:=
    ((year=0) and FilterForm.cbBlank.checked)
    or
    ((year >= FilterForm.Year_From.Tag)
    and (year <= FilterForm.Year_To.Tag));

  if Country='USA' then correct_country:=FilterForm.cbUSA.checked
  else if Country='USA' then correct_country:=FilterForm.cbUSA.checked
  else if Country='SWE' then correct_country:=FilterForm.cbSWE.checked
  else if Country='UK' then correct_country:=FilterForm.cbUK.checked
  else if Country='GER' then correct_country:=FilterForm.cbGER.checked
  else if Country='HOL' then correct_country:=FilterForm.cbHOL.checked
  else if Country='ITA' then correct_country:=FilterForm.cbITA.checked
  else correct_country:=FilterForm.cbOTH.checked;

  Accept:=correct_year and correct_country;

end;

procedure TMainForm.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  DbfDemo.IndexName:='IDX.NDX';
end;

procedure TMainForm.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssShift in Shift) and (ssCtrl in Shift) then EditTopicsForm.showModal;
end;

procedure TMainForm.DbfDemoCalcFields(DataSet: TDataSet);
begin
//  if length(DbfDemoDemo.AsString)>0 then DbfDemoHasDemo.AsString:='Y'
//  else DbfDemoHasDemo.AsString:='N';

end;

procedure TMainForm.DbfDiscoCalcFields(DataSet: TDataSet);
var
  Price:double;
  Qty:double;
  CalcPrice:double;
begin
  try
    Price:=DbfDiscoPRICE.AsFloat;
    Qty:=DbfDiscoQTY.AsFloat;
    if Qty=0 then calcPrice:=0
    else calcPrice:=Price/Qty;
    DbfDiscoCALCPRICE.AsFloat:=calcPrice;
  except
    DbfDiscoCALCPRICE.AsFloat:=0;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DbfDemo.Active:=true;
  DbfDisco.Active:=true;
end;


procedure TMainForm.DataSourceDemoStateChange(Sender: TObject);
var
  ed:boolean;
begin
  ed:=DbfDemo.State in [dsEdit,dsInsert];
  if editTopicsForm=nil then exit;
  with editTopicsForm do begin
    speedButton1.enabled:=ed;
    speedButton2.enabled:=ed;
    speedButton3.enabled:=ed;
    speedButton4.enabled:=ed;
    speedButton5.enabled:=ed;
    speedButton6.enabled:=ed;
    speedButton7.enabled:=ed;
    speedButton8.enabled:=ed;
    speedButton9.enabled:=ed;
  end;
end;

procedure TMainForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DbfDemo.About;
end;

end.

(*
*)

