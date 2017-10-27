%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% Tests for rule: special
%%

"Contract my_contract Is identifier (47++, 11--) {}".
"Contract my_contract Is identifier (47++,Delete 4711) {}".
"Contract my_contract Is identifier {}".
"Contract my_contract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}".
"Contract my_contract {Event identifier1 (Address, Bool);}".
"Contract my_contract {Function () {Return [];}}".
"Contract my_contract {Modifier my_modifier () {Var ();}}".
"Contract my_contract {Modifier my_modifier {Return ();}}".
"Contract my_contract {Modifier my_modifier {Return [];}}".
"Contract my_contract {Modifier my_modifier {Var ();}}".
"Contract my_contract {Using identifier For Address [];}".
"Contract my_contract {}".
"Contract my_contract1 {Using identifier For Address [];} Contract my_contract2 {Using identifier For Address [];}".
"Import \"string1\"; Import \"string2\";".
"Import {identifier1 As identifier2, identifier2 As identifier4} From \"string\";".
"Import {identifier1, identifier2 As identifier3} From \"string\";".
"Import {identifier1, identifier2} From \"string\";".
"Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;".
