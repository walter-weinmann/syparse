%%%-------------------------------------------------------------------
%%% File        : performance_complete_compacted_referenceExamples_SUITE.erl
%%% Description : Test Suite for rule: referenceExamples.
%%%
%%% Created     : 27.10.2017
%%%-------------------------------------------------------------------
-module(performance_complete_compacted_referenceExamples_SUITE).

-export([
    all/0,
    end_per_suite/1,
    init_per_suite/1,
    suite/0,
    test_compacted/1
]).

-include_lib("common_test/include/ct.hrl").
-include_lib("eunit/include/eunit.hrl").

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - SUITE
%%--------------------------------------------------------------------

suite() ->
    [
        {timetrap, {minutes, 10}}
    ].

init_per_suite(Config) ->
    Config.

end_per_suite(_Config) ->
    ok.

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - ALL
%%--------------------------------------------------------------------

all() ->
    [
        test_compacted
    ].

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

test_compacted(_Config) ->
    {ok, _} = syparse:source_to_pt("
pragma solidity ^0.4.0;

contract Complex {
   struct Data {
       uint a;
       bytes3 b;
       mapping (uint => uint) map;
   }
   mapping (uint => mapping(bool => Data[])) public data;
}
"),
    {ok, _} = syparse:source_to_pt("
pragma solidity ^0.4.11;

interface Token {
   function transfer(address recipient, uint amount);
}
"),
    ok.
