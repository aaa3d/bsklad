{******************************************}
{ }
{ FastReport v3.0 }
{ Designer workspace }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxDesgnWorkspace1;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, frxClass, frxDesgn, frxDesgnWorkspace
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxDesignTool = (dtSelect, dtHand, dtZoom, dtText, dtFormat);

  TDesignerWorkspace = class(TfrxDesignerWorkspace)
  private
    FDesigner:TfrxDesignerForm;
    FGuide:Integer;
    FListBox:TListBox;
    FMemo:TfrxMemoView;
    FShowGuides:Boolean;
    FTool:TfrxDesignTool;
    FSimulateMove:Boolean;
    procedure DoLBClick(Sender:TObject);
    procedure LBDrawItem(Control:TWinControl; Index:Integer;
      ARect:TRect; State:TOwnerDrawState);
    procedure SetShowGuides(const Value:Boolean);
    procedure SetHGuides(const Value:TStrings);
    procedure SetVGuides(const Value:TStrings);
    function GetHGuides:TStrings;
    function GetVGuides:TStrings;
    property HGuides:TStrings read GetHGuides write SetHGuides;
    property VGuides:TStrings read GetVGuides write SetVGuides;
    procedure SetTool(const Value:TfrxDesignTool);
  protected
    procedure CheckGuides(var kx, ky:Extended; var Result:Boolean); override;
    procedure DragOver(Source:TObject; X, Y:Integer; State:TDragState;
      var Accept:Boolean); override;
    procedure DrawObjects; override;
    procedure KeyDown(var Key:Word; Shift:TShiftState); override;
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
    procedure MouseMove(Shift:TShiftState; X, Y:Integer); override;
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState;
      X, Y:Integer); override;
    procedure DblClick; override;
  public
    constructor Create(AOwner:TComponent); override;
    procedure DeleteObjects; override;
    procedure DragDrop(Source:TObject; X, Y:Integer); override;
    procedure SimulateMove;
    property ShowGuides:Boolean read FShowGuides write SetShowGuides;
    property Tool:TfrxDesignTool read FTool write SetTool;
  end;

implementation

uses
  ComCtrls, frxDesgnCtrls, frxUtils, frxDataTree, frxDMPClass, frxRes;

{ TDesignerWorkspace }

constructor TDesignerWorkspace.Create(AOwner:TComponent);
begin
  inherited;
  FDesigner:= TfrxDesignerForm(AOwner);

  FListBox:= TListBox.Create(Self);
  with FListBox do
  begin
    Parent:= Self;
    Visible:= False;
    Style:= lbOwnerDrawFixed;
    ItemHeight:= 16;
    OnClick:= DoLBClick;
    OnDrawItem:= LBDrawItem;
  end;
end;

procedure TDesignerWorkspace.DeleteObjects;
var
  i:Integer;
  NeedReload:Boolean;
begin
  NeedReload:= False;
  for i:= 0 to FSelectedObjects.Count-1 do
    if TObject(FSelectedObjects[i]) is TfrxSubreport then
      NeedReload:= True;

  FMemo:= nil;
  inherited;

  if NeedReload then
    FDesigner.ReloadPages(FDesigner.Report.Objects.IndexOf(Page));
end;

procedure TDesignerWorkspace.DrawObjects;
var
  r:TRect;
  i, d:Integer;
