{*******************************************}
{                                           }
{           FastQueryBuilder 1.0            }
{                                           }
{            Copyright (c) 2005             }
{             Fast Reports Inc.             }
{                                           }
{*******************************************}

{$I fqb.inc}

unit fqbDesign;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids,
  ImgList, Buttons, DB
{$IFDEF Delphi6}
  ,Variants
{$ENDIF}
  ,fqbSynmemo, fqbClass, Menus;

type

  TfqbDesigner = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    fqbGrid1: TfqbGrid;
    fqbSyntaxMemo1: TfqbSyntaxMemo;
    fqbTableArea1: TfqbTableArea;
    fqbTableListBox1: TfqbTableListBox;
    ImageList2: TImageList;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton10: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  end;
  

var
  fqbDesigner: TfqbDesigner;

implementation

{$R *.dfm}

uses fqbUtils;

{
*********************************** TfqbDesigner ************************************
}
procedure TfqbDesigner.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := PageControl1.Pages[0];
  DataSource1.DataSet := fqbActiveEngine.ResultDataSet;
  fqbTableListBox1.Items.BeginUpdate;
  fqbTableListBox1.Items.Clear;
  fqbActiveEngine.ReadTableList(fqbTableListBox1.Items);
  fqbTableListBox1.Items.EndUpdate;
end;

procedure TfqbDesigner.TabSheet2Show(Sender: TObject);
begin
  fqbSyntaxMemo1.Lines.BeginUpdate;
  fqbSyntaxMemo1.Lines.Clear;
  fqbSyntaxMemo1.Lines.Text := fqbGenerateSQL(fqbTableArea1,fqbGrid1);
  fqbSyntaxMemo1.Lines.EndUpdate
end;

procedure TfqbDesigner.TabSheet3Show(Sender: TObject);
begin
  fqbActiveEngine.SetSQL(fqbGenerateSQL(fqbTableArea1, fqbGrid1));
end;

procedure TfqbDesigner.ToolButton10Click(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TfqbDesigner.ToolButton3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      fqbClear(Self);
      fqbLoadFromFile(fqbTableArea1, fqbGrid1, OpenDialog1.FileName);
    end;
end;

procedure TfqbDesigner.ToolButton4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    fqbSaveToFile(fqbTableArea1, fqbGrid1, SaveDialog1.FileName);
end;

procedure TfqbDesigner.ToolButton6Click(Sender: TObject);
begin
  fqbClear(Self)
end;

procedure TfqbDesigner.ToolButton7Click(Sender: TObject);
begin
  ModalResult := mrOk
end;


end.

