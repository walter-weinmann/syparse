%% -----------------------------------------------------------------------------
%%
%% syparse.yrl: Solidity - parser definition.
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
Header "%% Copyright (C) Walter Weinmann"
"%% @private"
"%% @Author Walter Weinmann".

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nonterminals
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 array_type_name
 assembly_assignment
 assembly_item
 assembly_item_commalist
 assembly_item_list
 assembly_label
 assembly_local_binding
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
 %% reduce/reduce elementary_type_name_expression
 enum_definition
 enum_value
 enum_value_commalist
 event_definition
 expression
 expression_commalist
 expression_list
 expression_statement
 for_statement
 function_call
 function_call_arguments
 function_definition
 function_definition_visibility
 function_definition_visibility_list
 function_type_name
 function_type_visibility_list
 functional_assembly_expression
 hex_literal
 identifier
 identifier_commalist
 identifier_dotlist
 identifier_expression
 identifier_expression_list
 identifier_list
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
 inline_assembly_block
 inline_assembly_statement
 mapping
 member_access
 modifier_definition
 modifier_invocation
 name_value_list
 new_expression
 number_literal
 number_unit
 parameter_list
 place_holder_statement
 pragma_directive
 primary_expression
 return
 simple_statement
 source_unit
 state_mutability
 state_variable_declaration
 statement
 statement_list
 storage_location
 string_literal
 struct_definition
 throw
 tuple_expression
 type_name
 type_name_commalist
 type_name_identifier
 type_name_identifier_commalist
 type_name_list
 unary_left
 unary_right
 user_defined_type_name
 using_for_declaration
 variable_declaration
 variable_declaration_semicolonlist
 variable_definition
 while_statement
 .

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Terminals
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ADDRESS
 ANONYMOUS
 AS
 ASSEMBLY
 BOOL
 BREAK
 BYTE
 CONSTANT
 CONTINUE
 CONTRACT
 DAYS
 DECIMAL_NUMBER
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
 HEX_NUMBER
 HOURS
 IDENTIFIER
 IF
 IMPORT
 INDEXED
 INT
 INTERFACE
 INTERNAL
 IS
 LET
 LIBRARY
 MAPPING
 MEMORY
 MINUTES
 MODIFIER
 NEW
 PAYABLE
 PRAGMA
 PRAGMA_DIRECTIVE
 PRIVATE
 PUBLIC
 PURE
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
 VIEW
 WEEKS
 WEI
 WHILE
 YEARS
 '!'
 '!='
 '%'
 '%='
 '&&'
 '&'
 '&='
 '('
 ')'
 '*'
 '**'
 '*='
 '+'
 '++'
 '+='
 ','
 '-'
 '--'
 '-='
 '.'
 '/'
 '/='
 ':'
 ':='
 ';'
 '<'
 '<<'
 '<<='
 '<='
 '='
 '=='
 '=>'
 '>'
 '>='
 '>>'
 '>>='
 '?'
 '['
 ']'
 '^'
 '^='
 '_'
 '{'
 '|'
 '|='
 '||'
 '}'
 '~'
.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rootsymbol
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 source_unit.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Endsymbol
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 '$end'.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Operator precedences.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nonassoc    0016 ','.                                   %% comma operator.

Right       0115 '=' '|=' '^=' '&=' '<<=' '>>='  '+=' '-=' '*=' '/=' '%=' ':='.
                                                        %% assignment operators.

Left        0214 '?' ':'.                               %% tenary operator.

Left        0313 '||'.                                  %% logical OR.

Left        0412 '&&'.                                  %% logical AND.

Left        0511 '==' '!='.                             %% equality operators.

Left        0610 '<' '>' '<=' '>='.                     %% inequality operators.

Left        0709 '|'.                                   %% bitwise OR.

Left        0808 '^'.                                   %% bitwise XOR.

Left        0907 '&'.                                   %% bitwise AND.

Left        1006 '<<' '>>'.                             %% bitwise shift operators.

Left        1105 '+' '-'.                               %% addition and subtraction.

Left        1204 '*' '/' '%'.                           %% multiplication, division and modulo.

Left        1303 '**'.                                  %% exponentation.

Left        1402 unary_left.

Right       1501 '(' ')'.
Right       1501 unary_right.

Left        1600 ELSE.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Grammar rules.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SourceUnit = (PragmaDirective | ImportDirective | ContractDefinition)*

source_unit -> contract_definition_import_pragma_directive_list                                 : {sourceUnit, '$1'}.

%% =============================================================================
%% Helper definitions - test purposes.
%% -----------------------------------------------------------------------------
% wwe source_unit -> function_type_name                                                               : '$1'.
%% =============================================================================

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
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
%% =============================================================================

%% PragmaDirective = 'pragma' Identifier ([^;]+) ';'

pragma_directive -> PRAGMA identifier PRAGMA_DIRECTIVE                                          : {pragmaDirective, '$2', unwrap('$3')}.

%% ImportDirective = 'import' StringLiteral ('as' Identifier)? ';'
%%         | 'import' ('*' | Identifier) ('as' Identifier)? 'from' StringLiteral ';'
%%         | 'import' '{' Identifier ('as' Identifier)? ( ',' Identifier ('as' Identifier)? )* '}' 'from' StringLiteral ';'