begin
  if FDesigner.Page is TfrxReportPage then
    with TfrxReportPage(FDesigner.Page) do
      if Columns > 1 then
        for i:= 0 to Columns-1 do
        begin
          d:= Round(frxStrToFloat(ColumnPositions[i]) * fr01cm * FScale);
          if d = 0 then continue;
          FCanvas.Pen.Color:= clSilver;
          FCanvas.MoveTo(d, 0);
          FCanvas.LineTo(d, Self.Height);
        end;

  if FShowGuides and (FPage is TfrxReportPage) then
  begin
    with FCanvas do
    begin
      Pen.Width:= 1;
      Pen.Style:= psSolid;
      Pen.Color:= $FFCC00;
      Pen.Mode:= pmCopy;
    end;

    for i:= 0 to HGuides.Count-1 do
    begin
      d:= Round(frxStrToFloat(HGuides[i]) * Scale);
      FCanvas.MoveTo(0, d);
      FCanvas.LineTo(Width, d);
    end;

    for i:= 0 to VGuides.Count-1 do
    begin
      d:= Round(frxStrToFloat(VGuides[i]) * Scale);
      FCanvas.MoveTo(d, 0);
      FCanvas.LineTo(d, Height);
    end;
  end;

  inherited;

  if (FMemo<>nil) and FDesigner.DropFields then
    with FCanvas do
    begin
      r.TopLeft:= Point(Round((FMemo.Left+FMemo.Width) * FScale)-16,
                         Round((FMemo.AbsTop) * FScale)+2);
      r.BottomRight:= Point(r.Left+16, r.Top+16);
      DrawButtonFace(FCanvas, r, 1, bsNew, False, False, False);

      Brush.Color:= clBlack;
      Brush.Style:= bsSolid;
      Pen.Color:= clBlack;
      Pen.Style:= psSolid;
      FCanvas.Polygon([Point(r.Left+4, r.Top+6), Point(r.Left+7, r.Top+9),
        Point(r.Left+10, r.Top+6), Point(r.Left+4, r.Top+6)]);
    end;

end;

procedure TDesignerWorkspace.DragOver(Source:TObject; X, Y:Integer;
  State:TDragState; var Accept:Boolean);
var
  ds:TfrxDataset;
  s, fld:String;
  w:Integer;
begin
  Accept:= (((Source is TTreeView) and
    (TTreeView(Source).Owner = FDesigner.DataTree) and
    (FDesigner.DataTree.GetFieldName<>'')) or
    (Source is TfrxRuler)) and (FDesigner.Page is TfrxReportPage);
  if not Accept then Exit;

  if Source is TfrxRuler then
    with Canvas do
    begin
      Pen.Width:= 1;
      Pen.Style:= psSolid;
      Pen.Color:= clBlack;
      Repaint;

      if GridAlign then
      begin
        X:= Round(Trunc(X / (GridX * Scale)) * GridX * Scale);
        Y:= Round(Trunc(Y / (GridY * Scale)) * GridY * Scale);
      end;

      if TfrxRuler(Source).Align = alLeft then
      begin
        MoveTo(X, 0);
        LineTo(X, Height);
      end
      else
      begin
        MoveTo(0, Y);
        LineTo(Width, Y);
      end;

      MouseMove([], X, Y);
    end
  else
  begin
    if (FInsertion.ComponentClass = nil) and
      (FDesigner.DataTree.InsFieldCB.Checked or
      FDesigner.DataTree.InsCaptionCB.Checked or
      not FDesigner.DataTree.IsDataField) then
    begin
      s:= FDesigner.DataTree.GetFieldName;
      s:= Copy(s, 2, Length(s)-2);
      FDesigner.Report.GetDatasetAndField(s, ds, fld);
      try
        if (ds<>nil) and (fld<>'') then
          w:= ds.DisplayWidth[fld] else
          w:= 10;
      except
        w:= 10;
      end;

      SetInsertion(TfrxMemoView, Round(w * 8 / GridX) * GridX,
        FDesigner.GetDefaultObjectSize.Y, 0);
    end;

    MouseMove([], X-8, Y-8);
  end;
end;

procedure TDesignerWorkspace.DragDrop(Source:TObject; X, Y:Integer);
var
  eX, eY:Extended;
  m:TfrxCustomMemoView;
  ds:TfrxDataset;
  s, fld:String;

  function Round8(e:Extended):Extended;
  begin
    Result:= Round(e * 100000000) / 100000000;
  end;

