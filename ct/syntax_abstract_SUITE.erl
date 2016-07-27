%%%-------------------------------------------------------------------
%%% File        : syntax_abstract_SUITE.erl
%%% Description : Test Suite covering abstract syntax tests.
%%%
%%% Created     : 04.2016
%%%-------------------------------------------------------------------
-module(syntax_abstract_SUITE).

-compile(export_all).

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
%% COMMON TEST CALLBACK FUNCTIONS - GROUPS - STRUCTURE
%%--------------------------------------------------------------------

groups() ->
    [
        {all_expressions, [], [
            test_expression_assignment,
            test_expression_expression,
            test_expression_function_call,
            test_expression_index_access,
            test_expression_member_access,
            test_expression_new_expression,
            test_expression_primary_expression,
            test_expression_primary_expression_brackets
        ]},
        {all_statements, [], [
            test_statement_break,
            test_statement_continue,
            test_statement_return,
            test_statement_throw,
            test_statement_variable_definition
        ]}
    ].

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - GROUPS - INIT
%%--------------------------------------------------------------------

init_per_group(_, Config) ->
    Config.

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - GROUPS - END
%%--------------------------------------------------------------------

end_per_group(_, _Config) ->
    ok.

%%--------------------------------------------------------------------
%% COMMON TEST CALLBACK FUNCTIONS - ALL
%%--------------------------------------------------------------------

all() ->
    [
        {group, all_expressions},
        {group, all_statements}
    ].

%%--------------------------------------------------------------------
%% TEST CASES
%%--------------------------------------------------------------------

%%--------------------------------------------------------------------
%% Expression: Assignment.
%%--------------------------------------------------------------------

