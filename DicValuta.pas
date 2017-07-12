unit DicValuta;
{ ********************************************************************
  **** Copyright 1980-1999 Britvin Sergej,                        ****
  **** Beginner(C), Yaroslavl, Russia,                            ****
  **** E-mail:  Beginner@inbox.ru                                 ****
  ****------------------------------------------------------------****
  ****  Форма "Виды валют" в программе BSKLAD                     ****
  ********************************************************************}

{ Доступ в данную форму либо полный, либо никакого, т.к. форма административная
  и "некорректное" изменение параметров влияет на всю систему в целом }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin,Data1, ExtCtrls, Grids, DBGrids, StdCtrls, Db,
  IBCustomDataSet, IBQuery,B_utils,B_DButils;

type
  TDIC_VALUTA = class(TForm)
    QrValuta: TIBQuery;
    QrValutaVALUTA_ID: TIntegerField;
    QrValutaVALUTA_SHORT: TIBStringField;
    QrValutaVALUTA_FULL: TIBStringField;
    QrValutaVALUTA_AUTO1: TIBStringField;
    QrValutaVALUTA_AUTO2: TIBStringField;
    QrValutaVALUTA_AUTO3: TIBStringField;
    DataSource1: TDataSource;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    Image2: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Caption_auto2: TLabel;
    Caption_auto: TLabel;
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BtnNEW: TToolButton;
    BtnOPEN: TToolButton;
    BtnDELETE: TToolButton;
    Image3: TImage;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure ShowCaptionAuto;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNEWClick(Sender: TObject);
    procedure BtnDELETEClick(Sender: TObject);
    procedure QrValutaAfterOpen(DataSet: TDataSet);
    procedure QrValutaAfterScroll(DataSet: TDataSet);
    procedure BtnOPENClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIC_VALUTA: TDIC_VALUTA;

implementation

uses EditValuta;

{$R *.DFM}

procedure TDIC_VALUTA.FormShow(Sender: TObject);
begin
        QrValuta.Open;
end;

procedure TDIC_VALUTA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        QrValuta.Close;
end;

procedure TDIC_VALUTA.BtnNEWClick(Sender: TObject);
begin
        application.CreateForm(TEdit_VALUTA,EDIT_VALUTA);
        EDIT_VALUTA.Tag:=-1;
        EDIT_VALUTA.showmodal;
        if EDIT_VALUTA.tag>0 then begin
                QrValuta.Close;
                QrValuta.Open;
                QrValuta.Locate('VALUTA_ID',EDIT_VALUTA.Tag,[]);
                DbGrid1.setfocus;
        end;
        EDIT_VALUTA.Destroy;
end;

procedure TDIC_VALUTA.BtnDELETEClick(Sender: TObject);
begin
        if Messbox('Удалить валюту "'+QrValuta.fieldbyname('VALUTA_FULL').asstring+'" ?',MessSubmitDelete,4+48+256)=6 then begin
                if IBDELETE_DOC('VALUTA',QrValuta.fieldbyname('VALUTA_ID').asinteger) then begin
                        QrValuta.Close;
                        QrValuta.Open;
                        DbGrid1.setfocus;
                end;
        end;
end;

procedure TDIC_VALUTA.QrValutaAfterOpen(DataSet: TDataSet);
var
        EN,En2:boolean;
begin
        EN:=QrValuta.eof;
        BtnOpen.enabled:=not EN;
        BtnDelete.enabled:=not EN;
        Caption_auto.Visible:=not EN;
        Caption_auto2.Visible:=not EN;
        if not EN then begin
                if QrValuta.fieldbyname('VALUTA_ID').asinteger=0 then EN2:=false else EN2:=true;
                BtnOpen.Enabled:=EN2;
                BtnDelete.Enabled:=EN2;
        end;
        ShowCaptionAuto;

end;

procedure TDIC_VALUTA.ShowCaptionAuto;
begin
        Caption_auto.Caption:='1 '+OKON_CHAR(QrValuta.fieldbyname('VALUTA_AUTO1').asstring,QrValuta.fieldbyname('VALUTA_AUTO2').asstring,QrValuta.fieldbyname('VALUTA_AUTO3').asstring,1)+
        '. 2,3,4 '+OKON_CHAR(QrValuta.fieldbyname('VALUTA_AUTO1').asstring,QrValuta.fieldbyname('VALUTA_AUTO2').asstring,QrValuta.fieldbyname('VALUTA_AUTO3').asstring,2)+
        '. 5,6,7 '+OKON_CHAR(QrValuta.fieldbyname('VALUTA_AUTO1').asstring,QrValuta.fieldbyname('VALUTA_AUTO2').asstring,QrValuta.fieldbyname('VALUTA_AUTO3').asstring,5);
end;

procedure TDIC_VALUTA.QrValutaAfterScroll(DataSet: TDataSet);
var
        EN:boolean;
begin
        ShowCaptionAuto;
        if QrValuta.fieldbyname('VALUTA_ID').asinteger=0 then EN:=false else EN:=true;
        BtnOpen.Enabled:=EN;
        BtnDelete.Enabled:=EN;
end;

procedure TDIC_VALUTA.BtnOPENClick(Sender: TObject);
begin
        application.CreateForm(TEdit_VALUTA,EDIT_VALUTA);
        EDIT_VALUTA.Tag:=QrValuta.fieldbyname('VALUTA_ID').asinteger;
        EDIT_VALUTA.showmodal;
        QrValuta.Close;
        QrValuta.Open;
        QrValuta.Locate('VALUTA_ID',EDIT_VALUTA.Tag,[]);
        DbGrid1.setfocus;
        EDIT_VALUTA.Destroy;
end;

procedure TDIC_VALUTA.DBGrid1DblClick(Sender: TObject);
begin
        if BtnOpen.Enabled then BtnOpen.click; 
end;

procedure TDIC_VALUTA.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
        if (Key=#13) and (BtnOpen.enabled) then BtnOpen.Click; 
end;

procedure TDIC_VALUTA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if (Key=45) and (BtnNew.enabled) then BtnNew.click;
        if (Key=46) and (BtnDELETE.enabled) then BtnDELETE.click;
end;

procedure TDIC_VALUTA.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if Key=#27 then Close;
end;

procedure TDIC_VALUTA.ToolButton2Click(Sender: TObject);
begin
     My_lock;
end;

end.