begin
  if (Source is TfrxRuler) and (FPage is TfrxReportPage) then
  begin
    if GridAlign then
    begin
      eX:= Trunc(X / Scale / GridX) * GridX;
      eY:= Trunc(Y / Scale / GridY) * GridY;
    end
    else
    begin
      eX:= X / Scale;
      eY:= Y / Scale;
    end;

    eX:= Round8(eX);
    eY:= Round8(eY);

    if TfrxRuler(Source).Align = alLeft then
      VGuides.Add(FloatToStr(eX)) else
      HGuides.Add(FloatToStr(eY));
  end
  else if FDesigner.DataTree.InsFieldCB.Checked or
    FDesigner.DataTree.InsCaptionCB.Checked or
    not FDesigner.DataTree.IsDataField then
  begin
    FSelectedObjects.Clear;

    if Page is TfrxDMPPage then
      m:= TfrxDMPMemoView.Create(Page) else
      m:= TfrxMemoView.Create(Page);
    m.CreateUniqueName;
    m.IsDesigning:= True;
    s:= FDesigner.DataTree.GetFieldName;
    s:= Copy(s, 2, Length(s)-2);
    FDesigner.Report.GetDataSetAndField(s, ds, fld);

    if not FDesigner.DataTree.IsDataField or FDesigner.DataTree.InsFieldCB.Checked then
    begin
      m.DataSet:= ds;
      m.DataField:= fld;
      if (ds = nil) and (fld = '') then
      begin
        if Pos('<', FDesigner.DataTree.GetFieldName) = 1 then
          m.Text:= '['+s+']' else
          m.Text:= '['+FDesigner.DataTree.GetFieldName+']';
      end;
      m.SetBounds(Round8(FInsertion.Left), Round8(FInsertion.Top),
        Round8(FInsertion.Width), Round8(FInsertion.Height));
      FDesigner.SampleFormat.ApplySample(m);
      FObjects.Add(m);
      FSelectedObjects.Add(m);
      FInsertion.Top:= FInsertion.Top-FInsertion.Height;
    end
    else
      m.Free;
    if FDesigner.DataTree.IsDataField and FDesigner.DataTree.InsCaptionCB.Checked then
    begin
      if Page is TfrxDMPPage then
        m:= TfrxDMPMemoView.Create(Page) else
        m:= TfrxMemoView.Create(Page);
      m.CreateUniqueName;
      m.IsDesigning:= True;
      m.Text:= fld;
      m.SetBounds(Round8(FInsertion.Left), Round8(FInsertion.Top),
        Round8(FInsertion.Width), Round8(FInsertion.Height));
      FDesigner.SampleFormat.ApplySample(m);
      FObjects.Add(m);
      FSelectedObjects.Add(m);
    end;

    SetInsertion(nil, 0, 0, 0);
  end;

  FModifyFlag:= True;
  MouseUp(mbLeft, [], X, Y);
  SelectionChanged;
end;

procedure TDesignerWorkspace.MouseDown(Button:TMouseButton; Shift:TShiftState;
  X, Y:Integer);
var
  ds:TfrxDataset;
  r:TRect;

  function Contain(c:TfrxComponent):Boolean;
  begin
    Result:= (X / FScale >= c.Left+c.Width-16) and (X / FScale <= c.Left+c.Width) and
      (Y / FScale >= c.AbsTop) and (Y / FScale <= c.AbsTop+16);
  end;

begin
  if FDisableUpdate then Exit;
  if FListBox.Visible then
    FListBox.Hide;

  if FTool = dtHand then
  begin
    FMode1:= dmNone;
    FMouseDown:= True;
    FLastMousePointX:= X;
    FLastMousePointY:= Y;
    Exit;
  end
  else if FTool in [dtZoom, dtText] then
  begin
    FMode1:= dmSelectionRect;
    FSelectionRect:= frxRect(X, Y, X, Y);
  end
  else if FTool = dtFormat then
  begin
    FMode1:= dmNone;
    Exit;
  end;

  if (FMode = dmSelect) and (FMemo<>nil) and Contain(FMemo) and FDesigner.DropFields then
  begin
    with FListBox do
    begin
      Ctl3D:= False;
      r.Top:= Round(FMemo.AbsTop * FScale)+18;
      r.Right:= Round((FMemo.Left+FMemo.Width) * FScale);
      r.Left:= r.Right-140;
      r.Bottom:= r.Top+162;

      if r.Left < 0 then
      begin
        Inc(r.Right,-r.Left);
        r.Left:= 0;
      end;

      BoundsRect:= r;

      ds:= TfrxDataBand(FMemo.Parent).Dataset;
      if ds<>nil then
      begin
        ds.GetFieldList(Items);
        ItemIndex:= Items.IndexOf(FMemo.DataField);
        Show;
      end;
    end;

    FMode1:= dmNone;
    FMouseDown:= False;
    Exit;
  end;

  if not ((FTool = dtZoom) and (Button = mbRight)) then
    inherited;
