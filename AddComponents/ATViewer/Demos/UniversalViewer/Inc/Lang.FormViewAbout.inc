  Caption:= MsgCaption(410);
  btnOk.Caption:= MsgCaption(350);

  labLicense.Caption:= MsgCaption(416);

  {$ifdef PRO}
  labCaption.Caption:= labCaption.Caption + ' Pro';
  ShowRegistrationInfo(Self);
  Height:= Height - PanelCredits.Height;
  PanelCredits.Visible:= false;

  {$else}
  labCaption.Caption:= labCaption.Caption + ' Free';
  labCredits.Caption:= MsgCaption(412);
  Height:= Height - PanelReg.Height;
  PanelReg.Visible:= false;
  {$endif}