import_directive -> IMPORT string_literal                                          ';'          : {importDirective, '$2', [],   []}.
import_directive -> IMPORT string_literal AS identifier                            ';'          : {importDirective, '$2', '$4', []}.
import_directive -> IMPORT '*'                                 FROM string_literal ';'          : {importDirective, "*",  [],   '$4'}.
import_directive -> IMPORT '*'            AS identifier        FROM string_literal ';'          : {importDirective, "*",  '$4', '$6'}.
import_directive -> IMPORT identifier                          FROM string_literal ';'          : {importDirective, '$2', [],   '$4'}.
import_directive -> IMPORT identifier     AS identifier        FROM string_literal ';'          : {importDirective, '$2', '$4', '$6'}.
import_directive -> IMPORT '{' import_identifier_commalist '}' FROM string_literal ';'          : {importDirective, "{",  '$3', '$6'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
import_identifier -> identifier                                                                 : {'$1', []}.
import_identifier -> identifier AS identifier                                                   : {'$1', '$3'}.

import_identifier_commalist -> import_identifier                                                : ['$1'].
import_identifier_commalist -> import_identifier ',' import_identifier_commalist                : ['$1' | '$3'].
%% =============================================================================

%% ContractDefinition = ( 'contract' | 'library' | 'interface' ) Identifier
%%                      ( 'is' InheritanceSpecifier (',' InheritanceSpecifier )* )?
%%                      '{' ContractPart* '}'

contract_definition -> CONTRACT  identifier                                    '{'                    '}'
                                                                                                : {contractDefinition, "contract", '$2', [],   []}.
contract_definition -> CONTRACT  identifier                                    '{' contract_part_list '}'
                                                                                                : {contractDefinition, "contract", '$2', [],   '$4'}.
contract_definition -> CONTRACT  identifier IS inheritance_specifier_commalist '{'                    '}'
                                                                                                : {contractDefinition, "contract", '$2', '$4', []}.
contract_definition -> CONTRACT  identifier IS inheritance_specifier_commalist '{' contract_part_list '}'
                                                                                                : {contractDefinition, "contract", '$2', '$4', '$6'}.
contract_definition -> INTERFACE identifier                                    '{'                    '}'
                                                                                                : {contractDefinition, "interface",  '$2', [],   []}.
contract_definition -> INTERFACE identifier                                    '{' contract_part_list '}'
                                                                                                : {contractDefinition, "interface",  '$2', [],   '$4'}.
contract_definition -> INTERFACE identifier IS inheritance_specifier_commalist '{'                    '}'
                                                                                                : {contractDefinition, "interface",  '$2', '$4', []}.
contract_definition -> INTERFACE identifier IS inheritance_specifier_commalist '{' contract_part_list '}'
                                                                                                : {contractDefinition, "interface",  '$2', '$4', '$6'}.
contract_definition -> LIBRARY   identifier                                    '{'                    '}'
                                                                                                : {contractDefinition, "library",  '$2', [],   []}.
contract_definition -> LIBRARY   identifier                                    '{' contract_part_list '}'
                                                                                                : {contractDefinition, "library",  '$2', [],   '$4'}.
contract_definition -> LIBRARY   identifier IS inheritance_specifier_commalist '{'                    '}'
                                                                                                : {contractDefinition, "library",  '$2', '$4', []}.
contract_definition -> LIBRARY   identifier IS inheritance_specifier_commalist '{' contract_part_list '}'
                                                                                                : {contractDefinition, "library",  '$2', '$4', '$6'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
contract_part_list -> contract_part                                                             : ['$1'].
contract_part_list -> contract_part contract_part_list                                          : ['$1' | '$2'].

inheritance_specifier_commalist -> inheritance_specifier                                        : ['$1'].
inheritance_specifier_commalist -> inheritance_specifier ',' inheritance_specifier_commalist    : ['$1' | '$3'].
%% =============================================================================

%% ContractPart = StateVariableDeclaration | UsingForDeclaration
%%             | StructDefinition | ModifierDefinition | FunctionDefinition | EventDefinition | EnumDefinition

contract_part -> state_variable_declaration                                                     : {contractPart, '$1'}.
contract_part -> using_for_declaration                                                          : {contractPart, '$1'}.
contract_part -> struct_definition                                                              : {contractPart, '$1'}.
contract_part -> modifier_definition                                                            : {contractPart, '$1'}.
contract_part -> function_definition                                                            : {contractPart, '$1'}.
contract_part -> event_definition                                                               : {contractPart, '$1'}.
contract_part -> enum_definition                                                                : {contractPart, '$1'}.

%% InheritanceSpecifier = UserDefinedTypeName ( '(' Expression ( ',' Expression )* ')' )?

inheritance_specifier -> user_defined_type_name                                                 : {inheritanceSpecifier, '$1', []}.
inheritance_specifier -> user_defined_type_name '(' expression_commalist ')'                    : {inheritanceSpecifier, '$1', '$3'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
expression_commalist -> expression                                                              : ['$1'].
expression_commalist -> expression ',' expression_commalist                                     : ['$1' | '$3'].
% ---------------------------------------------------------------------------------------------------------------------

%% StateVariableDeclaration = TypeName ( 'public' | 'internal' | 'private' | 'constant' )? Identifier ('=' Expression)? ';'

state_variable_declaration -> type_name          identifier                ';'                  : {stateVariableDeclaration, '$1', [],         '$2', []}.
state_variable_declaration -> type_name          identifier '=' expression ';'                  : {stateVariableDeclaration, '$1', [],         '$2', '$4'}.
state_variable_declaration -> type_name PUBLIC   identifier                ';'                  : {stateVariableDeclaration, '$1', "public",   '$3', []}.
state_variable_declaration -> type_name INTERNAL identifier                ';'                  : {stateVariableDeclaration, '$1', "internal", '$3', []}.
state_variable_declaration -> type_name PRIVATE  identifier                ';'                  : {stateVariableDeclaration, '$1', "private",  '$3', []}.
state_variable_declaration -> type_name CONSTANT identifier                ';'                  : {stateVariableDeclaration, '$1', "private",  '$3', []}.
state_variable_declaration -> type_name PUBLIC   identifier '=' expression ';'                  : {stateVariableDeclaration, '$1', "public",   '$3', '$5'}.
state_variable_declaration -> type_name INTERNAL identifier '=' expression ';'                  : {stateVariableDeclaration, '$1', "internal", '$3', '$5'}.
state_variable_declaration -> type_name PRIVATE  identifier '=' expression ';'                  : {stateVariableDeclaration, '$1', "private",  '$3', '$5'}.
state_variable_declaration -> type_name CONSTANT identifier '=' expression ';'                  : {stateVariableDeclaration, '$1', "private",  '$3', '$5'}.

%% UsingForDeclaration = 'using' Identifier 'for' ('*' | TypeName) ';'

using_for_declaration -> USING identifier FOR '*'       ';'                                     : {usingForDeclaration, '$2', "*"}.
using_for_declaration -> USING identifier FOR type_name ';'                                     : {usingForDeclaration, '$2', '$4'}.

%% StructDefinition = 'struct' Identifier '{'
%%                     ( VariableDeclaration ';' (VariableDeclaration ';')* )? '}'

struct_definition -> STRUCT identifier '{'                                    '}'               : {structDefinition, '$2', []}.
struct_definition -> STRUCT identifier '{' variable_declaration_semicolonlist '}'               : {structDefinition, '$2', '$4'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
variable_declaration_semicolonlist -> variable_declaration ';'                                  : ['$1'].
variable_declaration_semicolonlist -> variable_declaration ';' variable_declaration_semicolonlist
                                                                                                : ['$1' | '$3'].
%% =============================================================================

%% ModifierDefinition = 'modifier' Identifier ParameterList? Block

modifier_definition -> MODIFIER identifier                block                                 : {modifierDefinition, '$2', [],   '$3'}.
modifier_definition -> MODIFIER identifier parameter_list block                                 : {modifierDefinition, '$2', '$3', '$4'}.

%% ModifierInvocation = Identifier ( '(' ExpressionList? ')' )?

modifier_invocation -> identifier                                                               : {modifierInvocation, '$1', []}.
modifier_invocation -> identifier '('                      ')'                                  : {modifierInvocation, '$1', "("}.
modifier_invocation -> identifier '(' expression_commalist ')'                                  : {modifierInvocation, '$1', '$3'}.

%% FunctionDefinition = 'function' Identifier? ParameterList
%%                      ( ModifierInvocation | StateMutability | 'external' | 'public' | 'internal' | 'private' )*
%%                      ( 'returns' ParameterList )? ( ';' | Block )

function_definition -> FUNCTION            parameter_list                                                            ';'
                                                                                                : {functionDefinition, [],   '$2', [],   [],   []}.
function_definition -> FUNCTION            parameter_list                                                            block
                                                                                                : {functionDefinition, [],   '$2', [],   [],   '$3'}.
function_definition -> FUNCTION            parameter_list                                     RETURNS parameter_list ';'
                                                                                                : {functionDefinition, [],   '$2', [],   '$4', []}.
function_definition -> FUNCTION            parameter_list                                     RETURNS parameter_list block
                                                                                                : {functionDefinition, [],   '$2', [],   '$4', '$5'}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list                        ';'
                                                                                                : {functionDefinition, [],   '$2', '$3', [],   []}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list                        block
                                                                                                : {functionDefinition, [],   '$2', '$3', [],   '$4'}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list RETURNS parameter_list ';'
                                                                                                : {functionDefinition, [],   '$2', '$3', '$5', []}.
function_definition -> FUNCTION            parameter_list function_definition_visibility_list RETURNS parameter_list block
                                                                                                : {functionDefinition, [],   '$2', '$3', '$5', '$6'}.
function_definition -> FUNCTION identifier parameter_list                                                            ';'
                                                                                                : {functionDefinition, '$2', '$3', [],   [],   []}.
function_definition -> FUNCTION identifier parameter_list                                                            block
                                                                                                : {functionDefinition, '$2', '$3', [],   [],   '$4'}.
function_definition -> FUNCTION identifier parameter_list                                     RETURNS parameter_list ';'
                                                                                                : {functionDefinition, '$2', '$3', [],   '$5', []}.
function_definition -> FUNCTION identifier parameter_list                                     RETURNS parameter_list block
                                                                                                : {functionDefinition, '$2', '$3', [],   '$5', '$6'}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list                        ';'
                                                                                                : {functionDefinition, '$2', '$3', '$4', [],   []}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list                        block
                                                                                                : {functionDefinition, '$2', '$3', '$4', [],   '$5'}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list RETURNS parameter_list ';'
                                                                                                : {functionDefinition, '$2', '$3', '$4', '$6', []}.
function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list RETURNS parameter_list block
                                                                                                : {functionDefinition, '$2', '$3', '$4', '$6', '$7'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
function_definition_visibility -> modifier_invocation                                           : '$1'.
function_definition_visibility -> state_mutability                                              : '$1'.
function_definition_visibility -> EXTERNAL                                                      : "external".
function_definition_visibility -> PUBLIC                                                        : "public".
function_definition_visibility -> INTERNAL                                                      : "internal".
function_definition_visibility -> PRIVATE                                                       : "private".

function_definition_visibility_list -> function_definition_visibility                           : ['$1'].
function_definition_visibility_list -> function_definition_visibility function_definition_visibility_list
                                                                                                : ['$1' | '$2'].
%% -----------------------------------------------------------------------------

%% EventDefinition = 'event' Identifier IndexedParameterList 'anonymous'? ';'

event_definition -> EVENT identifier indexed_parameter_list           ';'                       : {eventDefinition, '$2', '$3', []}.
event_definition -> EVENT identifier indexed_parameter_list ANONYMOUS ';'                       : {eventDefinition, '$2', '$3', "anonymous"}.

%% EnumValue = Identifier

enum_value -> identifier                                                                        : {enumValue, '$1'}.

%% EnumDefinition = 'enum' Identifier '{' EnumValue? (',' EnumValue)* '}'

enum_definition -> ENUM identifier '{'                      '}'                                 : {enumDefinition, '$2', []}.
enum_definition -> ENUM identifier '{' enum_value_commalist '}'                                 : {enumDefinition, '$2', '$4'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
enum_value_commalist -> enum_value                                                              : ['$1'].
enum_value_commalist -> enum_value ',' enum_value_commalist                                     : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% IndexedParameterList = '(' ( TypeName 'indexed'? Identifier? (',' TypeName 'indexed'? Identifier?)* )? ')'

indexed_parameter_list -> '('                             ')'                                   : {indexedParameterList, []}.
indexed_parameter_list -> '(' indexed_parameter_commalist ')'                                   : {indexedParameterList, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
indexed_parameter -> type_name                                                                  : {'$1', [],        []}.
indexed_parameter -> type_name         identifier                                               : {'$1', [],        '$2'}.
indexed_parameter -> type_name INDEXED                                                          : {'$1', "indexed", []}.
indexed_parameter -> type_name INDEXED identifier                                               : {'$1', "indexed", '$3'}.

indexed_parameter_commalist -> indexed_parameter                                                : ['$1'].
indexed_parameter_commalist -> indexed_parameter ',' indexed_parameter_commalist                : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% ParameterList =        '(' ( TypeName            Identifier? (',' TypeName            Identifier?)* )? ')'

parameter_list -> '('                                ')'                                        : {parameterList, []}.
parameter_list -> '(' type_name_identifier_commalist ')'                                        : {parameterList, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
%% reduce/reduce type_name_identifier -> type_name                                                               : {'$1', []}.
type_name_identifier -> type_name identifier                                                    : {'$1', '$2'}.

type_name_identifier_commalist -> type_name_identifier                                          : ['$1'].
type_name_identifier_commalist -> type_name_identifier ',' type_name_identifier_commalist       : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% TypeNameList =         '(' ( TypeName (',' TypeName )* )? ')'

%% reduce/reduce type_name_list -> '('                     ')'                                                   : {typeNameList, []}.
type_name_list -> '(' type_name_commalist ')'                                                   : {typeNameList, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
type_name_commalist -> type_name                                                                : ['$1'].
type_name_commalist -> type_name ',' type_name_commalist                                        : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% VariableDeclaration = TypeName StorageLocation? Identifier

variable_declaration -> type_name                  identifier                                   : {variableDeclaration, '$1', [],   '$2'}.
variable_declaration -> type_name storage_location identifier                                   : {variableDeclaration, '$1', '$2', '$3'}.

%% TypeName = ElementaryTypeName
%%          | UserDefinedTypeName
%%          | Mapping
%%          | ArrayTypeName
%%          | FunctionTypeName

type_name -> elementary_type_name                                                               : {typeName, '$1'}.
type_name -> user_defined_type_name                                                             : {typeName, '$1'}.
type_name -> mapping                                                                            : {typeName, '$1'}.
type_name -> array_type_name                                                                    : {typeName, '$1'}.
type_name -> function_type_name                                                                 : {typeName, '$1'}.

%% UserDefinedTypeName = Identifier ( '.' Identifier )*

user_defined_type_name -> identifier_dotlist                                                    : {userDefinedTypeName, '$1'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
identifier_dotlist -> identifier                                                                : ['$1'].
identifier_dotlist -> identifier '.' identifier_dotlist                                         : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% Mapping = 'mapping' '(' ElementaryTypeName '=>' TypeName ')'

mapping -> MAPPING '(' elementary_type_name '=>' type_name ')'                                  : {mapping, '$3', '$5'}.

%% ArrayTypeName = TypeName '[' Expression? ']'

array_type_name -> type_name '['            ']'                                                 : {arrayTypeName, '$1', []}.
array_type_name -> type_name '[' expression ']'                                                 : {arrayTypeName, '$1', '$3'}.

%% FunctionTypeName = 'function' TypeNameList ( 'internal' | 'external' | StateMutability )*
%%                    ( 'returns' TypeNameList )?

function_type_name -> FUNCTION type_name_list                                                   : {functionTypeName, '$2', [],   []}.
function_type_name -> FUNCTION type_name_list                               RETURNS type_name_list
                                                                                                : {functionTypeName, '$2', [],   '$4'}.
function_type_name -> FUNCTION type_name_list function_type_visibility_list                     : {functionTypeName, '$2', '$3', []}.
function_type_name -> FUNCTION type_name_list function_type_visibility_list RETURNS type_name_list
                                                                                                : {functionTypeName, '$2', '$3', '$5'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
function_type_visibility_list -> INTERNAL                                                       : ["internal"].
function_type_visibility_list -> EXTERNAL                                                       : ["external"].
function_type_visibility_list -> state_mutability                                               : ['$1'].
function_type_visibility_list -> INTERNAL          function_type_visibility_list                : ["internal" | '$2'].
function_type_visibility_list -> EXTERNAL          function_type_visibility_list                : ["external" | '$2'].
function_type_visibility_list -> state_mutability  function_type_visibility_list                : ['$1'       | '$2'].
%% -----------------------------------------------------------------------------

%% StorageLocation = 'memory' | 'storage'

storage_location -> MEMORY                                                                      : {storageLocation, "memory"}.
storage_location -> STORAGE                                                                     : {storageLocation, "storage"}.

%% StateMutability = 'pure' | 'constant' | 'view' | 'payable'

state_mutability -> PURE                                                                        : {stateMutability, "pure"}.
state_mutability -> CONSTANT                                                                    : {stateMutability, "constant"}.
state_mutability -> VIEW                                                                        : {stateMutability, "view"}.
state_mutability -> PAYABLE                                                                     : {stateMutability, "payable"}.

%% Block = '{' Statement* '}'

block -> '{'                '}'                                                                 : {block, []}.
block -> '{' statement_list '}'                                                                 : {block, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
statement_list -> statement                                                                     : ['$1'].
statement_list -> statement statement_list                                                      : ['$1' | '$2'].
%% =============================================================================

%% Statement = IfStatement | WhileStatement | ForStatement | Block | InlineAssemblyStatement |
%%             ( DoWhileStatement | PlaceholderStatement | Continue | Break | Return |
%%               Throw | SimpleStatement ) ';'

statement -> if_statement                                                                       : {statement, '$1'}.
statement -> while_statement                                                                    : {statement, '$1'}.
statement -> for_statement                                                                      : {statement, '$1'}.
statement -> block                                                                              : {statement, '$1'}.
statement -> inline_assembly_statement                                                          : {statement, '$1'}.
statement -> do_while_statement        ';'                                                      : {statement, '$1'}.
statement -> place_holder_statement    ';'                                                      : {statement, '$1'}.
statement -> continue                  ';'                                                      : {statement, '$1'}.
statement -> break                     ';'                                                      : {statement, '$1'}.
statement -> return                    ';'                                                      : {statement, '$1'}.
statement -> throw                     ';'                                                      : {statement, '$1'}.
statement -> simple_statement          ';'                                                      : {statement, '$1'}.

%% ExpressionStatement = Expression

expression_statement -> expression                                                              : {expressionStatement, '$1'}.

%% IfStatement = 'if' '(' Expression ')' Statement ( 'else' Statement )?

if_statement -> IF '(' expression ')' statement                                                 : {ifStatement, '$3', '$5', []}.
if_statement -> IF '(' expression ')' statement ELSE statement                                  : {ifStatement, '$3', '$5', '$7'}.

%% WhileStatement = 'while' '(' Expression ')' Statement

while_statement -> WHILE '(' expression ')' statement                                           : {whileStatement, '$3', '$5'}.

%% PlaceholderStatement = '_'

place_holder_statement -> '_'                                                                   : {placeHolderStatement, " _ "}.

%% SimpleStatement = VariableDefinition | ExpressionStatement

simple_statement -> variable_definition                                                         : {simpleStatement, '$1'}.
simple_statement -> expression_statement                                                        : {simpleStatement, '$1'}.

%% ForStatement = 'for' '(' (SimpleStatement)? ';' (Expression)? ';' (ExpressionStatement)? ')' Statement

for_statement -> FOR '('                  ';'            ';'            ')' statement           : {forStatement, [],   [],   [],   '$6'}.
for_statement -> FOR '('                  ';'            ';' expression ')' statement           : {forStatement, [],   [],   '$5', '$7'}.
for_statement -> FOR '('                  ';' expression ';'            ')' statement           : {forStatement, [],   '$4', [],   '$7'}.
for_statement -> FOR '('                  ';' expression ';' expression ')' statement           : {forStatement, [],   '$4', '$6', '$8'}.
for_statement -> FOR '(' simple_statement ';'            ';'            ')' statement           : {forStatement, '$3', [],   [],   '$7'}.
for_statement -> FOR '(' simple_statement ';'            ';' expression ')' statement           : {forStatement, '$3', [],   '$6', '$8'}.
for_statement -> FOR '(' simple_statement ';' expression ';'            ')' statement           : {forStatement, '$3', '$5', [],   '$8'}.
for_statement -> FOR '(' simple_statement ';' expression ';' expression ')' statement           : {forStatement, '$3', '$5', '$7', '$9'}.

%% InlineAssemblyStatement = 'assembly' StringLiteral? InlineAssemblyBlock

inline_assembly_statement -> ASSEMBLY                inline_assembly_block                      : {inlineAssemblyStatement, [],   '$2'}.
inline_assembly_statement -> ASSEMBLY string_literal inline_assembly_block                      : {inlineAssemblyStatement, '$2', '$3'}.

%% DoWhileStatement = 'do' Statement 'while' '(' Expression ')'

do_while_statement -> DO statement WHILE '(' expression ')'                                     : {doWhileStatement, '$2', '$5'}.

%% Continue = 'continue'

continue -> CONTINUE                                                                            : {continue, "continue"}.

%% Break = 'break'

break -> BREAK                                                                                  : {break, "break"}.

%% Return = 'return' Expression?

return -> RETURN                                                                                : {return, []}.
return -> RETURN expression                                                                     : {return, '$2'}.

%% Throw = 'throw'

throw -> THROW                                                                                  : {throw, "throw"}.

%% VariableDefinition = ('var' IdentifierList | VariableDeclaration) ( '=' Expression )?

variable_definition -> VAR identifier_list                                                      : {variableDefinition, '$2', []}.
variable_definition -> VAR identifier_list      '=' expression                                  : {variableDefinition, '$2', '$4'}.
variable_definition ->     variable_declaration                                                 : {variableDefinition, '$1', []}.
variable_definition ->     variable_declaration '=' expression                                  : {variableDefinition, '$1', '$3'}.

%% IdentifierList = '(' ( Identifier? ',' )* Identifier? ')'

identifier_list -> '('                      ')'                                                 : {identifierList, []}.
identifier_list -> '(' identifier_commalist ')'                                                 : {identifierList, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
identifier_commalist -> identifier                                                              : ['$1'].
identifier_commalist -> identifier ',' identifier_commalist                                     : ['$1' | '$3'].
%% =============================================================================

%% Expression
%%   = Expression ('++' | '--')
%%   | NewExpression
%%   | IndexAccess
%%   | MemberAccess
%%   | FunctionCall
%%   | '(' Expression ')'
%%   | ('!' | '~' | 'delete' | '++' | '--' | '+' | '-') Expression
%%   | Expression '**' Expression
%%   | Expression ('*' | '/' | '%') Expression
%%   | Expression ('+' | '-') Expression
%%   | Expression ('<<' | '>>') Expression
%%   | Expression '&' Expression
%%   | Expression '^' Expression
%%   | Expression '|' Expression
%%   | Expression ('<' | '>' | '<=' | '>=') Expression
%%   | Expression ('==' | '!=') Expression
%%   | Expression '&&' Expression
%%   | Expression '||' Expression
%%   | Expression '?' Expression ':' Expression
%%   | Expression ('=' | '|=' | '^=' | '&=' | '<<=' | '>>=' | '+=' | '-=' | '*=' | '/=' | '%=') Expression
%%   | PrimaryExpression

expression -> expression unary_right                                                            : {expression, [],   '$1', '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
unary_right -> '++'                                                                             : "++".
unary_right -> '--'                                                                             : "--".
%% -----------------------------------------------------------------------------

expression -> new_expression                                                                    : {expression, '$1'}.
expression -> index_access                                                                      : {expression, '$1'}.
expression -> member_access                                                                     : {expression, '$1'}.
expression -> function_call                                                                     : {expression, '$1'}.
expression -> '(' expression ')'                                                                : {expression, "(",  '$2'}.

expression -> unary_left expression                                                             : {expression, '$1', '$2', []}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
unary_left -> '!'                                                                               : "!".
unary_left -> '~'                                                                               : "~".
unary_left -> DELETE                                                                            : "delete".
unary_left -> '++'                                                                              : "++".
unary_left -> '--'                                                                              : "--".
unary_left -> '+'                                                                               : "+".
unary_left -> '-'                                                                               : "-".
%% -----------------------------------------------------------------------------

expression -> expression '**'  expression                                                       : {expression, '$1', "**",  '$3'}.

expression -> expression '*'   expression                                                       : {expression, '$1', "*",   '$3'}.
expression -> expression '/'   expression                                                       : {expression, '$1', "/",   '$3'}.
expression -> expression '%'   expression                                                       : {expression, '$1', "%",   '$3'}.

expression -> expression '+'   expression                                                       : {expression, '$1', "+",   '$3'}.
expression -> expression '-'   expression                                                       : {expression, '$1', "-",   '$3'}.

expression -> expression '<<'   expression                                                      : {expression, '$1', "<<",  '$3'}.
expression -> expression '>>'   expression                                                      : {expression, '$1', ">>",  '$3'}.

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

expression -> primary_expression                                                                : {expression, '$1'}.

%% PrimaryExpression = BooleanLiteral
%%                   | NumberLiteral
%%                   | HexLiteral
%%                   | StringLiteral
%%                   | TupleExpression
%%                   | Identifier
%%                   | ElementaryTypeNameExpression

primary_expression -> boolean_literal                                                           : {primaryExpression, '$1'}.
primary_expression -> number_literal                                                            : {primaryExpression, '$1'}.
primary_expression -> hex_literal                                                               : {primaryExpression, '$1'}.
primary_expression -> string_literal                                                            : {primaryExpression, '$1'}.
primary_expression -> tuple_expression                                                          : {primaryExpression, '$1'}.
%% reduce/reduce primary_expression -> identifier                                                                : {primaryExpression, '$1'}.
%% reduce/reduce primary_expression -> elementary_type_name_expression                                           : {primaryExpression, '$1'}.

%% ExpressionList = Expression ( ',' Expression )*

expression_list -> expression_commalist                                                         : {expressionList, '$1'}.

%% NameValueList = Identifier ':' Expression ( ',' Identifier ':' Expression )*

name_value_list -> identifier_expression_list                                                   : {nameValueList, '$1'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
identifier_expression_list -> identifier_expression                                             : ['$1'].
identifier_expression_list -> identifier_expression ',' identifier_expression_list              : ['$1' | '$3'].

identifier_expression -> identifier ':' expression                                              : {'$1', '$3'}.
%% -----------------------------------------------------------------------------

%% FunctionCall = Expression '(' FunctionCallArguments ')'

function_call -> expression '(' function_call_arguments ')'                                     : {functionCall, '$1', '$3'}.

%% FunctionCallArguments = '{' NameValueList? '}'
%%                       | ExpressionList?

function_call_arguments -> '{'                 '}'                                              : {functionCallArguments, []}.
function_call_arguments -> '{' name_value_list '}'                                              : {functionCallArguments, '$2'}.
function_call_arguments -> expression_list                                                      : {functionCallArguments, '$1'}.

%% NewExpression = 'new' TypeName

new_expression -> NEW type_name                                                                 : {newExpression, '$2'}.

%% MemberAccess = Expression '.' Identifier

member_access -> expression '.' identifier                                                      : {memberAccess, '$1', '$3'}.

%% IndexAccess = Expression '[' Expression? ']'

index_access -> expression '['            ']'                                                   : {indexAccess, '$1', []}.
index_access -> expression '[' expression ']'                                                   : {indexAccess, '$1', '$3'}.

%% BooleanLiteral = 'true' | 'false'

boolean_literal -> TRUE                                                                         : {booleanLiteral, "true"}.
boolean_literal -> FALSE                                                                        : {booleanLiteral, "false"}.

%% NumberLiteral = ( HexNumber | DecimalNumber ) (' ' NumberUnit)?

number_literal -> HEX_NUMBER                                                                    : {numberLiteral, unwrap('$1'), []}.
number_literal -> HEX_NUMBER     number_unit                                                    : {numberLiteral, unwrap('$1'), '$2'}.
number_literal -> DECIMAL_NUMBER                                                                : {numberLiteral, unwrap('$1'), []}.
number_literal -> DECIMAL_NUMBER number_unit                                                    : {numberLiteral, unwrap('$1'), '$2'}.

%% NumberUnit = 'wei' | 'szabo' | 'finney' | 'ether'
%%            | 'seconds' | 'minutes' | 'hours' | 'days' | 'weeks' | 'years'

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

%% HexLiteral = 'hex' ('"' ([0-9a-fA-F]{2})* '"' | '\'' ([0-9a-fA-F]{2})* '\'')

hex_literal -> HEX_LITERAL                                                                      : {hexLiteral, unwrap('$1')}.

%% StringLiteral = '"' ([^"\r\n\\] | '\\' .)* '"'

string_literal -> STRING_LITERAL                                                                : {stringLiteral, unwrap('$1')}.

%% Identifier = [a-zA-Z_$] [a-zA-Z_$0-9]*

identifier -> IDENTIFIER                                                                        : {identifier, unwrap('$1')}.

%% HexNumber = '0x' [0-9a-fA-F]+
%% DecimalNumber = [0-9]+

%% TupleExpression = '(' ( Expression ( ',' Expression )*  )? ')'
%%                 | '[' ( Expression ( ',' Expression )*  )? ']'

tuple_expression -> '('                 ')'                                                     : {tupleExpression, "(", []}.
tuple_expression -> '(' expression_list ')'                                                     : {tupleExpression, "(", '$2'}.
tuple_expression -> '['                 ']'                                                     : {tupleExpression, "[", []}.
tuple_expression -> '[' expression_list ']'                                                     : {tupleExpression, "[", '$2'}.

%% ElementaryTypeNameExpression = ElementaryTypeName

%% reduce/reduce elementary_type_name_expression -> elementary_type_name                                         : {elementaryTypeNameExpression, '$1'}.

%% ElementaryTypeName = 'address' | 'bool' | 'string' | 'var'
%%                    | Int | Uint | Byte | Fixed | Ufixed

elementary_type_name -> ADDRESS                                                                 : {elementaryTypeName, "address"}.
elementary_type_name -> BOOL                                                                    : {elementaryTypeName, "bool"}.
elementary_type_name -> STRING                                                                  : {elementaryTypeName, "string"}.
elementary_type_name -> VAR                                                                     : {elementaryTypeName, "var"}.
elementary_type_name -> INT                                                                     : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> UINT                                                                    : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> BYTE                                                                    : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> FIXED                                                                   : {elementaryTypeName, unwrap('$1')}.
elementary_type_name -> UFIXED                                                                  : {elementaryTypeName, unwrap('$1')}.

%% Int = 'int' | 'int8' | 'int16' | 'int24' | 'int32' | 'int40' | 'int48' | 'int56' | 'int64' | 'int72' | 'int80' | 'int88' | 'int96' | 'int104' | 'int112' | 'int120' | 'int128' | 'int136' | 'int144' | 'int152' | 'int160' | 'int168' | 'int176' | 'int184' | 'int192' | 'int200' | 'int208' | 'int216' | 'int224' | 'int232' | 'int240' | 'int248' | 'int256'

%% Uint = 'uint' | 'uint8' | 'uint16' | 'uint24' | 'uint32' | 'uint40' | 'uint48' | 'uint56' | 'uint64' | 'uint72' | 'uint80' | 'uint88' | 'uint96' | 'uint104' | 'uint112' | 'uint120' | 'uint128' | 'uint136' | 'uint144' | 'uint152' | 'uint160' | 'uint168' | 'uint176' | 'uint184' | 'uint192' | 'uint200' | 'uint208' | 'uint216' | 'uint224' | 'uint232' | 'uint240' | 'uint248' | 'uint256'

%% Byte = 'byte' | 'bytes' | 'bytes1' | 'bytes2' | 'bytes3' | 'bytes4' | 'bytes5' | 'bytes6' | 'bytes7' | 'bytes8' | 'bytes9' | 'bytes10' | 'bytes11' | 'bytes12' | 'bytes13' | 'bytes14' | 'bytes15' | 'bytes16' | 'bytes17' | 'bytes18' | 'bytes19' | 'bytes20' | 'bytes21' | 'bytes22' | 'bytes23' | 'bytes24' | 'bytes25' | 'bytes26' | 'bytes27' | 'bytes28' | 'bytes29' | 'bytes30' | 'bytes31' | 'bytes32'

%% Fixed = 'fixed' | ( 'fixed' DecimalNumber 'x' DecimalNumber )

%% Uixed = 'ufixed' | ( 'ufixed' DecimalNumber 'x' DecimalNumber )

%% InlineAssemblyBlock = '{' AssemblyItem* '}'

inline_assembly_block -> '{'                    '}'                                             : {inlineAssemblyBlock, []}.
inline_assembly_block -> '{' assembly_item_list '}'                                             : {inlineAssemblyBlock, '$2'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
assembly_item_list -> assembly_item                                                             : ['$1'].
assembly_item_list -> assembly_item assembly_item_list                                          : ['$1' | '$2'].
%% -----------------------------------------------------------------------------

%% AssemblyItem = Identifier | FunctionalAssemblyExpression | InlineAssemblyBlock | AssemblyLocalBinding | AssemblyAssignment | AssemblyLabel | NumberLiteral | StringLiteral | HexLiteral

assembly_item -> identifier                                                                     : {assemblyItem, '$1'}.
assembly_item -> functional_assembly_expression                                                 : {assemblyItem, '$1'}.
assembly_item -> inline_assembly_block                                                          : {assemblyItem, '$1'}.
assembly_item -> assembly_local_binding                                                         : {assemblyItem, '$1'}.
assembly_item -> assembly_assignment                                                            : {assemblyItem, '$1'}.
assembly_item -> assembly_label                                                                 : {assemblyItem, '$1'}.
assembly_item -> number_literal                                                                 : {assemblyItem, '$1'}.
assembly_item -> string_literal                                                                 : {assemblyItem, '$1'}.
assembly_item -> hex_literal                                                                    : {assemblyItem, '$1'}.

%% AssemblyLocalBinding = 'let' Identifier ':=' FunctionalAssemblyExpression

assembly_local_binding -> LET identifier ':=' functional_assembly_expression                    : {assemblyLocalBinding, '$2', '$4'}.

%% AssemblyAssignment = ( Identifier ':=' FunctionalAssemblyExpression ) | ( '=:' Identifier )

assembly_assignment ->            ':=' identifier                                               : {assemblyAssignment, [],   '$2'}.
assembly_assignment -> identifier ':=' functional_assembly_expression                           : {assemblyAssignment, '$1', '$3'}.

%% AssemblyLabel = Identifier ':'

assembly_label -> identifier ':'                                                                : {assemblyLabel, '$1'}.

%% FunctionalAssemblyExpression = Identifier '(' AssemblyItem? ( ',' AssemblyItem )* ')'

functional_assembly_expression -> identifier '('                         ')'                    : {functionalAssemblyExpression, '$1', []}.
functional_assembly_expression -> identifier '(' assembly_item_commalist ')'                    : {functionalAssemblyExpression, '$1', '$3'}.

%% =============================================================================
%% Helper definitions.
%% -----------------------------------------------------------------------------
assembly_item_commalist -> assembly_item                                                        : ['$1'].
assembly_item_commalist -> assembly_item ',' assembly_item_commalist                            : ['$1' | '$3'].
%% -----------------------------------------------------------------------------

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Expect 2.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Erlang code.

%% -----------------------------------------------------------------------------
%%
%% syparse.erl: Solidity - parser.
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

% parser and compiler interface
-export([
    is_reserved/1,
    pt_to_source_bu/1,
    pt_to_source_td/1,
    source_to_pt/1
]).

-define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

-define(Dbg(__Rule, __Production),
    begin
        io:format(user, "__ "??__Rule" (~p)~n", [__Production]),
        __Production
    end).

%% -----------------------------------------------------------------------------
%%  Parser helper functions.
%% -----------------------------------------------------------------------------

-spec is_reserved(binary() | atom() | list()) -> true
                                               | false.

is_reserved(Word) when is_binary(Word) ->
    is_reserved(erlang:binary_to_list(Word));
is_reserved(Word) when is_atom(Word) ->
    is_reserved(erlang:atom_to_list(Word));
is_reserved(Word) when is_list(Word) ->
    lists:member(erlang:list_to_atom(string:to_upper(Word)),
        sylexer:reserved_keywords()).

unwrap({_, _, X}) ->
    X.

%% -----------------------------------------------------------------------------
%% Compiler.
%% -----------------------------------------------------------------------------

-spec pt_to_source_bu(tuple()| list()) -> {error, term()}
                                        | binary().

pt_to_source_bu(PTree) ->
    fold_bu(fun(_, _) ->
        null_fun end, null_fun, PTree).

-spec pt_to_source_td(tuple()| list()) -> {error, term()}
                                        | binary().

pt_to_source_td(PTree) ->
    fold_td(fun(_, _) ->
        null_fun end, null_fun, PTree).

-spec fold_bu(fun(), term(), tuple()) -> {error, term()}
                                       | binary().

fold_bu(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_util:pt_to_source(bottom_up, Fun, Ctx, 0, PTree) of
        {error, _} = Error ->
            Error;
        {Cypher, null_fun = Ctx} ->
            list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} ->
            NewCtx
    catch
        _:Error ->
            {error, Error}
    end.

-spec fold_td(fun(), term(), tuple() | list()) -> {error, term()}
                                                | binary().

fold_td(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_util:pt_to_source(top_down, Fun, Ctx, 0, PTree) of
        {error, _} = Error ->
            Error;
        {Cypher, null_fun = Ctx} ->
            list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} ->
            NewCtx
    catch
        _:Error ->
            {error, Error}
    end.

%% -----------------------------------------------------------------------------
%% Parser.
%% -----------------------------------------------------------------------------

-spec source_to_pt(binary()|list()) -> {parse_error, term()}
                                     | {lex_error, term()}
                                     | {ok, {[tuple()], list()}}.

source_to_pt([]) ->
    {parse_error, invalid_string};
source_to_pt(<<>>) ->
    {parse_error, invalid_string};
source_to_pt(Cypher0) ->
    Cypher = re:replace(Cypher0, "(^[ \r\n]+)|([ \r\n]+$)", "",
        [global, {return, list}]),
    [C | _] = lists:reverse(Cypher),
    NCypher = if C =:= $; ->
        Cypher;
                  true ->
                      string:strip(Cypher)
              end,
    case sylexer:string(NCypher) of
        {ok, Toks, _} ->
            case syparse:parse(Toks) of
                {ok, PTree} ->
                    {ok, {PTree, Toks}};
                {error, {N, ?MODULE, ErrorTerms}} ->
                    {parse_error, {lists:flatten([integer_to_list(N), ": ", ErrorTerms]), Toks}};
                {error, Error} ->
                    {parse_error, {Error, Toks}}
            end;
        {error, Error, _} ->
            {lex_error, Error}
    end.
