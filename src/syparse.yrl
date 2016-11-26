%% -*- erlang -*-
Header "%% Copyright (C) Walter Weinmann"
"%% @private"
"%% @Author Walter Weinmann".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nonterminals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 array_type_name
 block
 boolean_literal
 break
 continue
 contract_definition
 contract_definition_import_pragma_directive_list
 contract_part
 contract_part_list
 do_while_statement
 elementary_type_name
 else_opt
 enum_definition
 enum_value
 enum_value_commalist
 event_definition
 expression
 expression_commalist
 expression_statement
 for_statement
 function_call
 function_definition
 function_definition_visibility
 function_definition_visibility_list
 hex_literal
 identifier
% identifier_expression
% identifier_expression_list
 if_statement
 import_directive
 import_identifier
 import_identifier_commalist
 index_access
 indexed_parameter
 indexed_parameter_commalist
 indexed_parameter_list
 inheritance_specifier
 inheritance_specifier_commalist
 mapping
 member_access
 modifier_definition
 new_expression
 number_literal
 number_unit
 parameter
 parameter_commalist
 parameter_list
 place_holder_statement
 pragma_directive
 primary_expression
 return
 simple_statement
 source_unit
 state_variable_declaration
 state_variable_declaration_visibility
 statement
 statement_list
 storage_location
 string_literal
 struct_definition
 throw
 type_name
 unary_left
 unary_right
 using_for_declaration
 variable_declaration
 variable_declaration_semicolonlist
 variable_definition
 while_statement
 .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Terminals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ADDRESS
 ANONYMOUS
 AS
 BOOL
 BREAK
 BYTE
 CONSTANT
 CONTINUE
 CONTRACT
 DAYS
 DELETE
 DO
 ELSE
 ENUM
 ETHER
 EVENT
 EXTERNAL
 FALSE
 FINNEY
 FIXED
 FOR
 FROM
 FUNCTION
 HEX_LITERAL
 HOURS
 IDENTIFIER
 IF
 IMPORT
 INDEXED
 INT
 INTERNAL
 IS
 LIBRARY
 MAPPING
 MEMORY
 MINUTES
 MODIFIER
 NEW
 NUMBER_LITERAL
 PRAGMA_DIRECTIVE
 PRIVATE
 PUBLIC
 RETURN
 RETURNS
 SECONDS
 STORAGE
 STRING
 STRING_LITERAL
 STRUCT
 SZABO
 THROW
 TRUE
 UFIXED
 UINT
 USING
 VAR
 WEEKS
 WEI
 WHILE
 YEARS
 ','
 '{'
 '}'
 '('
 ')'
 '_'
 ';'
 '=>'
 '['
 ']'
 '.'
 '='
 '|='
 '^='
 '&='
 '<<='
 '>>='
 '+='
 '-='
 '*='
 '/='
 '%='
 '!'
 '~'
 '++'
 '--'
 '**'
 '*'
 '/'
 '%'
 '|'
 '^'
 '&'
 '<<'
 '>>'
 '+'
 '-'
 '<='
 '>='
 '<'
 '>'
 '=='
 '!='
 '&&'
 '||'
 '?'
 ':'
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rootsymbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 source_unit.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Endsymbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 '$end'.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Operator precedences.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Right       0110 unary_right.                           %% postfix
Nonassoc    0120 function_call.
Nonassoc    0130 index_access.
Nonassoc    0140 member_access.
Nonassoc    0150 '(' ')'.                               %% Parentheses.

Left        0210 unary_left.                            %% prefix
Left        0240 '!'.                                   %% logical NOT.
Left        0250 '~'.                                   %% bitwise NOT.

Left        0300 '**'.                                  %% exponentation.

Left        0400 '*' '/' '%'.                           %% multiplication, division and modulo.

Left        0500 '+' '-'.                               %% addition and subtraction.

Left        0600 '<<' '>>'.                             %% bitwise shift operators.

Left        0700 '&'.                                   %% bitwise AND.

Left        0800 '^'.                                   %% bitwise XOR.

Left        0900 '|'.                                   %% bitwise OR.

Left        1000 '<' '>' '<=' '>='.                     %% inequality operators.

Left        1100 '==' '!='.                             %% equality operators.

Left        1200 '&&'.                                  %% logical AND.

Left        1300 '||'.                                  %% logical OR.

