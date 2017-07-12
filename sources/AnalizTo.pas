unit AnalizTo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, StdCtrls, Grids, DBGrids, RXDBCtrl,B_utils,B_DButils,Data1;

type
  TAnaliz_TO = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    MemAnaliz: TRxMemoryData;
    MemAnalizTYP: TIntegerField;
    MemAnalizID: TIntegerField;
    MemAnalizNAME: TStringField;
    DsAnaliz: TDataSource;
    RxDBGrid1: TRxDBGrid;
    MemAnalizTYP_FULL: TStringField;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Analiz_TO: TAnaliz_TO;

implementation

{$R *.DFM}

procedure TAnaliz_TO.Button2Click(Sender: TObject);
begin
     close;
end;

procedure TAnaliz_TO.FormShow(Sender: TObject);
begin
     tag:=0;
end;

procedure TAnaliz_TO.Button1Click(Sender: TObject);
begin
     Tag:=memAnaliz.fieldByname('ID').asinteger;
     RxDbgrid1.tag:=memAnaliz.fieldByname('TYP').asinteger;
     close;
end;

end.
