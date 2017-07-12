unit UsWorkForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery,
  Data1, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, IBDatabase,B_utils,B_DButils;

type
  TUsWork_FORM = class(TForm)
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    Image2: TImage;
    IBQuery1US_FIO: TStringField;
    DataSource1: TDataSource;
    Timer1: TTimer;
    IBQuery1USWORK_ID: TIntegerField;
    IBQuery1KLN_FAM: TIBStringField;
    IBQuery1KLN_NAME: TIBStringField;
    IBQuery1KLN_NAME2: TIBStringField;
    IBQuery1USWORK_DT: TDateTimeField;
    IBQuery1USWORK_STAT: TIBStringField;
    IBQuery1USWORK_COMPUTER: TIBStringField;
    procedure IBQuery1CalcFields(DataSet: TDataSet);
    procedure REFRESH_QUERY;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsWork_FORM: TUsWork_FORM;

implementation

{$R *.DFM}

procedure TUsWork_FORM.REFRESH_QUERY;
begin
     IBQuery1.DisableControls;
     IbTransaction1.Active:=False;
     IBQuery1.close;
     IBQuery1.open;
     IBQuery1.EnableControls;
     IBQuery1.Locate('USWORK_ID',USWORK_ID,[]);
end;

procedure TUsWork_FORM.IBQuery1CalcFields(DataSet: TDataSet);
begin
     IBQuery1.fieldbyname('US_FIO').asstring:=
     IBQuery1.fieldbyname('KLN_FAM').asstring+' '+
     B_utils.left(IBQuery1.fieldbyname('KLN_NAME').asstring,1)+'. '+
     B_utils.left(IBQuery1.fieldbyname('KLN_NAME2').asstring,1)+'.';

end;

procedure TUsWork_FORM.FormShow(Sender: TObject);
begin
     REFRESH_QUERY;
     TImer1.Enabled:=true;
end;

procedure TUsWork_FORM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IbTransaction1.Active:=False;
     Timer1.enabled:=false;
     IBQuery1.close;
end;

procedure TUsWork_FORM.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if key=#27 then begin
           Repeat
           until Timer1.enabled;
           Close;
        end;
end;

procedure TUsWork_FORM.Timer1Timer(Sender: TObject);
begin
   Try
     Timer1.Enabled:=False;
     REFRESH_QUERY;
     Timer1.Enabled:=True;
   Except
   End;
end;

end.