end;

procedure TDesignerWorkspace.MouseMove(Shift:TShiftState; X, Y:Integer);
var
  i, px, py:Integer;
  c, cOver:TfrxComponent;
  ds:TfrxDataset;
  e, kx, ky:Extended;

  function Contain(c:TfrxComponent):Boolean;
  begin
    Result:= (X / FScale >= c.Left) and (X / FScale <= c.Left+c.Width-4) and
      (Y / FScale >= c.AbsTop) and (Y / FScale <= c.AbsTop+c.Height);
  end;

  function GridCheck:Boolean;
  begin
    Result:= (kx >= GridX) or (kx <=-GridX) or
              (ky >= GridY) or (ky <=-GridY);
    if Result then
    begin
      kx:= Trunc(kx / GridX) * GridX;
      ky:= Trunc(ky / GridY) * GridY;
    end;
  end;

begin
  if FDisableUpdate then Exit;
  inherited;

  if FTool = dtHand then
  begin
    Cursor:= crHand;

    if FMouseDown then
    begin
      kx:= X-FLastMousePointX;
      ky:= Y-FLastMousePointY;

      if Parent is TScrollingWinControl then
        with TScrollingWinControl(Parent) do
        begin
          px:= HorzScrollBar.Position;
          py:= VertScrollBar.Position;
          HorzScrollBar.Position:= px-Round(kx);
          VertScrollBar.Position:= py-Round(ky);
          if HorzScrollBar.Position = px then
            FLastMousePointX:= X;
          if VertScrollBar.Position = py then
            FLastMousePointY:= Y;
        end;
    end;
  end
  else if FTool = dtZoom then
    Cursor:= crZoom
  else if FTool = dtText then
    Cursor:= crIBeam
  else if FTool = dtFormat then
    Cursor:= crFormat;

  if not FMouseDown and (FMode = dmSelect) and
    ((FMode1 = dmNone) or (FMode1 = dmMoveGuide)) and not FListBox.Visible then
  begin
    if FPage is TfrxReportPage then
    begin
      for i:= 0 to HGuides.Count-1 do
      begin
        e:= frxStrToFloat(HGuides[i]);
        if (Y / Scale > e-5) and (Y / Scale < e+5) then
        begin
          FMode1:= dmMoveGuide;
          Cursor:= crVSplit;
          FGuide:= i;
        end;
      end;

      for i:= 0 to VGuides.Count-1 do
      begin
        e:= frxStrToFloat(VGuides[i]);
        if (X / Scale > e-5) and (X / Scale < e+5) then
        begin
          FMode1:= dmMoveGuide;
          Cursor:= crHSplit;
          FGuide:= i;
        end;
      end;
    end;

    if FMode1 = dmNone then
    begin
      cOver:= nil;
      for i:= FObjects.Count-1 downto 0 do
      begin
        c:= FObjects[i];
        if (c is TfrxMemoView) and Contain(c) and
           (c.Parent is TfrxDataBand) and
           (TfrxDataBand(c.Parent).Dataset<>nil) and
           (TfrxDataBand(c.Parent).Dataset.FieldsCount > 0) then
        begin
          ds:= TfrxDataBand(c.Parent).Dataset;
          if ds<>nil then
            cOver:= c;
          break;
        end;
      end;

      if FMemo<>cOver then
      begin
        FMemo:= TfrxMemoView(cOver);
        Repaint;
      end;
    end;
  end;