test_expression_assignment(_Config) ->
    sytest:cd_string("RETURN 21 seconds |= new b [0] ;"),
    sytest:cd_string("RETURN 321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("RETURN 4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("RETURN A [0x4711] *= 1 ether ;"),
    sytest:cd_string("RETURN a_1_b_C [1] /= 2 ether ;"),
    sytest:cd_string("RETURN new a_1_b_C <<= new Berlin ;"),
    sytest:cd_string("RETURN new a1 >>= new b ;"),
    sytest:cd_string("RETURN new b [0] |= 3 ether ;"),
    sytest:cd_string("RETURN new b += new Berlin ;"),
    sytest:cd_string("RETURN new Berlin -= 4321 minutes ;").

%%--------------------------------------------------------------------
%% Expression: Expression.
%%--------------------------------------------------------------------

test_expression_expression(_Config) ->
    sytest:cd_string("RETURN ! 21 seconds |= new b [0] !=new a_1_b_C ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0] ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0] < new a_1_b_C.Berlin ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0] == new A ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0] > new LONDON [] ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0]<=TRUE [] ;"),
    sytest:cd_string("RETURN ! 21 seconds |= new b [0]>=ufixed [new LONDON] ;"),
    sytest:cd_string("RETURN ! TRUE [] ;"),
    sytest:cd_string("RETURN !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN !321 hours ^= a_1_b_C [1] && New __ ;"),
    sytest:cd_string("RETURN !321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("RETURN !321 hours ^= a_1_b_C [1] || delete New __ ;"),
    sytest:cd_string("RETURN !new a_1_b_C.Berlin ;"),
    sytest:cd_string("RETURN ++ a_1_b_C [1].a1 ;"),
    sytest:cd_string("RETURN ++A( ) * a_1_b_C [1].a1 ;"),
    sytest:cd_string("RETURN ++A( ) + A [0x4711].__ ;"),
    sytest:cd_string("RETURN ++A( ) - A( ) ;"),
    sytest:cd_string("RETURN ++A( ) / a_1_b_C(21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN ++A( ) ;"),
    sytest:cd_string("RETURN -- a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN --a_1_b_C(21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN DELETE ufixed [new LONDON] ** new a ;"),
    sytest:cd_string("RETURN DELETE ufixed [new LONDON] ;"),
    sytest:cd_string("RETURN DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("RETURN DELETE ufixed [new LONDON]<<321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("RETURN Delete var ;"),
    sytest:cd_string("RETURN delete New __ ;"),
    sytest:cd_string("RETURN new a_1_b_C.Berlin & 21 seconds |= new b [0] ;"),
    sytest:cd_string("RETURN new a_1_b_C.Berlin ^~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("RETURN new a_1_b_C.Berlin|!321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("RETURN ~ A [0x4711].__ ;"),
    sytest:cd_string("RETURN ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("RETURN ~new LONDON [] ;").

%%--------------------------------------------------------------------
%% Expression: FunctionCall.
%%--------------------------------------------------------------------

test_expression_function_call(_Config) ->
    sytest:cd_string("RETURN _() ;"),
    sytest:cd_string("RETURN __ () ;"),
    sytest:cd_string("RETURN a ( ) ;"),
    sytest:cd_string("RETURN A( ) ;"),
    sytest:cd_string("RETURN a_1_b_C(21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN Berlin ( 4321 minutes &= A [0x4711] , new a_1_b_C.Berlin,var) ;"),
    sytest:cd_string("RETURN LONDON(TRUE []) ;"),
    sytest:cd_string("RETURN paris ( ufixed [new LONDON] ) ;").

%%--------------------------------------------------------------------
%% Expression: IndexAccess.
%%--------------------------------------------------------------------

test_expression_index_access(_Config) ->
    sytest:cd_string("RETURN A [0x4711] ;"),
    sytest:cd_string("RETURN a_1_b_C [1] ;"),
    sytest:cd_string("RETURN new b [0] ;"),
    % wwe sytest:cd_string("RETURN new Berlin [ \"Dies ist ein Test\" ] ;"),
    sytest:cd_string("RETURN new LONDON [] ;"),
    sytest:cd_string("RETURN TRUE [] ;"),
    sytest:cd_string("RETURN ufixed [new LONDON] ;").

%%--------------------------------------------------------------------
%% Expression: MemberAccess.
%%--------------------------------------------------------------------

test_expression_member_access(_Config) ->
    sytest:cd_string("RETURN 21 seconds.b ;"),
    sytest:cd_string("RETURN 321 hours.a_1_b_C ;"),
    sytest:cd_string("RETURN 4321 minutes._ ;"),
    sytest:cd_string("RETURN A [0x4711].__ ;"),
    sytest:cd_string("RETURN a_1_b_C [1].a1 ;"),
    sytest:cd_string("RETURN new a_1_b_C.Berlin ;"),
    sytest:cd_string("RETURN new a1.a ;"),
    sytest:cd_string("RETURN new b [0].LONDON ;"),
    sytest:cd_string("RETURN new b.Berlin ;"),
    sytest:cd_string("RETURN new Berlin.paris ;").

%%--------------------------------------------------------------------
%% Expression: NewExpression.
%%--------------------------------------------------------------------

test_expression_new_expression(_Config) ->
    sytest:cd_string("RETURN new _ ;"),
    sytest:cd_string("RETURN New __ ;"),
    sytest:cd_string("RETURN new a ;"),
    sytest:cd_string("RETURN new A ;"),
    sytest:cd_string("RETURN new a_1_b_C ;"),
    sytest:cd_string("RETURN new a1 ;"),
    sytest:cd_string("RETURN new b ;"),
    sytest:cd_string("RETURN new Berlin ;"),
    sytest:cd_string("RETURN new LONDON ;"),
    sytest:cd_string("RETURN new paris ;").

%%--------------------------------------------------------------------
%% Expression: PrimaryExpression.
%%--------------------------------------------------------------------

test_expression_primary_expression(_Config) ->
    sytest:cd_string("RETURN \"\" ;"),
    % wwe sytest:cd_string("RETURN \"Dies ist ein Test\" ;"),
    sytest:cd_string("RETURN _ ;"),
    sytest:cd_string("RETURN __ ;"),
    sytest:cd_string("RETURN 0 finney ;"),
    sytest:cd_string("RETURN 054321 szabo ;"),
    sytest:cd_string("RETURN 0x0 weeks ;"),
    sytest:cd_string("RETURN 0x1 ;"),
    sytest:cd_string("RETURN 0x1 Days ;"),
    sytest:cd_string("RETURN 0x4711 ;"),
    sytest:cd_string("RETURN 0x55 years ;"),
    sytest:cd_string("RETURN 0x9 WEI ;"),
    sytest:cd_string("RETURN 1 ;"),
    sytest:cd_string("RETURN 1 ether ;"),
    sytest:cd_string("RETURN 1 wei ;"),
    sytest:cd_string("RETURN 21 seconds ;"),
    sytest:cd_string("RETURN 321 hours ;"),
    sytest:cd_string("RETURN 4321 minutes ;"),
    sytest:cd_string("RETURN 4711 ;"),
    sytest:cd_string("RETURN a ;"),
    sytest:cd_string("RETURN b ;"),
    sytest:cd_string("RETURN A ;"),
    sytest:cd_string("RETURN a_1_b_C ;"),
    sytest:cd_string("RETURN a1 ;"),
    sytest:cd_string("RETURN address ;"),
    sytest:cd_string("RETURN Berlin ;"),
    sytest:cd_string("RETURN bool ;"),
    sytest:cd_string("RETURN byte ;"),
    sytest:cd_string("RETURN bytes ;"),
    sytest:cd_string("RETURN bytes21 ;"),
    sytest:cd_string("RETURN false ;"),
    sytest:cd_string("RETURN False ;"),
    sytest:cd_string("RETURN fixed ;"),
    sytest:cd_string("RETURN fixed136x120 ;"),
    sytest:cd_string("RETURN fixed240x8 ;"),
    sytest:cd_string("RETURN int ;"),
    sytest:cd_string("RETURN int248 ;"),
    sytest:cd_string("RETURN LONDON ;"),
    sytest:cd_string("RETURN paris ;"),
    sytest:cd_string("RETURN string ;"),
    sytest:cd_string("RETURN TRUE ;"),
    sytest:cd_string("RETURN ufixed ;"),
    sytest:cd_string("RETURN ufixed0x72 ;"),
    sytest:cd_string("RETURN ufixed112x72 ;"),
    sytest:cd_string("RETURN ufixed208x32 ;"),
    sytest:cd_string("RETURN ufixed240x16 ;"),
    sytest:cd_string("RETURN UFIXED248X8 ;"),
    sytest:cd_string("RETURN uint ;"),
    sytest:cd_string("RETURN uint256 ;"),
    sytest:cd_string("RETURN var ;").

%%--------------------------------------------------------------------
%% Expression: PrimaryExpression - Brackets.
%%--------------------------------------------------------------------

test_expression_primary_expression_brackets(_Config) ->
    sytest:cd_string("RETURN (21 seconds) ;"),
    sytest:cd_string("RETURN (321 hours ) ;"),
    sytest:cd_string("RETURN ( 4321 minutes) ;"),
    sytest:cd_string("RETURN ( A [0x4711] ) ;"),
    sytest:cd_string("RETURN (a_1_b_C [1]) ;"),
    sytest:cd_string("RETURN ( new a_1_b_C ) ;"),
    sytest:cd_string("RETURN ( new a1) ;"),
    sytest:cd_string("RETURN (new b [0]) ;"),
    sytest:cd_string("RETURN (new b ) ;"),
    sytest:cd_string("RETURN ( new Berlin) ;").

%%--------------------------------------------------------------------
%% Statement: Break.
%%--------------------------------------------------------------------

test_statement_break(_Config) ->
    sytest:cd_string("break;"),
    sytest:cd_string("Break ;"),
    sytest:cd_string("BREAK;").

%% =============================================================================
%% Continue
%% -----------------------------------------------------------------------------

test_statement_continue(_Config) ->
    sytest:cd_string("continue ;"),
    sytest:cd_string("Continue;"),
    sytest:cd_string("CONTINUE ;").

%%--------------------------------------------------------------------
%% Statement: Return.
%%--------------------------------------------------------------------

test_statement_return(_Config) ->
    sytest:cd_string("return ! 21 seconds |= new b [0] !=new a_1_b_C ;"),
    sytest:cd_string("return !321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("Return !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("return 21 seconds |= new b [0] ;"),
    sytest:cd_string("return 321 hours ^= a_1_b_C [1] ;"),
    sytest:cd_string("return 4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("return A [0x4711].__ ;"),
    sytest:cd_string("return A( ) ;"),
    sytest:cd_string("return a_1_b_C [1].a1 ;"),
    sytest:cd_string("return a_1_b_C(21 seconds |= new b [0]) ;"),
    sytest:cd_string("return a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("RETURN delete New __ ;"),
    sytest:cd_string("RETURN DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("RETURN New __ ;"),
    sytest:cd_string("RETURN new a ;"),
    sytest:cd_string("RETURN new A ;"),
    sytest:cd_string("RETURN new a_1_b_C ;"),
    sytest:cd_string("RETURN new a_1_b_C.Berlin ;"),
    sytest:cd_string("RETURN new LONDON [] ;"),
    sytest:cd_string("RETURN TRUE [] ;"),
    sytest:cd_string("RETURN ufixed [new LONDON] ;"),
    sytest:cd_string("return UFIXED248X8 ;"),
    sytest:cd_string("return uint ;"),
    sytest:cd_string("return uint256 ;"),
    sytest:cd_string("return var ;"),
    sytest:cd_string("return ;"),
    sytest:cd_string("Return;"),
    sytest:cd_string("RETURN;").

%% =============================================================================
%% Statement: Throw.
%% -----------------------------------------------------------------------------

test_statement_throw(_Config) ->
    sytest:cd_string("throw;"),
    sytest:cd_string("Throw ;"),
    sytest:cd_string("THROW;").

%%--------------------------------------------------------------------
%% Statement: VariableDefinition.
%%--------------------------------------------------------------------

test_statement_variable_definition(_Config) ->
    sytest:cd_string("_ _ ;"),
    sytest:cd_string("__ _ = a ;"),
    sytest:cd_string("__[new a_1_b_C.Berlin] _ = ! 21 seconds |= new b [0] !=new a_1_b_C ;"),
    sytest:cd_string("a __ = ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("A a = !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("a_1_b_C Berlin = ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("a_1_b_C[ new LONDON []] london = ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("a_1_b_C[ var]paris ;"),
    sytest:cd_string("a1 identif ;"),
    sytest:cd_string("address [] identif ;"),
    sytest:cd_string("address identif = ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("Berlin [ ! 21 seconds |= new b [0] !=new a_1_b_C ] identif ;"),
    sytest:cd_string("Berlin [ !321 hours ^= a_1_b_C [1] ] identif ;"),
    sytest:cd_string("Berlin [] identif= A [0x4711].__ ;"),
    sytest:cd_string("Berlin identif = A [0x4711].__ ;"),
    sytest:cd_string("bool [ a_1_b_C [1].a1 ] identif = a_1_b_C [1].a1 ;"),
    sytest:cd_string("bool [ a_1_b_C(21 seconds |= new b [0]) ] identif ;"),
    sytest:cd_string("bool identif = A [0x4711].__ ;"),
    sytest:cd_string("bool[] identif ;"),
    sytest:cd_string("fixed identif = a_1_b_C [1].a1 ;"),
    sytest:cd_string("int identif ;"),
    sytest:cd_string("LONDON identif ;"),
    sytest:cd_string("LONDON[] identif ;"),
    sytest:cd_string("mapping ( ! 21 seconds |= new b [0] !=new a_1_b_C => _ ) identif = ~4321 minutes &= A [0x4711] ;"),
    sytest:cd_string("mapping ( !321 hours ^= a_1_b_C [1] => __) identif = A [0x4711].__ ;"),
    sytest:cd_string("mapping ( 321 hours ^= a_1_b_C [1] => a_1_b_C ) identif = a_1_b_C [1].a1 ;"),
    sytest:cd_string("mapping ( 4321 minutes &= A [0x4711] => a_1_b_C[ new LONDON []] ) identif = delete New __ ;"),
    sytest:cd_string("mapping ( A( ) => address ) identif = delete New __ ;"),
    sytest:cd_string("mapping ( a_1_b_C [1].a1 => address [] ) identif = A [0x4711].__ ;"),
    sytest:cd_string("mapping ( a_1_b_C(21 seconds |= new b [0]) => Berlin [ !321 hours ^= a_1_b_C [1] ] ) identif = A [0x4711].__ ;"),
    sytest:cd_string("mapping ( a1(21 seconds |= new b [0],21 seconds |= new b [0]) => Berlin [] ) identif = A [0x4711].__ ;"),
    sytest:cd_string("paris [] identif = A( ) ;"),
    sytest:cd_string("paris identif = a_1_b_C(21 seconds |= new b [0]) ;"),
    sytest:cd_string("string [] identif = a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;"),
    sytest:cd_string("string identif = new LONDON [] ;"),
    sytest:cd_string("ufixed identif = ufixed [new LONDON] ;"),
    sytest:cd_string("unit identif = var ;"),
    sytest:cd_string("var identif= DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;").
