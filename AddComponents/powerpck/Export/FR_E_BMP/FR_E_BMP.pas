unit FR_E_BMP;

interface

uses Windows, FR_Class, Classes, graphics, RxGif, StdCtrls, Controls,
     ComCtrls, Forms;

type

  TfrBMPExport = class (TfrExportFilter)
  private
   FImage: TBitmap;
   FAllImage: TBitmap;
   FMinX: Integer;
   FMinY: Integer;

   procedure SaveToStream; virtual;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;

   procedure OnEndPage; override;

   procedure OnBeginDoc; override;
   procedure OnEndDoc; override;

   procedure OnData(x, y: Integer; View: TfrView); override;
  end;

  TfrGIFExport = class (TfrBMPExport)
  private
   procedure SaveToStream; override;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  end;

  TfrJPGExport = class (TfrBMPExport)
  private
   FQuality: Byte;
   procedure SaveToStream; override;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   function ShowModal: Word; override;
  published
   property Quality: Byte read FQuality write FQuality;
  end;

  TfrJPGExportForm = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    TB: TTrackBar;
    laQuality: TLabel;
    procedure TBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Localize;
  public
  end;

implementation

uses JPeg, SysUtils, FR_Utils, FR_Const;

{$R *.DFM}

constructor TfrBMPExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if ClassName = 'TfrBMPExport' then
   frRegisterExportFilter(Self, 'File BMP (*.bmp)', '*.bmp');
  FImage:=TBitmap.Create;
  FAllImage:=TBitmap.Create;
  FMinX:=-1;
  FMinY:=-1;
end;

destructor TfrBMPExport.Destroy;
begin
  FAllImage.Free;
  FImage.Free;
  frUnRegisterExportFilter(Self);
  inherited Destroy;
end;

procedure TfrBMPExport.OnData(x, y: Integer; View: TfrView);
begin
  if FMinX=-1 then
   begin
    FMinX:=X;
    FMinY:=Y;
   end
  else
   begin
    if FMinX>X then
     FMinX:=X;
    if FMinX>X then
     FMinY:=Y;
   end;

  if View.x+View.dx>FImage.Width then
   FImage.Width:=View.x+View.dx+1;
  if View.y+View.dy>FImage.Height then
   FImage.Height:=View.y+View.dy+1;

  View.Draw(FImage.Canvas);
end;

procedure TfrBMPExport.OnBeginDoc;
begin
  FMinX:=-1;
  FMinY:=-1;
end;

procedure TfrBMPExport.OnEndPage;
var Y:Integer;
begin
  Y:=FAllImage.Height;

  if FAllImage.Width<FImage.Width then
   FAllImage.Width:=FImage.Width;

  FAllImage.Height:=FAllImage.Height+FImage.Height;

  FAllImage.Canvas.Draw(0,Y,FImage);

  FImage.Width:=0;
  FImage.Height:=0;
end;

procedure TfrBMPExport.OnEndDoc;
begin
  Dec(FMinX);
  Dec(FMinY);
  if (FMinX>0) and (FMinY>0) then
   with FAllImage do
    begin
     Canvas.Draw(-FMinX,-FMinY,FAllImage);
     Width:=Width-FMinX;
     Height:=Height-FMinY;
    end;
  SaveToStream;
  FAllImage.Width:=0;
  FAllImage.Height:=0;
end;

procedure TfrBMPExport.SaveToStream;
begin
  FAllImage.SaveToStream(Stream);
end;

constructor TfrGIFExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  frRegisterExportFilter(Self, 'File GIF (*.gif)', '*.gif');
end;

destructor TfrGIFExport.Destroy;
begin
  frUnRegisterExportFilter(Self);
  inherited Destroy;
end;

procedure TfrGIFExport.SaveToStream;
var FGIFImage: TGIFImage;
begin
  FGIFImage:=TGIFImage.Create;
  try
   FGIFImage.Assign(FAllImage);
   FGIFImage.SaveToStream(Stream);
  finally
   FGIFImage.Free;
  end;
end;

constructor TfrJPGExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  frRegisterExportFilter(Self, 'File JPG (*.jpg)', '*.jpg');
  ShowDialog := True;
  FQuality:=90;
end;

destructor TfrJPGExport.Destroy;
begin
  frUnRegisterExportFilter(Self);
  inherited Destroy;
end;

function TfrJPGExport.ShowModal: Word;
begin
  if not ShowDialog then
    Result := mrOk
  else with TfrJPGExportForm.Create(nil) do
  begin
    TB.Position := FQuality;
    Result := ShowModal;
    if Result=mrOk then
     FQuality := TB.Position;
    Free;
  end;
end;

procedure TfrJPGExport.SaveToStream;
var FJPGImage: TJPEGImage;
begin
  FJPGImage:=TJPEGImage.Create;
  try
   FJPGImage.CompressionQuality:=FQuality;
   FJPGImage.Assign(FAllImage);
   FJPGImage.SaveToStream(Stream);
  finally
   FJPGImage.Free;
  end;
end;

procedure TfrJPGExportForm.TBChange(Sender: TObject);
begin
  laQuality.Caption:='Picture quality '+IntToStr(TB.Position)+'%';
end;

procedure TfrJPGExportForm.Localize;
begin
  Caption := 'Export in JPG';
  Button1.Caption := frLoadStr(SOk);
  Button2.Caption := frLoadStr(SCancel);
end;

procedure TfrJPGExportForm.FormCreate(Sender: TObject);
begin
  Localize;
end;

end.



