unit ZpRunProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Data1,b_utils,b_Dbutils,VclUtils, ExtCtrls, Grids, DBGrids,
  RXDBCtrl, Db, RxMemDS;

type
  TZP_RUN_PROGRESS = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label_OK: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    MemCalcSumm: TRxMemoryData;
    MemCalcSummid: TIntegerField;
    MemCalcSummstatus: TIntegerField;
    MemCalcSummsumm: TFloatField;
    DsCalcSumm: TDataSource;
    RxDBGrid1: TRxDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_RUN_PROGRESS: TZP_RUN_PROGRESS;

implementation

{$R *.DFM}

procedure TZP_RUN_PROGRESS.Button1Click(Sender: TObject);
begin
   close;
end;

procedure TZP_RUN_PROGRESS.FormActivate(Sender: TObject);
begin
{    Label1.Font.Style:=[FsBold];
    delay(2000);
    Label1.Font.Style:=[];
    Image1.visible:=True;
    Label2.Font.Style:=[FsBold];
    delay(2000);
    Label2.Font.Style:=[];
    Image2.visible:=True;
    Label3.Font.Style:=[FsBold];
    delay(2000);
    Label3.Font.Style:=[];
    Image3.visible:=True;
    Label4.Font.Style:=[FsBold];
    delay(2000);
    Label4.Font.Style:=[];
    Image4.visible:=True;
    Label5.Font.Style:=[FsBold];
    delay(2000);
    Label5.Font.Style:=[];
    Image5.visible:=True;
    Label6.Font.Style:=[FsBold];
    delay(2000);
    Label6.Font.Style:=[];
    Image6.visible:=True;
    Label7.Font.Style:=[FsBold];
    delay(2000);
    Label7.Font.Style:=[];
    Image7.visible:=True;

    Label_Ok.visible:=True;
    Button1.caption:='Ок';}


    // Запрашиваем перечень формул, которые нужно рассчитать
    MemCalcSumm.EmptyTable;
    MemCalcSumm.Append;
    MemCalcSumm.FieldByname('ID').asinteger:=1;
    MemCalcSumm.FieldByname('status').asinteger:=0;
    MemCalcSumm.FieldByname('summ').asinteger:=0;
    MemCalcSumm.Post;
    // Производим рассчет
    while not MemCalcSumm.eof do begin
       Application.Title:='Рассчет';
       MemCalcSumm.next;
    end;
end;





end.
