unit MyForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data1,b_utils, ComCtrls, ToolWin;

type
  TMy_FORM = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  My_FORM: TMy_FORM;

implementation

{$R *.DFM}

end.
