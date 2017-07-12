unit FormDebug;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, RxMemDS, StdCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl;

type
  TFORM_DEBUG = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    Memo1: TMemo;
    RxMem: TRxMemoryData;
    RxMemNAME: TStringField;
    RxMemTYP: TStringField;
    RxMemVALUE: TStringField;
    DsMem: TDataSource;
    Label3: TLabel;
    Memo2: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    ExceptionMessage: ansistring;
  end;

var
  FORM_DEBUG: TFORM_DEBUG;

implementation

{$R *.DFM}

procedure TFORM_DEBUG.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=#27 then begin
       key:=#0;
       close;
     end;
end;

end.
