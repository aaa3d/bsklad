Import from .doc-files (MS Word) to the FastReport template FRF 

Konstantin Butov (c) 2002

That's new

25.04.02 
Minor bug fixes.

07.02.02

Now registers as the wizard.

The algorithm of creation of height of cells for which height is added comes
back as 9999 (errors) 
The problem with shift of cells is partially decided(partially solved).
There is a search of new algorithms, that as it is possible more precisely
to arrange all cells..

01.01.2002
Transition to the necessary table or page in a spin edits

Is corrected:
The colour of the font (wTCell. Range. Font. ColorIndex) sometimes
accepts value wdAuto. For Word it means black.
And for cell it is necessary white

Look for whom as now is processed.

  IF wTCell. Range. HighlightColorIndex = wdAuto then
       v. FillColor: = clWhite
 ---------------------------------------------------- 

How to install:

To take the project from examples REPORTS to put there fr_desgn.*
To add in the project the given file, to insert "Import" to menu "file"

procedure TfrDesignerForm. Import1Click (Sender: TObject); 
begin 
  FrmImpMsWord: = TFrmImpMsWord. Create (self); 
  FrmImpMsWord. ShowModal; 
  FrmImpMsWord. Free; 
end; 


Konstantin Butov <kos@sp.iae.nsk.su>