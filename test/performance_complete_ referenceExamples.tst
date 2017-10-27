%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% Tests for rule: referenceExamples
%%

"
pragma solidity ^0.4.0;

contract Complex {
   struct Data {
       uint a;
       bytes3 b;
       mapping (uint => uint) map;
   }
   mapping (uint => mapping(bool => Data[])) public data;
}
".
"
pragma solidity ^0.4.11;

interface Token {
   function transfer(address recipient, uint amount);
}
".
