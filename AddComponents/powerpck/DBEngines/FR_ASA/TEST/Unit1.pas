unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NdbBase, NdbAsa, Db, NdbAsaDS, FR_Class, StdCtrls,ndbapp, FR_Desgn,
  FR_DCtrl, FR_BDEDB, FR_ASADB, NdbBasDS, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    OutAsaDataset: TAsaDataset;
    MainAsaSession: TAsaSession;
    AsaSession2: TAsaSession;
    Button1: TButton;
    frReport1: TfrReport;
    frDesigner1: TfrDesigner;
    frASAComponents1: TfrASAComponents;
    frBDEComponents1: TfrBDEComponents;
    frDialogControls1: TfrDialogControls;
    Button2: TButton;
    OutAsaDatasetIDENTITY: TIntegerField;
    OutAsaDatasetDAT_K: TDateField;
    OutAsaDatasetSMEN_K: TIntegerField;
    OutAsaDatasetN_BRIG: TIntegerField;
    OutAsaDatasetK_FIOK: TIntegerField;
    OutAsaDatasetFIOK: TStringField;
    OutAsaDatasetK_FIOM: TIntegerField;
    OutAsaDatasetFIOM: TStringField;
    AsaStoredProc1: TAsaStoredProc;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
 frReport1.DesignReport;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

 if OutAsaDataset.Locate('IDENTITY;SMEN_K',VarArrayOf([4,111]),[]) then
   MessageDlg('q', mtWarning, [mbOK], 0);

end;

end.
