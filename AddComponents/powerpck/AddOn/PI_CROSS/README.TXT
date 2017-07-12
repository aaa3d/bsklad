Advanced Cross-tab object by Pavel Ishenin <webpirat@mail.ru>


To install, just copy these files to FR\SOURCE folder and recompile the FR
package.


New properties of TfrCrossView:

- Dictionary
   Using real names instead of datafield names. Example:
   Sal+=Salary
   Days+avg=Average number of days

- MaxNameLen
  Determines max. number of chars in the header. If header is longer you'll see
  '*' char instead.

- ShowHeader
  Defines show header or not.

- ShowGrandTotal
  Defines show grand totals or not.

- DataWidth
  = -1 - standard behavior
  <> -1 - use this width for data cells

- HeaderWidth
  = -1 - standard behavior
  <> -1 - use this width for header cells
