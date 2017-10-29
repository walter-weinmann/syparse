%% -----------------------------------------------------------------------------
%%
%% syparse.xrl: Solidity - lexer definition.
%%
%% Copyright (c) 2017 Walter Weinmann.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -----------------------------------------------------------------------------

%% -*- erlang -*-
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Definitions.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rules.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% comments
((//).*[\n\r]?)                                           : skip_token.
((/\*)(.|\n|\r)*(\*/))                                    : skip_token.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% pragma directive

%% PragmaDirective = 'pragma' Identifier ([^;]+) ';'

(\^[0-9]+\.[0-9]+\.[0-9]+;)                               : {token, {'PRAGMA_DIRECTIVE', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bytes

%% Byte = 'byte' | 'bytes' | 'bytes1' | 'bytes2' | 'bytes3' | 'bytes4' | 'bytes5' | 'bytes6' | 'bytes7' | 'bytes8' | 'bytes9' | 'bytes10' | 'bytes11' | 'bytes12' | 'bytes13' | 'bytes14' | 'bytes15' | 'bytes16' | 'bytes17' | 'bytes18' | 'bytes19' | 'bytes20' | 'bytes21' | 'bytes22' | 'bytes23' | 'bytes24' | 'bytes25' | 'bytes26' | 'bytes27' | 'bytes28' | 'bytes29' | 'bytes30' | 'bytes31' | 'bytes32'

(([bB][yY][tT][eE])|([bB][yY][tT][eE][sS][1-9]?)|([bB][yY][tT][eE][sS][12][0-9])|([bB][yY][tT][eE][sS]3[0-2]))
                                                          : match_bytes(TokenChars, TokenLen).

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% fixed

%% Fixed = 'fixed' | ( 'fixed' DecimalNumber 'x' DecimalNumber )

([fF][iI][xX][eE][dD](([8]|[1][6]|[2][4]|[3][2]|[4][0]|[4][8]|[5][6]|[6][4]|[7][2]|[8][0]|[8][8]|[9][6]|[1][0][4]|[1][1][2]|[1][2][0]|[1][2][8]|[1][3][6]|[1][4][4]|[1][5][2]|[1][6][0]|[1][6][8]|[1][7][6]|[1][8][4]|[1][9][2]|[2][0][0]|[2][0][8]|[2][1][6]|[2][2][4]|[2][3][2]|[2][4][0]|[2][4][8]|[2][5][6])[xX]([1-7][0-9]|[8][0]|[0-9]))?)
                                                          : {token, {'FIXED', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hex literals

%% HexLiteral = 'hex' ('"' ([0-9a-fA-F]{2})* '"' | '\'' ([0-9a-fA-F]{2})* '\'')

([hH][eE][xX](\"([0-9a-fA-F])*\"))                        : {token, {'HEX_LITERAL', TokenLine, TokenChars}}.
([hH][eE][xX](\'([0-9a-fA-F])*\'))                        : {token, {'HEX_LITERAL', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% int

%% Int = 'int' | 'int8' | 'int16' | 'int24' | 'int32' | 'int40' | 'int48' | 'int56' | 'int64' | 'int72' | 'int80' | 'int88' | 'int96' | 'int104' | 'int112' | 'int120' | 'int128' | 'int136' | 'int144' | 'int152' | 'int160' | 'int168' | 'int176' | 'int184' | 'int192' | 'int200' | 'int208' | 'int216' | 'int224' | 'int232' | 'int240' | 'int248' | 'int256'

(([iI][nN][tT])((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : {token, {'INT', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ufixed

%% Ufixed = 'ufixed' | ( 'ufixed' DecimalNumber 'x' DecimalNumber )

([uU][fF][iI][xX][eE][dD](([8]|[1][6]|[2][4]|[3][2]|[4][0]|[4][8]|[5][6]|[6][4]|[7][2]|[8][0]|[8][8]|[9][6]|[1][0][4]|[1][1][2]|[1][2][0]|[1][2][8]|[1][3][6]|[1][4][4]|[1][5][2]|[1][6][0]|[1][6][8]|[1][7][6]|[1][8][4]|[1][9][2]|[2][0][0]|[2][0][8]|[2][1][6]|[2][2][4]|[2][3][2]|[2][4][0]|[2][4][8]|[2][5][6])[xX]([1-7][0-9]|[8][0]|[0-9]))?)
                                                          : {token, {'UFIXED', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% uint

%% Uint = 'uint' | 'uint8' | 'uint16' | 'uint24' | 'uint32' | 'uint40' | 'uint48' | 'uint56' | 'uint64' | 'uint72' | 'uint80' | 'uint88' | 'uint96' | 'uint104' | 'uint112' | 'uint120' | 'uint128' | 'uint136' | 'uint144' | 'uint152' | 'uint160' | 'uint168' | 'uint176' | 'uint184' | 'uint192' | 'uint200' | 'uint208' | 'uint216' | 'uint224' | 'uint232' | 'uint240' | 'uint248' | 'uint256'

(([uU][iI][nN][tT])((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : {token, {'UINT', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% string literals

%% StringLiteral = '"' ([^"\r\n\\] | '\\' .)* '"'

(\"([^\"\r\n\\]|\\.)*\")                                  : {token, {'STRING_LITERAL', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hex numbers

%% HexNumber = '0x' [0-9a-fA-F]+

(0x[0-9a-fA-F]+)                                          : {token, {'HEX_NUMBER', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% decimal numbers

%% DecimalNumber = [0-9]+

([0-9]+)                                                  : {token, {'DECIMAL_NUMBER', TokenLine, TokenChars}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% identifiers

%% Identifier = [a-zA-Z_$] [a-zA-Z_$0-9]*

([_$][a-zA-Z_$0-9]+)                                      : {token, {'IDENTIFIER', TokenLine, TokenChars}}.
([a-zA-Z][a-zA-Z_0-9]*[$][a-zA-Z_$0-9]*)                  : {token, {'IDENTIFIER', TokenLine, TokenChars}}.
([a-zA-Z][a-zA-Z_0-9]*)                                   : match_any(TokenChars, TokenLen, TokenLine, ?TOKEN_PATTERNS).

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% punctuation
(,|{|}|\(|\)|;|_|=>|\[|\]|\.)                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(=|\|=|\^=|&=|<<=|>>=|\+=|-=|\*=|/=|%=|:=)                : {token, {list_to_atom(TokenChars), TokenLine}}.
(!|~|\+\+|--)                                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(\*\*|\*|/|%)                                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(\||\^|&|<<|>>)                                           : {token, {list_to_atom(TokenChars), TokenLine}}.
(\+|-)                                                    : {token, {list_to_atom(TokenChars), TokenLine}}.
(<=|>=|<|>)                                               : {token, {list_to_atom(TokenChars), TokenLine}}.
(==|!=)                                                   : {token, {list_to_atom(TokenChars), TokenLine}}.
(&&|\|\||\?|:)                                            : {token, {list_to_atom(TokenChars), TokenLine}}.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% white space
([\n\r\s\t]+)                                             : skip_token.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Erlang code.

%% -----------------------------------------------------------------------------
%%
%% sylexer.erl: Solidity - lexer.
%%
%% Copyright (c) 2017 Walter Weinmann.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -----------------------------------------------------------------------------

-export([reserved_keywords/0]).

-define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

relocatable, static, switch, try, type, typeof

-define(TOKEN_PATTERNS, [
    {"^(?i)(ABSTRACT)$",         'ABSTRACT'},
    {"^(?i)(ADDRESS)$",          'ADDRESS'},
    {"^(?i)(AFTER)$",            'AFTER'},
    {"^(?i)(ANONYMOUS)$",        'ANONYMOUS'},
    {"^(?i)(AS)$",               'AS'},
    {"^(?i)(ASSEMBLY)$",         'ASSEMBLY'},
    {"^(?i)(BOOL)$",             'BOOL'},
    {"^(?i)(BREAK)$",            'BREAK'},
    {"^(?i)(CASE)$",             'CASE'},
    {"^(?i)(CATCH)$",            'CATCH'},
    {"^(?i)(CONSTANT)$",         'CONSTANT'},
    {"^(?i)(CONTINUE)$",         'CONTINUE'},
    {"^(?i)(CONTRACT)$",         'CONTRACT'},
    {"^(?i)(DAYS)$",             'DAYS'},
    {"^(?i)(DEFAULT)$",          'DEFAULT'},
    {"^(?i)(DELETE)$",           'DELETE'},
    {"^(?i)(DO)$",               'DO'},
    {"^(?i)(ELSE)$",             'ELSE'},
    {"^(?i)(ENUM)$",             'ENUM'},
    {"^(?i)(ETHER)$",            'ETHER'},
    {"^(?i)(EVENT)$",            'EVENT'},
    {"^(?i)(EXTERNAL)$",         'EXTERNAL'},
    {"^(?i)(FALSE)$",            'FALSE'},
    {"^(?i)(FINAL)$",            'FINAL'},
    {"^(?i)(FINNEY)$",           'FINNEY'},
    {"^(?i)(FOR)$",              'FOR'},
    {"^(?i)(FROM)$",             'FROM'},
    {"^(?i)(FUNCTION)$",         'FUNCTION'},
    {"^(?i)(HOURS)$",            'HOURS'},
    {"^(?i)(IF)$",               'IF'},
    {"^(?i)(IMPORT)$",           'IMPORT'},
    {"^(?i)(IN)$",               'IN'},
    {"^(?i)(INDEXED)$",          'INDEXED'},
    {"^(?i)(INLINE)$",           'INLINE'},
    {"^(?i)(INTERFACE)$",        'INTERFACE'},
    {"^(?i)(INTERNAL)$",         'INTERNAL'},
    {"^(?i)(IS)$",               'IS'},
    {"^(?i)(LET)$",              'LET'},
    {"^(?i)(LIBRARY)$",          'LIBRARY'},
    {"^(?i)(MAPPING)$",          'MAPPING'},
    {"^(?i)(MATCH)$",            'MATCH'},
    {"^(?i)(MEMORY)$",           'MEMORY'},
    {"^(?i)(MINUTES)$",          'MINUTES'},
    {"^(?i)(MODIFIER)$",         'MODIFIER'},
    {"^(?i)(NEW)$",              'NEW'},
    {"^(?i)(NULL)$",             'NULL'},
    {"^(?i)(OF)$",               'OF'},
    {"^(?i)(PAYABLE)$",          'PAYABLE'},
    {"^(?i)(PRAGMA)$",           'PRAGMA'},
    {"^(?i)(PRIVATE)$",          'PRIVATE'},
    {"^(?i)(PUBLIC)$",           'PUBLIC'},
    {"^(?i)(PURE)$",             'PURE'},
    {"^(?i)(RELOCATE)$",         'RELOCATE'},
    {"^(?i)(RETURN)$",           'RETURN'},
    {"^(?i)(RETURNS)$",          'RETURNS'},
    {"^(?i)(SECONDS)$",          'SECONDS'},
    {"^(?i)(STATIC)$",           'STATIC'},
    {"^(?i)(STORAGE)$",          'STORAGE'},
    {"^(?i)(STRING)$",           'STRING'},
    {"^(?i)(STRUCT)$",           'STRUCT'},
    {"^(?i)(STRUCT)$",           'STRUCT'},
    {"^(?i)(SWITCH)$",           'SWITCH'},
    {"^(?i)(THROW)$",            'THROW'},
    {"^(?i)(TRUE)$",             'TRUE'},
    {"^(?i)(TRY)$",              'TRY'},
    {"^(?i)(TYPE)$",             'TYPE'},
    {"^(?i)(TYPEOF)$",           'TYPEOF'},
    {"^(?i)(USING)$",            'USING'},
    {"^(?i)(VAR)$",              'VAR'},
    {"^(?i)(VIEW)$",             'VIEW'},
    {"^(?i)(WEEKS)$",            'WEEKS'},
    {"^(?i)(WEI)$",              'WEI'},
    {"^(?i)(WHILE)$",            'WHILE'},
    {"^(?i)(YEARS)$",            'YEARS'}
]).

%-define(DEBUG, true).
-ifdef(DEBUG).
-define(Dbg(F,A), io:format(user, "[~p] "++F++"~n", [?LINE|A])).
-else.
-define(Dbg(F,A), ok).
-endif.

reserved_keywords() -> [T || {_, T} <- ?TOKEN_PATTERNS].

match_any(TokenChars, TokenLen, _TokenLine, []) ->
    {token, {'IDENTIFIER', TokenLen, TokenChars}};
match_any(TokenChars, TokenLen, TokenLine, [{P,T}|TPs]) ->
    case re:run(TokenChars, P, [{capture, first, list}]) of
        {match,[_]} ->
            {token, {T, TokenLine}};
        nomatch ->
            match_any(TokenChars, TokenLen, TokenLine, TPs)
    end.

match_bytes(TokenChars, TokenLen) ->
    TokenCharsLower = string:to_lower(TokenChars),
    case length(TokenChars) >= 6 of
        true ->
            Size = string:substr(TokenChars, 6),
            case Size of
                [] ->
                    {token, {'BYTE', TokenLen, TokenCharsLower}};
                S when S >= "1", S =< "9" ->
                    {token, {'BYTE', TokenLen, TokenCharsLower}};
                S when S >= "10", S =< "32" ->
                    {token, {'BYTE', TokenLen, TokenCharsLower}};
                _ ->
                    {token, {'IDENTIFIER', TokenLen, TokenChars}}
            end;
        _ -> {token, {'BYTE', TokenLen, TokenChars}}
    end.
