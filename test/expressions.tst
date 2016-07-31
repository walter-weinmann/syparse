%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% TESTS
%%

%% =============================================================================
%% Assignment
%% -----------------------------------------------------------------------------

"RETURN 21 seconds |= new b [0] ;".
"RETURN 321 hours ^= a_1_b_C [1] ;".
"RETURN 4321 minutes &= A [0x4711] ;".
"RETURN A [0x4711] *= 1 ether ;".
"RETURN a_1_b_C [1] /= 2 ether ;".
"RETURN new a_1_b_C <<= new Berlin ;".
"RETURN new a1 >>= new b ;".
"RETURN new b [0] |= 3 ether ;".
"RETURN new b += new Berlin ;".
"RETURN new Berlin -= 4321 minutes ;".

%% =============================================================================
%% Expression
%% -----------------------------------------------------------------------------

"RETURN ! 21 seconds |= new b [0] !=new a_1_b_C ;".
"RETURN ! 21 seconds |= new b [0] ;".
"RETURN ! 21 seconds |= new b [0] < new a_1_b_C.Berlin ;".
"RETURN ! 21 seconds |= new b [0] == new A ;".
"RETURN ! 21 seconds |= new b [0] > new LONDON [] ;".
"RETURN ! 21 seconds |= new b [0]<=TRUE [] ;".
"RETURN ! 21 seconds |= new b [0]>=ufixed [new LONDON] ;".
"RETURN ! TRUE [] ;".
"RETURN !321 hours ^= a_1_b_C [1] % a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"RETURN !321 hours ^= a_1_b_C [1] && New __ ;".
"RETURN !321 hours ^= a_1_b_C [1] ;".
"RETURN !321 hours ^= a_1_b_C [1] || delete New __ ;".
"RETURN !new a_1_b_C.Berlin ;".
"RETURN ++ a_1_b_C [1].a1 ;".
"RETURN ++A( ) * a_1_b_C [1].a1 ;".
"RETURN ++A( ) + A [0x4711].__ ;".
"RETURN ++A( ) - A( ) ;".
"RETURN ++A( ) / a_1_b_C(21 seconds |= new b [0]) ;".
"RETURN ++A( ) ;".
"RETURN -- a1(21 seconds |= new b [0],21 seconds |= new b [0]) ;".
"RETURN --a_1_b_C(21 seconds |= new b [0]) ;".
"RETURN DELETE ufixed [new LONDON] ** new a ;".
"RETURN DELETE ufixed [new LONDON] ;".
"RETURN DELETE ufixed [new LONDON] >> 4321 minutes &= A [0x4711] ;".
"RETURN DELETE ufixed [new LONDON]<<321 hours ^= a_1_b_C [1] ;".
"RETURN Delete var ;".
"RETURN delete New __ ;".
"RETURN new a_1_b_C.Berlin & 21 seconds |= new b [0] ;".
"RETURN new a_1_b_C.Berlin ^~4321 minutes &= A [0x4711] ;".
"RETURN new a_1_b_C.Berlin|!321 hours ^= a_1_b_C [1] ;".
"RETURN ~ A [0x4711].__ ;".
"RETURN ~4321 minutes &= A [0x4711] ;".
"RETURN ~new LONDON [] ;".

%% =============================================================================
%% FunctionCall
%% -----------------------------------------------------------------------------

% "_()".
"__ ()".
"a ( )".
"A( )".
"LONDON(TRUE [])".

%% =============================================================================
%% IndexAccess
%% -----------------------------------------------------------------------------

"RETURN A [0x4711] ;".
"RETURN a_1_b_C [1] ;".
"RETURN new b [0] ;".
timeout "RETURN new Berlin [ \"Dies ist ein Test\" ] ;".
"RETURN new LONDON [] ;".
"RETURN TRUE [] ;".
"RETURN ufixed [new LONDON] ;".

%% =============================================================================
%% MemberAccess
%% -----------------------------------------------------------------------------

"RETURN 21 seconds.b ;".
"RETURN 321 hours.a_1_b_C ;".
"RETURN 4321 minutes._ ;".
"RETURN A [0x4711].__ ;".
"RETURN a_1_b_C [1].a1 ;".
"RETURN new a_1_b_C.Berlin ;".
"RETURN new a1.a ;".
"RETURN new b [0].LONDON ;".
"RETURN new b.Berlin ;".
"RETURN new Berlin.paris ;".

%% =============================================================================
%% NewExpression
%% -----------------------------------------------------------------------------

"RETURN new _ ;".
"RETURN New __ ;".
"RETURN new a ;".
"RETURN new A ;".
"RETURN new a_1_b_C ;".
"RETURN new a1 ;".
"RETURN new b ;".
"RETURN new Berlin ;".
"RETURN new LONDON ;".
"RETURN new paris ;".

%% =============================================================================
%% PrimaryExpression
%% -----------------------------------------------------------------------------

"RETURN \"\" ;".
"RETURN \"Dies ist ein Test\" ;".
"RETURN _ ;".
"RETURN __ ;".
"RETURN 0 finney ;".
"RETURN 054321 szabo ;".
"RETURN 0x0 weeks ;".
"RETURN 0x1 ;".
"RETURN 0x1 Days ;".
"RETURN 0x4711 ;".
"RETURN 0x55 years ;".
"RETURN 0x9 WEI ;".
"RETURN 1 ;".
"RETURN 1 ether ;".
"RETURN 1 wei ;".
"RETURN 21 seconds ;".
"RETURN 321 hours ;".
"RETURN 4321 minutes ;".
"RETURN 4711 ;".
"RETURN a ;".
"RETURN b ;".
"RETURN A ;".
"RETURN a_1_b_C ;".
"RETURN a1 ;".
"RETURN address ;".
"RETURN Berlin ;".
"RETURN bool ;".
"RETURN byte ;".
"RETURN bytes ;".
"RETURN bytes21 ;".
"RETURN false ;".
"RETURN False ;".
"RETURN fixed ;".
"RETURN fixed136x120 ;".
"RETURN fixed240x8 ;".
"RETURN int ;".
"RETURN int248 ;".
"RETURN LONDON ;".
"RETURN paris ;".
"RETURN string ;".
"RETURN TRUE ;".
"RETURN ufixed ;".
"RETURN ufixed0x72 ;".
"RETURN ufixed112x72 ;".
"RETURN ufixed208x32 ;".
"RETURN ufixed240x16 ;".
"RETURN UFIXED248X8 ;".
"RETURN uint ;".
"RETURN uint256 ;".
"RETURN var ;".

%% =============================================================================
%% PrimaryExpression - Brackets
%% -----------------------------------------------------------------------------

"RETURN (21 seconds) ;".
"RETURN (321 hours ) ;".
"RETURN ( 4321 minutes) ;".
"RETURN ( A [0x4711] ) ;".
"RETURN (a_1_b_C [1]) ;".
"RETURN ( new a_1_b_C ) ;".
"RETURN ( new a1) ;".
"RETURN (new b [0]) ;".
"RETURN (new b ) ;".
"RETURN ( new Berlin) ;".
