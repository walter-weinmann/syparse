%%%-------------------------------------------------------------------
%%% File        : performance_complete_detailed__special_SUITE.erl
%%% Description : Test Suite for rule: special.
%%%
%%% Created     : 26.10.2017
%%%-------------------------------------------------------------------
-module(performance_complete_detailed__special_SUITE).

-export([
    all/0,
    end_per_suite/1,
    init_per_suite/1,
    suite/0,
    test_1/1,
    test_2/1,
    test_3/1,
    test_4/1,
    test_5/1,
    test_6/1,
    test_7/1,
    test_8/1,
    test_9/1,
    test_10/1,
    test_11/1,
    test_12/1,
    test_13/1,
    test_14/1,
    test_15/1,
    test_16/1,
    test_17/1,
    test_18/1
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
        test_1,
        test_2,
        test_3,
        test_4,
        test_5,
        test_6,
        test_7,
        test_8,
        test_9,
        test_10,
        test_11,
        test_12,
        test_13,
        test_14,
        test_15,
        test_16,
        test_17,
        test_18
    ].

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

test_1(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier (47++, 11--) {}").

test_2(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier (47++,Delete 4711) {}").

test_3(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract Is identifier {}").

test_4(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}").

test_5(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Event identifier1 (Address, Bool);}").

test_6(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Function () {Return [];}}").

test_7(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier () {Var ();}}").

test_8(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Return ();}}").

test_9(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Return [];}}").

test_10(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Modifier myModifier {Var ();}}").

test_11(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {Using identifier For Address [];}").

test_12(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract {}").

test_13(_Config) ->
    {ok, _} = syparse:source_to_pt("Contract myContract1 {Using identifier For Address [];} Contract myContract2 {Using identifier For Address [];}").

test_14(_Config) ->
    {ok, _} = syparse:source_to_pt("Import \"string1\"; Import \"string2\";").

test_15(_Config) ->
    {ok, _} = syparse:source_to_pt("Import {identifier1 As identifier2, identifier2 As identifier4} From \"string\";").

test_16(_Config) ->
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2 As identifier3} From \"string\";").

test_17(_Config) ->
    {ok, _} = syparse:source_to_pt("Import {identifier1, identifier2} From \"string\";").

test_18(_Config) ->
    {ok, _} = syparse:source_to_pt("Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;").

