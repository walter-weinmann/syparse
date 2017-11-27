%%%-------------------------------------------------------------------
%%% File        : performance_complete__compacted_special_SUITE.erl
%%% Description : Test Suite for rule: special.
%%%
%%% Created     : 27.11.2017
%%%-------------------------------------------------------------------
-module(performance_complete__compacted_special_SUITE).

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
    {ok, _} = syparse:source_to_pt("Contract my_contract Is identifier (47++, 11--) {}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract Is identifier (47++,Delete 4711) {}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract Is identifier {}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Event identifier1 (Address, Bool);}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Function () {Return [];}}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Modifier my_modifier () {Var ();}}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Modifier my_modifier {Return ();}}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Modifier my_modifier {Return [];}}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Modifier my_modifier {Var ();}}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {Using identifier For Address [];}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract {}"),
    {ok, _} = syparse:source_to_pt("Contract my_contract1 {Using identifier For Address [];} Contract my_contract2 {Using identifier For Address [];}"),
    {ok, _} = syparse:source_to_pt("Import \"string1\"; Import \"string2\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1 As identifier2, identifier2 As identifier4} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2 As identifier3} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;"),
    ok.
