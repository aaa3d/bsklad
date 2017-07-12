// Uncomment this if you want to use the modified version of OQBuilder.
// with the State property.
//
//{$DEFINE NORMALVERSION}


// Uncomment this if you want to save or restore OQBuilder state information
// in your query component.
{$DEFINE STATEINFORMATION}

(* Put this at the end of your implementation of ReadTableList and of SelectDatabase
  {$IFDEF STATEINFORMATION}
  RestoreFromState;
  {$ENDIF}
*)

//---------------------------------------
{$IFDEF NORMALVERSION}
   {$UNDEF STATEINFORMATION}
{$ENDIF}   
