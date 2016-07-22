%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% TESTS
%%

%% =============================================================================
%% Break
%% -----------------------------------------------------------------------------

"break;".
"Break ;".
"BREAK;".

%% =============================================================================
%% Continue
%% -----------------------------------------------------------------------------

"continue ;".
"Continue;".
"CONTINUE ;".

%% =============================================================================
%% Return
%% -----------------------------------------------------------------------------

"return ! 21 seconds |= new b [0] !=new a_1_b_C ;".
"return !321 hours ^= a_1_b_C [1] ;".
% wwe "Return !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"RETURN ~4321 minutes &= A [0x4711] ;".
"return 21 seconds |= new b [0] ;".
"return 321 hours ^= a_1_b_C [1] ;".
"return 4321 minutes &= A [0x4711] ;".
"return A [0x4711].__ ;".
% "return A( ) ;".
"return a_1_b_C [1].a1 ;".
% wwe "return a_1_b_C(21 seconds |= new b [0]) ;".
% wwe "return a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"RETURN delete New __ ;".
"RETURN DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;".
"RETURN New __ ;".
"RETURN new a ;".
"RETURN new A ;".
"RETURN new a_1_b_C ;".
"RETURN new a_1_b_C.Berlin ;".
"RETURN new LONDON [] ;".
"RETURN TRUE [] ;".
"RETURN ufixed [new LONDON] ;".
"return UFIXED248X8 ;".
"return uint ;".
"return uint256 ;".
"return var ;".
"return ;".
"Return;".
"RETURN;".

%% =============================================================================
%% Throw
%% -----------------------------------------------------------------------------

"throw;".
"Throw ;".
"THROW;".

%% =============================================================================
%% VariableDefinition
%% -----------------------------------------------------------------------------

"_ _ ;".
"__ _ = a ;".
"__[new a_1_b_C.Berlin] _ = ! 21 seconds |= new b [0] !=new a_1_b_C ;".
"a __ = ~4321 minutes &= A [0x4711] ;".
"A a = !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"a_1_b_C Berlin = ~4321 minutes &= A [0x4711] ;".
"a_1_b_C[ new LONDON []] london = ~4321 minutes &= A [0x4711] ;".
"a_1_b_C[ var]paris ;".
"a1 identif ;".
"address [] identif ;".
"address identif = ~4321 minutes &= A [0x4711] ;".
"Berlin [ ! 21 seconds |= new b [0] !=new a_1_b_C ] identif ;".
"Berlin [ !321 hours ^= a_1_b_C [1] ] identif ;".
"Berlin [] identif= A [0x4711].__ ;".
"Berlin identif = A [0x4711].__ ;".
"bool [ a_1_b_C [1].a1 ] identif = a_1_b_C [1].a1 ;".
"bool [ a_1_b_C(21 seconds |= new b [0]) ] identif ;".
"bool identif = A [0x4711].__ ;".
"bool[] identif ;".
"fixed identif = a_1_b_C [1].a1 ;".
"int identif ;".
"LONDON identif ;".
"LONDON[] identif ;".
"mapping ( ! 21 seconds |= new b [0] !=new a_1_b_C => _ ) identif = ~4321 minutes &= A [0x4711] ;".
"mapping ( !321 hours ^= a_1_b_C [1] => __) identif = A [0x4711].__ ;".
"mapping ( 321 hours ^= a_1_b_C [1] => a_1_b_C ) identif = a_1_b_C [1].a1 ;".
"mapping ( 4321 minutes &= A [0x4711] => a_1_b_C[ new LONDON []] ) identif = delete New __ ;".
"mapping ( A( ) => address ) identif = delete New __ ;".
"mapping ( a_1_b_C [1].a1 => address [] ) identif = A [0x4711].__ ;".
"mapping ( a_1_b_C(21 seconds |= new b [0]) => Berlin [ !321 hours ^= a_1_b_C [1] ] ) identif = A [0x4711].__ ;".
"mapping ( a1(21 seconds |= new b [0],21 seconds |= new b [0]) => Berlin [] ) identif = A [0x4711].__ ;".
"paris [] identif = A( ) ;".
"paris identif = a_1_b_C(21 seconds |= new b [0]) ;".
"string [] identif = a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"string identif = new LONDON [] ;".
"ufixed identif = ufixed [new LONDON] ;".
"unit identif = var ;".
"var identif= DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;".
