unit setSkladManager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup;

type
  Tset_sklad_manager = class(TForm)
    Label5: TLabel;
    PN_OWNER: TRxDBLookupCombo;
    Label6: TLabel;
    SKL: TRxDBLookupCombo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
        managerid: integer;
        manager_name: string;
        skladid: integer;
        sklad_name: string;

    { Public declarations }
  end;

var
  set_sklad_manager: Tset_sklad_manager;

implementation

{$R *.DFM}

procedure Tset_sklad_manager.Button1Click(Sender: TObject);
begin
        managerid:=strtoint( pn_owner.Value);
        manager_name:=pn_owner.Text;
        skladid:=strtoint( SKL.Value);
        sklad_name:=SKL.Text;
        self.close;
end;

end.
