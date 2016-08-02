%% -*- erlang -*-
Definitions.

Rules.

%% bytes
(([b|B][y|Y][t|T][e|E])|([b|B][y|Y][t|T][e|E][s|S][1-9]?)|([b|B][y|Y][t|T][e|E][s|S][1|2][0-9])|([b|B][y|Y][t|T][e|E][s|S]3[0-2]))
                                                          : match_bytes(TokenChars, TokenLen).

%% ufixed
(([u|U][f|F][i|I][x|X][e|E][d|D])|([u|U][f|F][i|I][x|X][e|E][d|D](0|8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248)(x|X)(8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256)))
                                                          : match_ufixed(TokenChars, TokenLen).

%% fixed
(([f|F][i|I][x|X][e|E][d|D])|([f|F][i|I][x|X][e|E][d|D](0|8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248)(x|X)(8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256)))
                                                          : match_fixed(TokenChars, TokenLen).

%% uint
(([u|U][i|I][n|N][t|T])|((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256)))
                                                          : {token, {'UINT', TokenLine, TokenChars}}.

%% int
(([i|I][n|N][t|T])|((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256)))
                                                          : {token, {'INT', TokenLine, TokenChars}}.

%% number literals
((0x)?[0-9]+)                                             : {token, {'NUMBER_LITERAL', TokenLine, TokenChars}}.

%% identifiers
(_[a-zA-Z_0-9]+)                                          : {token, {'IDENTIFIER', TokenLine, TokenChars}}.
([a-zA-Z][a-zA-Z_0-9]*)                                   : match_any(TokenChars, TokenLen, TokenLine, ?TokenPatterns).

