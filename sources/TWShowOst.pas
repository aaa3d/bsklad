unit TWShowOst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, IBDatabase, Db, IBCustomDataSet, IBQuery,
  Grids, DBGrids, Data1;

type
  TTW_SHOW_OST = class(TForm)
    StatusBar1: TStatusBar;
    TW: TEdit;
    BtnTW: TSpeedButton;
    SHOP: TComboBox;
    DBGrid1: TDBGrid;
    dsList: TDataSource;
    IBList: TIBQuery;
    ListTransaction: TIBTransaction;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TW_SHOW_OST: TTW_SHOW_OST;

implementation

{$R *.DFM}

end.