// moving the guideline
  if FMouseDown and (FMode1 = dmMoveGuide) then
  begin
    if Cursor = crHSplit then
    begin
      e:= frxStrToFloat(VGuides[FGuide]);
      kx:= X / Scale-FLastMousePointX;
      ky:= 0;

      if not (GridAlign and not GridCheck) then
      begin
        FModifyFlag:= True;
        e:= Round((e+kx) * 100000000) / 100000000;
        FLastMousePointX:= FLastMousePointX+kx;
      end;

      VGuides[FGuide]:= FloatToStr(e);
    end
    else
    begin
      e:= frxStrToFloat(HGuides[FGuide]);
      kx:= 0;
      ky:= Y / Scale-FLastMousePointY;

      if not (GridAlign and not GridCheck) then
      begin
        FModifyFlag:= True;
        e:= Round((e+ky) * 100000000) / 100000000;
        FLastMousePointY:= FLastMousePointY+ky;
      end;

      HGuides[FGuide]:= FloatToStr(e);
    end;

    Repaint;
  end;
end;

procedure TDesignerWorkspace.MouseUp(Button:TMouseButton;
  Shift:TShiftState; X, Y:Integer);
var
  i:Integer;
  e:Extended;
  c:TfrxComponent;

  function Contain(c:TfrxComponent):Boolean;
  begin
    with FSelectionRect do
      Result:= not ((c.Left > Right / FScale) or
                     (c.Left+c.Width < Left / FScale) or
                     (c.AbsTop > Bottom / FScale) or
                     (c.AbsTop+c.Height < Top / FScale));
  end;

  procedure CopyFormat(MemoFrom, MemoTo:TfrxMemoView);
  begin
    MemoTo.Color:= MemoFrom.Color;
    MemoTo.Font:= MemoFrom.Font;
    MemoTo.Frame.Assign(MemoFrom.Frame);
    MemoTo.BrushStyle:= MemoFrom.BrushStyle;
    MemoTo.HAlign:= MemoFrom.HAlign;
    MemoTo.VAlign:= MemoFrom.VAlign;
  end;

