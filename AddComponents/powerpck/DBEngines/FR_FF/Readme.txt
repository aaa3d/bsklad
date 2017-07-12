This package adds support for TurboPower's
FlashFiler engine in FastReport's data manager.

Modified from the wizard output by Eivind
Bakkestuen (Eivind.Bakkestuen@tpx.turbopower.com).


Build and install the package into Delphi.
Drop a TfrFFComponents component beside the
TfrReport component and you should get access
to FlashFiler components inside the FR designer.


To make a "datamodule" inside a FR report, use the
"Edit | Add dialog form" menu command in the report
designer. Place Query and Table components from the 
toolbar onto the form and set properties (just like
in Delphi).


This code is released as-is, with no guarantee
that it will actually do anything useful. Please
report any problems, etc to the TurboPower FlashFiler 
Third-party newsgroup.



PLEASE OBSERVE:

I do not recommend that you use the FR Database component in
any of your reports. It currently uses the default Session
([automatic]) only. Instead use the new SessionName property
of the Table and Query components directly, this allows you
to connect to any session component within your application.

Sometime in the future the Database component will be changed
and FR components will be added corresponding to FFClient,
FFServerEngines etc. However I currently have no need for this
so if you really need it now, you are welcome to add support
for it and notify me about the update. :-)



Version history:

0.6

- Added Delphi 7 package
- Changed package names to be a bit more descriptive
- Changed the copyright messages in the source code units 
  to properly reflect the creator.


0.5

- The Delphi 5 .dpk file now has the proper delphi packages in its 
  requires list. Thanks to Thomas Holth for providing the corrected file.
- removed doubled SessionName property on the query component
- added checks for assigned Session property to fix problem with
  clicking components with unknown session


0.4 - 14.mars.2002

Added Timeout property


0.3 - 11.oct.2001

Added support for Delphi 6


0.2 - 08.apr.2001

-Added SessionName property to the Query and Table component
-Fixed the list of aliases in DatabaseName to include aliases
 from any ffDatabase.DatabaseName properties (before was just 
 server aliases)


0.1 - Initial release 21.feb.2001