Left        1400 '?' ':'.                               %% tenary operator.

Right       1500 '=' '|=' '^=' '&=' '<<=' '>>='  '+=' '-=' '*=' '/=' '%='.
                                                        %% assignment operators.

Nonassoc    1600 ','.                                   %% comma operator.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Grammar rules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

source_unit -> contract_definition_import_pragma_directive_list                                 : {sourceUnit, '$1'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
contract_definition_import_pragma_directive_list ->                                                  import_directive
                                                                                                :         ['$1'].
contract_definition_import_pragma_directive_list ->                                                  contract_definition
                                                                                                :         ['$1'].
contract_definition_import_pragma_directive_list ->                                                  pragma_directive
                                                                                                :         ['$1'].
contract_definition_import_pragma_directive_list -> contract_definition_import_pragma_directive_list import_directive
                                                                                                : '$1' ++ ['$2'].
contract_definition_import_pragma_directive_list -> contract_definition_import_pragma_directive_list contract_definition
                                                                                                : '$1' ++ ['$2'].
contract_definition_import_pragma_directive_list -> contract_definition_import_pragma_directive_list pragma_directive
                                                                                                : '$1' ++ ['$2'].
%% =====================================================================================================================

pragma_directive -> PRAGMA_DIRECTIVE                                                            : {pragmaDirective, unwrap('$1')}.

import_directive -> IMPORT STRING_LITERAL                                          ';'          : {importDirective, unwrap('$2'), [],   []}.
import_directive -> IMPORT STRING_LITERAL AS identifier                            ';'          : {importDirective, unwrap('$2'), '$4', []}.
import_directive -> IMPORT '*'                                 FROM STRING_LITERAL ';'          : {importDirective, "*",          [],   unwrap('$4')}.
import_directive -> IMPORT '*'            AS identifier        FROM STRING_LITERAL ';'          : {importDirective, "*",          '$4', unwrap('$6')}.
import_directive -> IMPORT identifier                          FROM STRING_LITERAL ';'          : {importDirective, '$2',         [],   unwrap('$4')}.
import_directive -> IMPORT identifier     AS identifier        FROM STRING_LITERAL ';'          : {importDirective, '$2',         '$4', unwrap('$6')}.
import_directive -> IMPORT '{' import_identifier_commalist '}' FROM STRING_LITERAL ';'          : {importDirective, "{",          '$3', unwrap('$6')}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
import_identifier_commalist -> import_identifier                                                : ['$1'].
import_identifier_commalist -> import_identifier ',' import_identifier_commalist                : ['$1' | '$3'].

import_identifier -> identifier                                                                 : {'$1', []}.
import_identifier -> identifier AS identifier                                                   : {'$1', '$3'}.
%% =====================================================================================================================

contract_definition -> CONTRACT identifier                                    '{'                    '}'
                                                                                                : {contractDefinition, "contract", '$2', [],   []}.
contract_definition -> CONTRACT identifier                                    '{' contract_part_list '}'
                                                                                                : {contractDefinition, "contract", '$2', [],   '$4'}.
contract_definition -> CONTRACT identifier IS inheritance_specifier_commalist '{'                    '}'
                                                                                                : {contractDefinition, "contract", '$2', '$4', []}.
contract_definition -> CONTRACT identifier IS inheritance_specifier_commalist '{' contract_part_list '}'
                                                                                                : {contractDefinition, "contract", '$2', '$4', '$6'}.
contract_definition -> LIBRARY  identifier                                    '{'                    '}'
                                                                                                : {contractDefinition, "library",  '$2', [],   []}.
contract_definition -> LIBRARY  identifier                                    '{' contract_part_list '}'
                                                                                                : {contractDefinition, "library",  '$2', [],   '$4'}.
contract_definition -> LIBRARY  identifier IS inheritance_specifier_commalist '{'                    '}'
                                                                                                : {contractDefinition, "library",  '$2', '$4', []}.
contract_definition -> LIBRARY  identifier IS inheritance_specifier_commalist '{' contract_part_list '}'
                                                                                                : {contractDefinition, "library",  '$2', '$4', '$6'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
inheritance_specifier_commalist -> inheritance_specifier                                        : ['$1'].
inheritance_specifier_commalist -> inheritance_specifier ',' inheritance_specifier_commalist    : ['$1' | '$3'].

contract_part_list -> contract_part                                                             : ['$1'].
contract_part_list -> contract_part contract_part_list                                          : ['$1' | '$2'].
%% =====================================================================================================================

contract_part -> state_variable_declaration                                                     : {contractPart, '$1'}.
contract_part -> using_for_declaration                                                          : {contractPart, '$1'}.
contract_part -> struct_definition                                                              : {contractPart, '$1'}.
contract_part -> modifier_definition                                                            : {contractPart, '$1'}.
contract_part -> function_definition                                                            : {contractPart, '$1'}.
contract_part -> event_definition                                                               : {contractPart, '$1'}.
contract_part -> enum_definition                                                                : {contractPart, '$1'}.

inheritance_specifier -> identifier                                                             : {inheritanceSpecifier, '$1', []}.
inheritance_specifier -> identifier '(' expression_commalist ')'                                : {inheritanceSpecifier, '$1', '$3'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
expression_commalist -> expression                                                              : ['$1'].
%% =====================================================================================================================
%% reduce/reduce conflict
%%
% expression_commalist -> expression ',' expression_commalist                                     : ['$1' | '$3'].
% expression -> expression ',' expression                                                         : {expression, '$1', "," ,  '$3'}.
%%
%% =====================================================================================================================
expression_commalist -> expression ',' expression_commalist                                     : ['$1' | '$3'].
% ---------------------------------------------------------------------------------------------------------------------

state_variable_declaration -> type_name                                       identifier                ';'
                                                                                                : {stateVariableDeclaration, '$1', [],   '$2', []}.
state_variable_declaration -> type_name                                       identifier '=' expression ';'
                                                                                                : {stateVariableDeclaration, '$1', [],   '$2', '$4'}.
state_variable_declaration -> type_name state_variable_declaration_visibility identifier                ';'
                                                                                                : {stateVariableDeclaration, '$1', '$2', '$3', []}.
state_variable_declaration -> type_name state_variable_declaration_visibility identifier '=' expression ';'
                                                                                                : {stateVariableDeclaration, '$1', '$2', '$3', '$5'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
state_variable_declaration_visibility -> PUBLIC                                                 : "public".
state_variable_declaration_visibility -> INTERNAL                                               : "internal".
state_variable_declaration_visibility -> PRIVATE                                                : "private".
%% =====================================================================================================================

using_for_declaration -> USING identifier FOR '*'       ';'                                     : {usingForDeclaration, '$2', "*"}.
using_for_declaration -> USING identifier FOR type_name ';'                                     : {usingForDeclaration, '$2', '$4'}.

struct_definition -> STRUCT identifier '{'                                    '}'               : {structDefinition, '$2', []}.
struct_definition -> STRUCT identifier '{' variable_declaration_semicolonlist '}'               : {structDefinition, '$2', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
variable_declaration_semicolonlist -> variable_declaration ';'                                  : ['$1'].
variable_declaration_semicolonlist -> variable_declaration ';' variable_declaration_semicolonlist
                                                                                                : ['$1' | '$3'].
%% =====================================================================================================================

modifier_definition -> MODIFIER identifier                block                                 : {modifierDefinition, '$2', [],   '$3'}.
modifier_definition -> MODIFIER identifier parameter_list block                                 : {modifierDefinition, '$2', '$3', '$4'}.

function_definition -> FUNCTION            parameter_list                                                            block
                                                                                                : {functionDefinition, [],   '$2', [],   [],   '$3'}.
function_definition -> FUNCTION            parameter_list                                     RETURNS parameter_list block
                                                                                                : {functionDefinition, [],   '$2', [],   '$4', '$5'}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list                        block
                                                                                                : {functionDefinition, [],   '$2', '$3', [],   '$4'}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list RETURNS parameter_list block
                                                                                                : {functionDefinition, [],   '$2', '$3', '$5', '$6'}.
function_definition -> FUNCTION identifier parameter_list                                                            block
                                                                                                : {functionDefinition, '$2', '$3', [],   [],   '$4'}.
function_definition -> FUNCTION identifier parameter_list                                     RETURNS parameter_list block
                                                                                                : {functionDefinition, '$2', '$3', [],   '$5', '$6'}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list                        block
                                                                                                : {functionDefinition, '$2', '$3', '$4', [],   '$5'}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list RETURNS parameter_list block
                                                                                                : {functionDefinition, '$2', '$3', '$4', '$6', '$7'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
function_definition_visibility_list -> function_definition_visibility                           : ['$1'].
function_definition_visibility_list -> function_definition_visibility function_definition_visibility_list
                                                                                                : ['$1' | '$2'].

function_definition_visibility -> function_call                                                 : '$1'.
function_definition_visibility -> identifier                                                    : '$1'.
function_definition_visibility -> CONSTANT                                                      : "constant".
function_definition_visibility -> EXTERNAL                                                      : "external".
function_definition_visibility -> PUBLIC                                                        : "public".
function_definition_visibility -> INTERNAL                                                      : "internal".
function_definition_visibility -> PRIVATE                                                       : "private".
%% ---------------------------------------------------------------------------------------------------------------------

event_definition -> EVENT identifier indexed_parameter_list           ';'                       : {eventDefinition, '$2', '$3', []}.
event_definition -> EVENT identifier indexed_parameter_list ANONYMOUS ';'                       : {eventDefinition, '$2', '$3', "anonymous"}.

enum_value -> identifier                                                                        : {enumValue, '$1'}.

enum_definition -> ENUM identifier '{'                      '}'                                 : {enumDefinition, '$2', []}.
enum_definition -> ENUM identifier '{' enum_value_commalist '}'                                 : {enumDefinition, '$2', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
enum_value_commalist -> enum_value                                                              : ['$1'].
enum_value_commalist -> enum_value ',' enum_value_commalist                                     : ['$1' | '$3'].
%% ---------------------------------------------------------------------------------------------------------------------

indexed_parameter_list -> '('                             ')'                                   : {indexedParameterList, []}.
indexed_parameter_list -> '(' indexed_parameter_commalist ')'                                   : {indexedParameterList, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
indexed_parameter_commalist -> indexed_parameter                                                : ['$1'].
indexed_parameter_commalist -> indexed_parameter ',' indexed_parameter_commalist                : ['$1' | '$3'].

indexed_parameter -> type_name                                                                  : {'$1', [],        []}.
indexed_parameter -> type_name         identifier                                               : {'$1', [],        '$2'}.
indexed_parameter -> type_name INDEXED                                                          : {'$1', "indexed", []}.
indexed_parameter -> type_name INDEXED identifier                                               : {'$1', "indexed", '$3'}.
%% ---------------------------------------------------------------------------------------------------------------------

parameter_list -> '('                     ')'                                                   : {parameterList, []}.
parameter_list -> '(' parameter_commalist ')'                                                   : {parameterList, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
parameter_commalist -> parameter                                                                : ['$1'].
parameter_commalist -> parameter ',' parameter_commalist                                        : ['$1' | '$3'].

parameter -> type_name                                                                          : {'$1', []}.
parameter -> type_name identifier                                                               : {'$1', '$2'}.
%% ---------------------------------------------------------------------------------------------------------------------

variable_declaration -> type_name identifier                                                    : {variableDeclaration, '$1', '$2'}.

type_name -> elementary_type_name                                                               : {typeName, '$1', []}.

%% =====================================================================================================================
%% reduce / reduce conflict
%%
%type_name -> identifier                                                                         : {typeName, '$1', []}.
%primary_expression -> identifier                                                                : {primaryExpression, '$1'}.
%%
%% ---------------------------------------------------------------------------------------------------------------------
% type_name -> identifier                                                                         : {typeName, '$1', []}.
%% ---------------------------------------------------------------------------------------------------------------------

type_name -> identifier           storage_location                                              : {typeName, '$1', '$2'}.
type_name -> mapping                                                                            : {typeName, '$1', []}.
type_name -> array_type_name                                                                    : {typeName, '$1', []}.

mapping -> MAPPING '(' elementary_type_name '=>' type_name ')'                                  : {mapping, '$3', '$5'}.

array_type_name -> type_name                   '['            ']'                               : {arrayTypeName, '$1', [],   []}.
array_type_name -> type_name                   '[' expression ']'                               : {arrayTypeName, '$1', [],   '$3'}.
array_type_name -> type_name storage_location  '['            ']'                               : {arrayTypeName, '$1', '$2', []}.
array_type_name -> type_name storage_location  '[' expression ']'                               : {arrayTypeName, '$1', '$2', '$4'}.

storage_location -> MEMORY                                                                      : {storageLocation, "memory"}.
storage_location -> STORAGE                                                                     : {storageLocation, "storage"}.

block -> '{'                '}'                                                                 : {block, []}.
block -> '{' statement_list '}'                                                                 : {block, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
statement_list -> statement                                                                     : ['$1'].
statement_list -> statement statement_list                                                      : ['$1' | '$2'].
%% =====================================================================================================================

statement -> if_statement                                                                       : {statement, '$1'}.
statement -> while_statement                                                                    : {statement, '$1'}.
statement -> for_statement                                                                      : {statement, '$1'}.
statement -> block                                                                              : {statement, '$1'}.
statement -> do_while_statement     ';'                                                         : {statement, '$1'}.
statement -> place_holder_statement ';'                                                         : {statement, '$1'}.
statement -> continue               ';'                                                         : {statement, '$1'}.
statement -> break                  ';'                                                         : {statement, '$1'}.
statement -> return                 ';'                                                         : {statement, '$1'}.
statement -> throw                  ';'                                                         : {statement, '$1'}.
statement -> simple_statement       ';'                                                         : {statement, '$1'}.

expression_statement -> expression                                                              : {expressionStatement, '$1'}.

if_statement -> IF '(' expression ')' statement else_opt                                        : {ifStatement, '$3', '$5', '$6'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
else_opt -> '$empty'                                                                            : [].
else_opt -> ELSE statement                                                                      : '$2'.
%% =====================================================================================================================

while_statement -> WHILE '(' expression ')' statement                                           : {whileStatement, '$3', '$5'}.

place_holder_statement -> '_'                                                                   : {placeHolderStatement, " _ "}.

simple_statement -> variable_definition                                                         : {simpleStatement, '$1'}.
simple_statement -> expression_statement                                                        : {simpleStatement, '$1'}.

for_statement -> FOR '('                  ';'            ';'                      ')' statement : {forStatement, [],   [],   [],   '$6'}.
for_statement -> FOR '('                  ';'            ';' expression_statement ')' statement : {forStatement, [],   [],   '$5', '$7'}.
for_statement -> FOR '('                  ';' expression ';'                      ')' statement : {forStatement, [],   '$4', [],   '$7'}.
for_statement -> FOR '('                  ';' expression ';' expression_statement ')' statement : {forStatement, [],   '$4', '$6', '$8'}.
for_statement -> FOR '(' simple_statement ';'            ';'                      ')' statement : {forStatement, '$3', [],   [],   '$7'}.
for_statement -> FOR '(' simple_statement ';'            ';' expression_statement ')' statement : {forStatement, '$3', [],   '$6', '$8'}.
for_statement -> FOR '(' simple_statement ';' expression ';'                      ')' statement : {forStatement, '$3', '$5', [],   '$8'}.
for_statement -> FOR '(' simple_statement ';' expression ';' expression_statement ')' statement : {forStatement, '$3', '$5', '$7', '$9'}.

do_while_statement -> DO statement WHILE '(' expression ')'                                     : {doWhileStatement, '$2', '$5'}.

continue -> CONTINUE                                                                            : {continue, "continue"}.

break -> BREAK                                                                                  : {break, "break"}.

return -> RETURN                                                                                : {return, []}.
return -> RETURN expression                                                                     : {return, '$2'}.

throw -> THROW                                                                                  : {throw, "throw"}.

variable_definition -> variable_declaration                                                     : {variableDefinition, '$1', []}.
variable_definition -> variable_declaration '=' expression                                      : {variableDefinition, '$1', '$3'}.

expression -> expression unary_right                                                            : {expression, [],   '$1',     '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
unary_right -> '++'                                                                             : "++".
unary_right -> '--'                                                                             : "--".
unary_right -> '<<'                                                                             : "<<".
unary_right -> '>>'                                                                             : ">>".
%% ---------------------------------------------------------------------------------------------------------------------

expression -> function_call                                                                     : {expression, '$1'}.
expression -> index_access                                                                      : {expression, '$1'}.
expression -> member_access                                                                     : {expression, '$1'}.
expression -> '(' expression ')'                                                                : {expression, "(", '$2'}.

expression -> unary_left expression                                                             : {expression, [],   '$1',     '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
unary_left -> '!'                                                                               : "!".
unary_left -> '~'                                                                               : "~".
unary_left -> DELETE                                                                            : "delete".
unary_left -> '++'                                                                              : "++".
unary_left -> '--'                                                                              : "--".
unary_left -> '+'                                                                               : "+".
unary_left -> '-'                                                                               : "-".
%% ---------------------------------------------------------------------------------------------------------------------

expression -> expression '**'  expression                                                       : {expression, '$1', "**",  '$3'}.

expression -> expression '*'   expression                                                       : {expression, '$1', "*",   '$3'}.
expression -> expression '/'   expression                                                       : {expression, '$1', "/",   '$3'}.
expression -> expression '%'   expression                                                       : {expression, '$1', "%",   '$3'}.

expression -> expression '+'   expression                                                       : {expression, '$1', "+",   '$3'}.
expression -> expression '-'   expression                                                       : {expression, '$1', "-",   '$3'}.

expression -> expression '&'   expression                                                       : {expression, '$1', "&",   '$3'}.

expression -> expression '^'   expression                                                       : {expression, '$1', "^",   '$3'}.

expression -> expression '|'   expression                                                       : {expression, '$1', "|",   '$3'}.

expression -> expression '<'   expression                                                       : {expression, '$1', "<",   '$3'}.
expression -> expression '>'   expression                                                       : {expression, '$1', ">",   '$3'}.
expression -> expression '<='  expression                                                       : {expression, '$1', "<=",  '$3'}.
expression -> expression '>='  expression                                                       : {expression, '$1', ">=",  '$3'}.

expression -> expression '=='  expression                                                       : {expression, '$1', "==",  '$3'}.
expression -> expression '!='  expression                                                       : {expression, '$1', "!=",  '$3'}.

expression -> expression '&&'  expression                                                       : {expression, '$1', "&&",  '$3'}.
expression -> expression '||'  expression                                                       : {expression, '$1', "||",  '$3'}.

expression -> expression '?'   expression ':' expression                                        : {expression, '$1', "?", '$3', '$5'}.

expression -> expression '='   expression                                                       : {expression, '$1', "=",   '$3'}.
expression -> expression '|='  expression                                                       : {expression, '$1', "|=",  '$3'}.
expression -> expression '^='  expression                                                       : {expression, '$1', "^=",  '$3'}.
expression -> expression '&='  expression                                                       : {expression, '$1', "&=",  '$3'}.
expression -> expression '<<=' expression                                                       : {expression, '$1', "<<=", '$3'}.
expression -> expression '>>=' expression                                                       : {expression, '$1', ">>=", '$3'}.
expression -> expression '+='  expression                                                       : {expression, '$1', "+=",  '$3'}.
expression -> expression '-='  expression                                                       : {expression, '$1', "-=",  '$3'}.
expression -> expression '*='  expression                                                       : {expression, '$1', "*=",  '$3'}.
expression -> expression '/='  expression                                                       : {expression, '$1', "/=",  '$3'}.
expression -> expression '%='  expression                                                       : {expression, '$1', "%=",  '$3'}.

expression ->            ','   expression                                                       : {expression, [],   "," ,  '$2'}.

%% =====================================================================================================================
%% reduce/reduce conflict
%%
% expression_commalist -> expression ',' expression_commalist                                     : ['$1' | '$3'].
% expression -> expression ',' expression                                                         : {expression, '$1', "," ,  '$3'}.
%%
%% =====================================================================================================================
% expression -> expression ',' expression                                                         : {expression, '$1', "," ,  '$3'}.
%% =====================================================================================================================

expression -> primary_expression                                                                : {expression, '$1'}.

%% =====================================================================================================================
%% reduce / reduce conflict
%%
% type_name -> identifier                                                                         : {typeName, '$1', []}.
% primary_expression -> identifier                                                                : {primaryExpression, '$1'}.
%%
%% ---------------------------------------------------------------------------------------------------------------------
primary_expression -> identifier                                                                : {primaryExpression, '$1'}.
%% ---------------------------------------------------------------------------------------------------------------------
primary_expression -> boolean_literal                                                           : {primaryExpression, '$1'}.
primary_expression -> number_literal                                                            : {primaryExpression, '$1'}.
primary_expression -> hex_literal                                                               : {primaryExpression, '$1'}.
primary_expression -> string_literal                                                            : {primaryExpression, '$1'}.

function_call -> primary_expression                            '('                      ')'     : {functionCall, '$1', [],   []}.
function_call -> primary_expression                            '(' expression_commalist ')'     : {functionCall, '$1', [],   '$3'}.
function_call -> new_expression                                '('                      ')'     : {functionCall, '$1', [],   []}.
function_call -> new_expression                                '(' expression_commalist ')'     : {functionCall, '$1', [],   '$3'}.
function_call -> type_name                                     '('                      ')'     : {functionCall, '$1', [],   []}.
function_call -> type_name                                     '(' expression_commalist ')'     : {functionCall, '$1', [],   '$3'}.
% function_call -> primary_expression identifier_expression_list '('                      ')'     : {functionCall, '$1', '$2', []}.
% function_call -> primary_expression identifier_expression_list '(' expression_commalist ')'     : {functionCall, '$1', '$2', '$4'}.
% function_call -> new_expression     identifier_expression_list '('                      ')'     : {functionCall, '$1', '$2', []}.
% function_call -> new_expression     identifier_expression_list '(' expression_commalist ')'     : {functionCall, '$1', '$2', '$4'}.
% function_call -> type_name          identifier_expression_list '('                      ')'     : {functionCall, '$1', '$2', []}.
% function_call -> type_name          identifier_expression_list '(' expression_commalist ')'     : {functionCall, '$1', '$2', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
% identifier_expression_list -> identifier_expression                                             : ['$1'].
% identifier_expression_list -> identifier_expression identifier_expression_list                  : ['$1' | '$2'].

% identifier_expression -> '.' identifier                                                         : '$2'.
% identifier_expression -> '[' expression ']'                                                     : '$2'.
%% ---------------------------------------------------------------------------------------------------------------------

new_expression -> NEW identifier                                                                : {newExpression, '$2'}.

member_access -> expression '.' identifier                                                      : {memberAccess, '$1', '$3'}.

index_access -> expression '['            ']'                                                   : {indexAccess, '$1', []}.
index_access -> expression '[' expression ']'                                                   : {indexAccess, '$1', '$3'}.

boolean_literal -> TRUE                                                                         : {booleanLiteral, "true"}.
boolean_literal -> FALSE                                                                        : {booleanLiteral, "false"}.

number_literal -> NUMBER_LITERAL                                                                : {numberLiteral, unwrap('$1'), []}.
number_literal -> NUMBER_LITERAL number_unit                                                    : {numberLiteral, unwrap('$1'), '$2'}.

number_unit -> WEI                                                                              : {numberUnit, "wei"}.
number_unit -> SZABO                                                                            : {numberUnit, "szabo"}.
number_unit -> FINNEY                                                                           : {numberUnit, "finney"}.
number_unit -> ETHER                                                                            : {numberUnit, "ether"}.
number_unit -> SECONDS                                                                          : {numberUnit, "seconds"}.
number_unit -> MINUTES                                                                          : {numberUnit, "minutes"}.
number_unit -> HOURS                                                                            : {numberUnit, "hours"}.
number_unit -> DAYS                                                                             : {numberUnit, "days"}.
number_unit -> WEEKS                                                                            : {numberUnit, "weeks"}.
number_unit -> YEARS                                                                            : {numberUnit, "years"}.

hex_literal -> HEX_LITERAL                                                                      : {hexLiteral, unwrap('$1')}.

string_literal -> STRING_LITERAL                                                                : {stringLiteral, unwrap('$1')}.

identifier -> IDENTIFIER                                                                        : {identifier, unwrap('$1')}.

elementary_type_name -> ADDRESS                                                                 : {elementaryTypeName, "address"}.
elementary_type_name -> BOOL                                                                    : {elementaryTypeName, "bool"}.
elementary_type_name -> STRING                                                                  : {elementaryTypeName, "string"}.
elementary_type_name -> VAR                                                                     : {elementaryTypeName, "var"}.
elementary_type_name -> INT                                                                     : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> UINT                                                                    : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> BYTE                                                                    : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> FIXED                                                                   : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> UFIXED                                                                  : {elementaryTypeName, unwrap('$1')}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Expect 2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Erlang code.

-behaviour(application).
-behaviour(supervisor).

% application callbacks
-export([start/0, start/2, stop/1, stop/0]).

% Supervisor callbacks
-export([init/1]).

% parser and compiler interface
-export([fold/3,
         fold_bu/3,
         fold_td/3,
         is_reserved/1,
         parsetree/1,
         parsetree_to_string/1,
         parsetree_to_string_bu/1,
         parsetree_to_string_td/1,
         parsetree_with_tokens/1
        ]).

-define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

-define(Dbg(__Rule, __Production),
begin
    io:format(user, "__ "??__Rule" (~p)~n", [__Production]),
    __Production
end).

%%-----------------------------------------------------------------------------
%%                          dummy application interface
%%-----------------------------------------------------------------------------

start() ->
    application:start(?MODULE).
stop() ->
    application:stop(?MODULE).

start(_Type, _Args) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) ->
    ok.

init([]) ->
     {ok, { {one_for_one, 5, 10}, []} }.

%%-----------------------------------------------------------------------------
%%                          parser helper functions
%%-----------------------------------------------------------------------------

unwrap({_,_,X}) ->
    X.

%%-----------------------------------------------------------------------------

%%-----------------------------------------------------------------------------
%%                                  PARSER
%%-----------------------------------------------------------------------------
-spec parsetree(binary()|list()) ->
    {parse_error, term()} | {lex_error, term()} | {ok, [tuple()]}.
parsetree(Cypher) ->
   case parsetree_with_tokens(Cypher) of
       {ok, {ParseTree, _Tokens}} -> {ok, ParseTree};
       Error -> Error
   end.

-spec parsetree_with_tokens(binary()|list()) ->
    {parse_error, term()} | {lex_error, term()} | {ok, {[tuple()], list()}}.
parsetree_with_tokens([]) -> {parse_error, invalid_string};
parsetree_with_tokens(<<>>) -> {parse_error, invalid_string};
parsetree_with_tokens(Cypher0) ->
    Cypher = re:replace(Cypher0, "(^[ \r\n]+)|([ \r\n]+$)", "",
                     [global, {return, list}]),
    [C|_] = lists:reverse(Cypher),
    NCypher = if C =:= $; -> Cypher; true -> string:strip(Cypher) end,
    case sylexer:string(NCypher) of
        {ok, Toks, _} ->
            case syparse:parse(Toks) of
                {ok, PTree} -> {ok, {PTree, Toks}};
                {error,{N,?MODULE,ErrorTerms}} ->
                    {parse_error, {lists:flatten([integer_to_list(N), ": ", ErrorTerms]), Toks}};
                {error,Error} -> {parse_error, {Error, Toks}}
            end;
        {error,Error,_} -> {lex_error, Error}
    end.

-spec is_reserved(binary() | atom() | list()) ->
    true | false.
is_reserved(Word) when is_binary(Word) ->
    is_reserved(erlang:binary_to_list(Word));
is_reserved(Word) when is_atom(Word) ->
    is_reserved(erlang:atom_to_list(Word));
is_reserved(Word) when is_list(Word) ->
    lists:member(erlang:list_to_atom(string:to_upper(Word)),
                 sylexer:reserved_keywords()).

%%-----------------------------------------------------------------------------

%%-----------------------------------------------------------------------------
%%                                  COMPILER
%%-----------------------------------------------------------------------------

-spec parsetree_to_string(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string(PTree) ->
    parsetree_to_string_td(PTree).

-spec parsetree_to_string_bu(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string_bu(PTree) ->
    fold_bu(fun(_,_) -> null_fun end, null_fun, PTree).

-spec parsetree_to_string_td(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string_td(PTree) ->
    fold_td(fun(_,_) -> null_fun end, null_fun, PTree).

-spec fold(fun(), term(), tuple()) ->
    {error, term()} | binary().
fold(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    fold_td(Fun, Ctx, PTree).

-spec fold_bu(fun(), term(), tuple()) ->
    {error, term()} | binary().
fold_bu(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_fold:fold(bottom_up, Fun, Ctx, 0, PTree) of
        {error,_} = Error -> Error;
        {Cypher, null_fun = Ctx} -> list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} -> NewCtx
    catch
        _:Error -> {error, Error}
    end.

-spec fold_td(fun(), term(), tuple() | list()) ->
    {error, term()} | binary().
fold_td(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_fold:fold(top_down, Fun, Ctx, 0, PTree) of
        {error,_} = Error -> Error;
        {Cypher, null_fun = Ctx} ->
            list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} ->
            NewCtx
    catch
        _:Error -> {error, Error}
    end.