begin
  if FDisableUpdate then Exit;
  FSimulateMove:= False;

  if FTool = dtZoom then
  begin
    FMode1:= dmNone;
    NormalizeRect(FSelectionRect);

    with FSelectionRect do
      if (Right-Left > 5) and (Bottom-Top > 5) then
      begin
        e:= Scale;

        if (Right-Left) / (Parent.ClientWidth-16) <
           (Bottom-Top) / (Parent.ClientHeight-16) then
          FDesigner.Scale:= (Parent.ClientHeight-16) / (Bottom-Top) * Scale else
          FDesigner.Scale:= (Parent.ClientWidth-16) / (Right-Left) * Scale;

        if Parent is TScrollingWinControl then
          with TScrollingWinControl(Parent) do
          begin
            HorzScrollBar.Position:= Round((FSelectionRect.Left / e+
              TfrxReportPage(FDesigner.Page).LeftMargin * fr01cm) * Scale);
            VertScrollBar.Position:= Round((FSelectionRect.Top / e+
              TfrxReportPage(FDesigner.Page).TopMargin * fr01cm) * Scale);
          end;
      end
      else
      begin
        e:= Scale;
        if Button = mbLeft then
        begin
          if FDesigner.Scale >= 1 then
            FDesigner.Scale:= FDesigner.Scale+1
          else
            FDesigner.Scale:= FDesigner.Scale+0.25
        end
        else
        begin
          if FDesigner.Scale >= 2 then
            FDesigner.Scale:= FDesigner.Scale-1
          else if FDesigner.Scale > 0.4 then
            FDesigner.Scale:= FDesigner.Scale-0.25
        end;
        if Parent is TScrollingWinControl then
          with TScrollingWinControl(Parent) do
          begin
            HorzScrollBar.Position:= Round((FSelectionRect.Left / e+
              TfrxReportPage(FDesigner.Page).LeftMargin * fr01cm) * Scale-
              ClientWidth / 2);
            VertScrollBar.Position:= Round((FSelectionRect.Top / e+
              TfrxReportPage(FDesigner.Page).TopMargin * fr01cm) * Scale-
              ClientHeight / 2);
          end;
      end;
  end

  else if (FTool = dtText) and FMouseDown then
  begin
    FMode1:= dmNone;
    FMouseDown:= False;
    NormalizeRect(FSelectionRect);

    if FInplaceObject<>nil then
      TInplaceMemo(FInplaceMemo).EditDone;

    FInplaceObject:= nil;

    with FSelectionRect do
      if (Right-Left < 5) or (Bottom-Top < 5) then
      begin
        for i:= 0 to FObjects.Count-1 do
        begin
          c:= FObjects[i];
          if (c is TfrxCustomMemoView) and Contain(c) then
            FInplaceObject:= TfrxMemoView(c);
        end;
      end
      else
      begin
        if GridAlign then
        begin
          Left:= Trunc(Left / GridX) * GridX;
          Right:= Trunc(Right / GridX) * GridX;
          Top:= Trunc(Top / GridY) * GridY;
          Bottom:= Trunc(Bottom / GridY) * GridY;
        end;

        FInsertion.Left:= Left / FScale;
        FInsertion.Top:= Top / FScale;
        FInsertion.Width:= (Right-Left) / FScale;
        FInsertion.Height:= (Bottom-Top) / FScale;
        if Page is TfrxDMPPage then
          FInsertion.ComponentClass:= TfrxDMPMemoView else
          FInsertion.ComponentClass:= TfrxMemoView;

        if Assigned(FOnInsert) then
          FOnInsert(Self);
        AdjustBands;

        if TObject(FSelectedObjects[0]) is TfrxCustomMemoView then
          FInplaceObject:= FSelectedObjects[0];
      end;

    if FInplaceObject<>nil then
    begin
      FSelectedObjects.Clear;
      FSelectedObjects.Add(FInplaceObject);
      SelectionChanged;
      TInplaceMemo(FInplaceMemo).Edit(FInplaceObject);
    end;

    Exit;
  end
  else if FTool = dtFormat then
  begin
    FSelectionRect:= frxRect(X, Y, X+1, Y+1);
    for i:= FObjects.Count-1 downto 0 do
    begin
      c:= FObjects[i];
      if (c is TfrxMemoView) and Contain(c) and not
         (rfDontModify in c.Restrictions) and (c<>FSelectedObjects[0]) then
      begin
        CopyFormat(TfrxMemoView(FSelectedObjects[0]), TfrxMemoView(c));
        FModifyFlag:= True;
        break;
      end;
    end;
  end;

  if FMode1 = dmMoveGuide then
  begin
    if Cursor = crHSplit then
    begin
      e:= frxStrToFloat(VGuides[FGuide]);
      if (e < 3) or (e > (Width / Scale)-3) then
        VGuides.Delete(FGuide);
    end
    else
    begin
      e:= frxStrToFloat(HGuides[FGuide]);
      if (e < 3) or (e > (Height / Scale)-3) then
        HGuides.Delete(FGuide);
    end;

    Repaint;
  end;

  inherited;
end;

procedure TDesignerWorkspace.DblClick;
begin
  if FTool = dtSelect then
    inherited;
end;

procedure TDesignerWorkspace.KeyDown(var Key:Word; Shift:TShiftState);
begin
  if (Key = VK_ESCAPE) and FSimulateMove then
  begin
    Key:= VK_DELETE;
    MouseUp(mbLeft, [], 0, 0);
  end;
  inherited;
end;

procedure TDesignerWorkspace.SimulateMove;
var
  r:TfrxRect;
begin
  FMode1:= dmMove;
  r:= GetSelectionBounds;
  MouseDown(mbLeft, [], Round(r.Left / Scale)+20, Round(r.Top / Scale)+20);
  FSimulateMove:= True;
end;

