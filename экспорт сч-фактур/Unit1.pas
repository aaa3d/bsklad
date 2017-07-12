unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBCustomDataSet, IBQuery, IBDatabase;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
 