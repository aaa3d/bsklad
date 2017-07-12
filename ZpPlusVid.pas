unit ZpPlusVid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ZpTitle;

type
  TZP_PLUS_VID = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Check_oklad: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZP_PLUS_VID: TZP_PLUS_VID;

implementation

uses ZpPlusSposob;

{$R *.DFM}

procedure TZP_PLUS_VID.Button1Click(Sender: TObject);
begin
     if check_oklad.checked then begin
        Application.createForm(TZP_PLUS_SPOSOB,ZP_PLUS_SPOSOB);
        Application.createForm(TZP_TITLE,ZP_TITLE);
        ZP_PLUS_SPOSOB.showModal;
        if ZP_PLUS_SPOSOB.tag>0 then begin
          ZP_TITLE.showModal;
          if ZP_TITLE.tag>0 then begin
             // Сохраняем начисление
             close;
          end;
        end;
        ZP_PLUS_SPOSOB.destroy;
        ZP_TITLE.destroy;
     end;
end;

end.