procedure TDesignerWorkspace.DoLBClick(Sender:TObject);
begin
  if FMemo<>nil then
  begin
    FMemo.DataSet:= TfrxDataBand(FMemo.Parent).Dataset;
    FMemo.DataField:= FListBox.Items[FListBox.ItemIndex];
  end;
  FListBox.Hide;

  FModifyFlag:= True;
  DoModify;
end;

procedure TDesignerWorkspace.LBDrawItem(Control:TWinControl; Index:Integer;
  ARect:TRect; State:TOwnerDrawState);
begin
  with FListBox do
  begin
    Canvas.FillRect(ARect);
    frxResources.MainButtonImages.Draw(Canvas, ARect.Left, ARect.Top, 54);
    Canvas.TextOut(ARect.Left+20, ARect.Top+1, Items[Index]);
  end;
end;

procedure TDesignerWorkspace.CheckGuides(var kx, ky:Extended;
  var Result:Boolean);
var
  i:Integer;
  c:TfrxComponent;

  procedure CheckH(coord:Extended);
  var
    i:Integer;
    e:Extended;
  begin
    for i:= 0 to HGuides.Count-1 do
    begin
      e:= frxStrToFloat(HGuides[i]);
      if Abs(coord+ky-e) < 6 then
      begin
        ky:= e-coord;
        break;
      end;
    end;
  end;

  procedure CheckV(coord:Extended);
  var
    i:Integer;
    e:Extended;
  begin
    for i:= 0 to VGuides.Count-1 do
    begin
      e:= frxStrToFloat(VGuides[i]);
      if Abs(coord+kx-e) < 6 then
      begin
        kx:= e-coord;
        break;
      end;
    end;
  end;

begin
  if not (FPage is TfrxReportPage) or not FShowGuides then Exit;

  if FMouseDown and (FMode1 = dmSizeBand) then
    CheckH(FSizedBand.Top+FSizedBand.Height);

  if not FMouseDown and ((FMode1 = dmInsertObject) or (FMode1 = dmInsertLine)) then
  begin
    CheckV(FInsertion.Left);
    CheckH(FInsertion.Top);
    CheckV(FInsertion.Left+FInsertion.Width);
    CheckH(FInsertion.Top+FInsertion.Height);
  end;

  if FMouseDown and ((FMode1 = dmInsertObject) or (FMode1 = dmInsertLine)) then
  begin
    CheckV(FInsertion.Left);
    CheckH(FInsertion.Top);
  end;

  if FMouseDown and (FMode1 = dmMove) then
    for i:= 0 to SelectedCount-1 do
    begin
      c:= FSelectedObjects[i];
      CheckV(c.Left);
      CheckH(c.AbsTop);
      CheckH(c.Top);
      CheckV(c.Left+c.Width);
      CheckH(c.AbsTop+c.Height);
    end;

  if FMouseDown and (FMode1 = dmSize) then
  begin
    c:= FSelectedObjects[0];
    if FCT in [ct1, ct6, ct4] then
      CheckV(c.Left);
    if FCT in [ct1, ct7, ct3] then
      CheckH(c.AbsTop);
    if FCT in [ct3, ct5, ct2] then
      CheckV(c.Left+c.Width);
    if FCT in [ct4, ct8, ct2] then
      CheckH(c.AbsTop+c.Height);
  end;
end;

procedure TDesignerWorkspace.SetShowGuides(const Value:Boolean);
begin
  FShowGuides:= Value;
  Invalidate;
end;

function TDesignerWorkspace.GetHGuides:TStrings;
begin
  Result:= TfrxReportPage(FPage).HGuides;
end;

function TDesignerWorkspace.GetVGuides:TStrings;
begin
  Result:= TfrxReportPage(FPage).VGuides;
end;

procedure TDesignerWorkspace.SetHGuides(const Value:TStrings);
begin
  TfrxReportPage(FPage).HGuides:= Value;
end;

procedure TDesignerWorkspace.SetVGuides(const Value:TStrings);
begin
  TfrxReportPage(FPage).VGuides:= Value;
end;

procedure TDesignerWorkspace.SetTool(const Value:TfrxDesignTool);
begin
  FTool:= Value;
end;

end.
