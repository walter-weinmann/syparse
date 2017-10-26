%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% Tests for rule: special
%%

"Contract myContract Is identifier (47++, 11--) {}".
"Contract myContract Is identifier (47++,Delete 4711) {}".
"Contract myContract Is identifier {}".
"Contract myContract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}".
"Contract myContract {Event identifier1 (Address, Bool);}".
"Contract myContract {Function () {Return [];}}".
"Contract myContract {Modifier myModifier () {Var ();}}".
"Contract myContract {Modifier myModifier {Return ();}}".
"Contract myContract {Modifier myModifier {Return [];}}".
"Contract myContract {Modifier myModifier {Var ();}}".
"Contract myContract {Using identifier For Address [];}".
"Contract myContract {}".
"Contract myContract1 {Using identifier For Address [];} Contract myContract2 {Using identifier For Address [];}".
"Import \"string1\"; Import \"string2\";".
"Import {identifier1 As identifier2, identifier2 As identifier4} From \"string\";".
"Import {identifier1, identifier2 As identifier3} From \"string\";".
"Import {identifier1, identifier2} From \"string\";".
"Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;".
