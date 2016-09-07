%% -*- erlang -*-
Definitions.

Rules.

%% bytes
(([bB][yY][tT][eE])|([bB][yY][tT][eE][sS][1-9]?)|([bB][yY][tT][eE][sS][12][0-9])|([bB][yY][tT][eE][sS]3[0-2]))
                                                          : match_bytes(TokenChars, TokenLen).

%% ufixed
(([uU][fF][iI][xX][eE][dD])((0|8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248)(x|X)(8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : match_ufixed(TokenChars, TokenLen).

%% fixed
(([fF][iI][xX][eE][dD])((0|8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248)(x|X)(8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : match_fixed(TokenChars, TokenLen).

%% uint
(([uU][iI][nN][tT])((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : {token, {'UINT', TokenLine, TokenChars}}.

%% int
(([iI][nN][tT])((8|16|24|32|40|48|56|64|72|80|88|96|104|112|120|128|136|144|152|160|168|176|184|192|200|208|216|224|232|240|248|256))?)
                                                          : {token, {'INT', TokenLine, TokenChars}}.

%% number literals
((0x)?[0-9]+)                                             : {token, {'NUMBER_LITERAL', TokenLine, TokenChars}}.

%% identifiers
(_[a-zA-Z_0-9]+)                                          : {token, {'IDENTIFIER', TokenLine, TokenChars}}.
([a-zA-Z][a-zA-Z_0-9]*)                                   : match_any(TokenChars, TokenLen, TokenLine, ?TOKEN_PATTERNS).

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
(&&|\|\||\?|:)                                            : {token, {list_to_atom(TokenChars), TokenLine}}.

%% white space
([\n\r\s\t]+)                                             : skip_token.

Erlang code.

-export([reserved_keywords/0]).

-define(TOKEN_PATTERNS, [
    {"^(?i)(ADDRESS)$",          'ADDRESS'},
    {"^(?i)(ANONYMOUS)$",        'ANONYMOUS'},
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
    {"^(?i)(IF)$",               'IF'},
    {"^(?i)(IMPORT)$",           'IMPORT'},
    {"^(?i)(INDEXED)$",          'INDEXED'},
    {"^(?i)(INTERNAL)$",         'INTERNAL'},
    {"^(?i)(IS)$",               'IS'},
    {"^(?i)(LIBRARY)$",          'LIBRARY'},
    {"^(?i)(MAPPING)$",          'MAPPING'},
    {"^(?i)(MEMORY)$",           'MEMORY'},
    {"^(?i)(MINUTES)$",          'MINUTES'},
    {"^(?i)(MODIFIER)$",         'MODIFIER'},
    {"^(?i)(NEW)$",              'NEW'},
    {"^(?i)(PRAGMA)$",           'PRAGMA'},
    {"^(?i)(PRIVATE)$",          'PRIVATE'},
    {"^(?i)(PUBLIC)$",           'PUBLIC'},
    {"^(?i)(RETURN)$",           'RETURN'},
    {"^(?i)(RETURNS)$",          'RETURNS'},
    {"^(?i)(SECONDS)$",          'SECONDS'},
    {"^(?i)(STORAGE)$",          'STORAGE'},
    {"^(?i)(STRING)$",           'STRING'},
    {"^(?i)(STRUCT)$",           'STRUCT'},
    {"^(?i)(SZABO)$",            'SZABO'},
    {"^(?i)(THROW)$",            'THROW'},
    {"^(?i)(TRUE)$",             'TRUE'},
    {"^(?i)(USING)$",            'USING'},
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
