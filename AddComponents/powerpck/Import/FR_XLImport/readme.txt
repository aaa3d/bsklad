The converter TfrmImpMsExcel (by Sergey Tichanovtsev) is written on a
basis TFrmImpMsWord (by Konstantin Butov).
In the common program was developed at random, documentation on
TExcellApplication for me was not, therefore, most likely, it's not the
best solution on speed, functionality etc.

Converts first WorkSheet in the indicated range of cells.
Depending on installation " To form empty cells " adds or there is
no cell with borders without contents. If in the procedure GetNextCell to
remove " Clarification NextCol " and " Search NextRow ", works fast,
but sometimes by-passes nonblank cells.

I shall be grateful for any corrections and finishings.

How to install:

To take the project from examples REPORTS to put there fr_desgn.*
To add in the project the given file, to insert "Import" to menu "file"

procedure TfrDesignerForm. Import1Click (Sender: TObject); 
begin 

  FrmImpMsExcel: = TFrmImpMsExcel. Create (self); 
  FrmImpMsExcel. ShowModal; 
  FrmImpMsExcel. Free; 
end; 

Problems: 
1. FrameTyp is defined(determined) as strange...
   If in Excel cell outlining from 4 sides, can be defined, that with 3.
   Or the border on the right and at the left confuses.
2. In the commented lines:
--- 
if (oldFrame < > GetFrameType) then    
  begin   
  NextCol: = i;                        
  break;
  end;
---
If uncomment, then work astably.

Sergey Tichanovtsev
 centr@bonus.e-burg.ru 
