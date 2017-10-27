%%%-------------------------------------------------------------------
%%% File        : performance_complete_compacted_special_SUITE.erl
%%% Description : Test Suite for rule: special.
%%%
%%% Created     : 27.10.2017
%%%-------------------------------------------------------------------
-module(performance_complete_compacted_special_SUITE).

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
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier (47++, 11--) {}"),
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier (47++,Delete 4711) {}"),
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier {}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Event identifier1 (Address, Bool);}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Function () {Return [];}}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier () {Var ();}}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Return ();}}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Return [];}}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Var ();}}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {Using identifier For Address [];}"),
    {ok, _} = syparse:source_to_pt("Contract myContract {}"),
    {ok, _} = syparse:source_to_pt("Contract myContract1 {Using identifier For Address [];} Contract myContract2 {Using identifier For Address [];}"),
    {ok, _} = syparse:source_to_pt("Import \"string1\"; Import \"string2\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1 As identifier2, identifier2 As identifier4} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2 As identifier3} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2} From \"string\";"),
    {ok, _} = syparse:source_to_pt("Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;"),
    ok.
