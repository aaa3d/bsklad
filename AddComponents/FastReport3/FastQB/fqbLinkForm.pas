unit fqbLinkForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfqbLinkForm = class(TForm)
    RadioOpt: TRadioGroup;
    RadioType: TRadioGroup;
    txtTable1: TStaticText;
    txtTable2: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtCol1: TStaticText;
    Label4: TLabel;
    txtCol2: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  end;

implementation

{$R *.DFM}

end.