%% string literals
(\"([^\"\r\n\\]|\\.)*\")                                  : {token, {'STRING_LITERAL', TokenLine, TokenChars}}.

% comments
((//).*[\n\r]?)                                           : skip_token.
((/\*)(.|\n|\r)*(\*/))                                    : skip_token.

%% punctuation
(,|{|}|\(|\)|;|_|=>|\[|\]|\.)                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(=|\|=|\^=|&=|<<=|>>=|>>>=|\+=|-=|\*=|/=|%=)              : {token, {list_to_atom(TokenChars), TokenLine}}.
(!|~|\+\+|--)                                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(\*\*|\*|/|%)                                             : {token, {list_to_atom(TokenChars), TokenLine}}.
(\||\^|&|<<|>>|>>>)                                       : {token, {list_to_atom(TokenChars), TokenLine}}.
(\+|-)                                                    : {token, {list_to_atom(TokenChars), TokenLine}}.
(<=|>=|<|>)                                               : {token, {list_to_atom(TokenChars), TokenLine}}.
(==|!=)                                                   : {token, {list_to_atom(TokenChars), TokenLine}}.
(&&|\|\||\?|:|\s)                                         : {token, {list_to_atom(TokenChars), TokenLine}}.

%% white space
([\n\r\s\t]+)                                             : skip_token.

Erlang code.

-export([reserved_keywords/0]).

-define(TokenPatterns, [

    {"^(?i)(ADDRESS)$",          'ADDRESS'},
    {"^(?i)(AFTER)$",            'AFTER'},
    {"^(?i)(AS)$",               'AS'},
    {"^(?i)(BOOL)$",             'BOOL'},
    {"^(?i)(BREAK)$",            'BREAK'},
    {"^(?i)(CONSTANT)$",         'CONSTANT'},
    {"^(?i)(CONTINUE)$",         'CONTINUE'},
    {"^(?i)(CONTRACT)$",         'CONTRACT'},
    {"^(?i)(DAYS)$",             'DAYS'},
    {"^(?i)(DELETE)$",           'DELETE'},
    {"^(?i)(ELSE)$",             'ELSE'},
    {"^(?i)(ENUM)$",             'ENUM'},
    {"^(?i)(ETHER)$",            'ETHER'},
    {"^(?i)(EVENT)$",            'EVENT'},
    {"^(?i)(EXTERNAL)$",         'EXTERNAL'},
    {"^(?i)(FALSE)$",            'FALSE'},
    {"^(?i)(FINNEY)$",           'FINNEY'},
    {"^(?i)(FOR)$",              'FOR'},
    {"^(?i)(FROM)$",             'FROM'},
    {"^(?i)(FUNCTION)$",         'FUNCTION'},
    {"^(?i)(HOURS)$",            'HOURS'},
    {"^(?i)(INTERNAL)$",         'INTERNAL'},
    {"^(?i)(IF)$",               'IF'},
    {"^(?i)(IMPORT)$",           'IMPORT'},
    {"^(?i)(INDEXED)$",          'INDEXED'},
    {"^(?i)(IS)$",               'IS'},
    {"^(?i)(LIBRARY)$",          'LIBRARY'},
    {"^(?i)(MAPPING)$",          'MAPPING'},
    {"^(?i)(MINUTES)$",          'MINUTES'},
    {"^(?i)(MODIFIER)$",         'MODIFIER'},
    {"^(?i)(NEW)$",              'NEW'},
    {"^(?i)(PRIVATE)$",          'PRIVATE'},
    {"^(?i)(PUBLIC)$",           'PUBLIC'},
    {"^(?i)(RETURN)$",           'RETURN'},
    {"^(?i)(RETURNS)$",          'RETURNS'},
    {"^(?i)(SECONDS)$",          'SECONDS'},
    {"^(?i)(STRING)$",           'STRING'},
    {"^(?i)(STRUCT)$",           'STRUCT'},
    {"^(?i)(SZABO)$",            'SZABO'},
    {"^(?i)(THROW)$",            'THROW'},
    {"^(?i)(TRUE)$",             'TRUE'},
    {"^(?i)(VAR)$",              'VAR'},
    {"^(?i)(WEEKS)$",            'WEEKS'},
    {"^(?i)(WEI)$",              'WEI'},
    {"^(?i)(WHILE)$",            'WHILE'},
    {"^(?i)(YEARS)$",            'YEARS'}
]).

% -define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

-ifdef(DEBUG).
-define(Dbg(F,A), io:format(user, "[~p] "++F++"~n", [?LINE|A])).
-else.
-define(Dbg(F,A), ok).
-endif.

reserved_keywords() -> [T || {_, T} <- ?TokenPatterns].

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
    end.

match_fixed(TokenChars, TokenLen) ->
    TokenCharsLower = string:to_lower(TokenChars),
    case TokenLen > 7 of
        true ->
            Pos7 = string:substr(TokenCharsLower, 7, 1);
        _ ->    
            Pos7 = []
    end,        
    case TokenLen > 8 of
        true ->
            Pos8 = string:substr(TokenCharsLower, 8, 1);
        _ ->    
            Pos8 = []
    end,        
    case TokenLen > 9 of
        true ->
            Pos9 = string:substr(TokenCharsLower, 9, 1);
        _ ->    
            Pos9 = []
    end,        
    case {Pos7, Pos8, Pos9} of
        {"x", _, _} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 6, 1)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 8));
        {_, "x", _} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 6, 2)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 9));
        {_, _, "x"} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 6, 3)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 10));
        _ ->    
            Size1 = 0,
            Size2 = 0
    end,
    case 256 - Size1 - Size2 >= 0 of
        true ->
            {token, {'FIXED', TokenLen, TokenCharsLower}};
        _ ->
            {token, {'IDENTIFIER', TokenLen, TokenChars}}
    end.

match_ufixed(TokenChars, TokenLen) ->
    TokenCharsLower = string:to_lower(TokenChars),
    case TokenLen > 8 of
        true ->
            Pos8 = string:substr(TokenCharsLower, 8, 1);
        _ ->    
            Pos8 = []
    end,        
    case TokenLen > 9 of
        true ->
            Pos9 = string:substr(TokenCharsLower, 9, 1);
        _ ->    
            Pos9 = []
    end,        
    case TokenLen > 10 of
        true ->
            Pos10 = string:substr(TokenCharsLower, 10, 1);
        _ ->    
            Pos10 = []
    end,        
    case {Pos8, Pos9, Pos10} of
        {"x", _, _} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 7, 1)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 9));
        {_, "x", _} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 7, 2)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 10));
        {_, _, "x"} ->
            {Size1, _} = string:to_integer(string:substr(TokenChars, 7, 3)), 
            {Size2, _} = string:to_integer(string:substr(TokenChars, 11));
        _ ->    
            Size1 = 0,
            Size2 = 0
    end,
    case 256 - Size1 - Size2 >= 0 of
        true ->
            {token, {'UFIXED', TokenLen, TokenCharsLower}};
        _ ->
            {token, {'IDENTIFIER', TokenLen, TokenChars}}
    end.
