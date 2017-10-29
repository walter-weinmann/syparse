%% -----------------------------------------------------------------------------
%%
%% syparse_generator.erl: Solidity - test data generator.
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

-module(syparse_generator).

-export([generate/0]).

-define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").
-include("syparse_generator.hrl").

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generate Test Data.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generate() ->
    file:delete(?CODE_TEMPLATES),

    dets:open_file(?CODE_TEMPLATES, [
        {auto_save, 0}
    ]),

    create_code(),

    %% Common tests ............................................................

    ok = file_create_ct_all("performance", "complete_", "compacted", ?ALL_CLAUSE_CT_PERFORMANCE),

    ok = file_create_ct_all("reliability", "complete_", "compacted", ?ALL_CLAUSE_CT_RELIABILITY),
    ok = file_create_ct_all("reliability", "complete_", "compacted", [referenceExamples]),
    ok = file_create_ct_all("reliability", "complete_", "compacted", [special]),
%%    ok = file_create_ct_all("reliability", "contract_", "compacted", ?ALL_CLAUSE_CT_RELIABILITY_CONTRACT_PART),
    ok = file_create_ct_all("reliability", "contract_", "detailed", ?ALL_CLAUSE_CT_RELIABILITY_CONTRACT_PART),
%%    ok = file_create_ct_all("reliability", "statement", "compacted", ?ALL_CLAUSE_CT_RELIABILITY_STATEMENT),
    ok = file_create_ct_all("reliability", "statement", "detailed", ?ALL_CLAUSE_CT_RELIABILITY_STATEMENT),

    %% EUnit tests .............................................................

    ok = file_create_eunit_all("performance", "complete_", [referenceExamples]),
    ok = file_create_eunit_all("performance", "complete_", [special]),

    ok = file_create_eunit_all("reliability", "complete_", ?ALL_CLAUSE_EUNIT),
    ok = file_create_eunit_all("reliability", "complete_", ?ALL_CLAUSE_EUNIT_RELIABILITY),
    ok = file_create_eunit_all("reliability", "contract_", ?ALL_CLAUSE_EUNIT_CONTRACT_PART),
    ok = file_create_eunit_all("reliability", "statement", ?ALL_CLAUSE_EUNIT_STATEMENT),

    dets:close(?CODE_TEMPLATES).

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Creating code base.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code() ->

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 01
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(booleanLiteral),
    create_code(break),
    create_code(byte),
    create_code(continue),
    create_code(decimalNumber),
    create_code(hexLiteral),
    create_code(hexNumber),
    create_code(identifier),
    create_code(int),
    create_code(numberUnit),
    create_code(placeholderStatement),
    create_code(pragma_directive),
    create_code(referenceExamples),
    create_code(special),
    create_code(stateMutability),
    create_code(storageLocation),
    create_code(stringLiteral),
    create_code(throw),
    create_code(uInt),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 02
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(assemblyLabel),
    create_code(enumDefinition),
    create_code(fixed),
    create_code(identifierList),
    create_code(importDirective),
    create_code(numberLiteral),
    create_code(pragmaDirective),
    create_code(uFixed),
    create_code(userDefinedTypeName),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 03
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(elementaryTypeName),
    create_code(pragmaDirective),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 04
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(expression),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 05
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(arrayTypeName),
    create_code(expressionList),
    create_code(indexAccess),
    create_code(indexedParameterList),
    create_code(inheritanceSpecifier),
    create_code(mapping),
    create_code(memberAccess),
    create_code(nameValueList),
    create_code(newExpression),
    create_code(parameterList),
    create_code(return),
    create_code(stateVariableDeclaration),
    create_code(tupleExpression),
    create_code(typeNameList),
    create_code(usingForDeclaration),
    create_code(variableDeclaration),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 06
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(eventDefinition),
    create_code(functionCallArguments),
    create_code(functionTypeName),
    create_code(modifierInvocation),
    create_code(structDefinition),
    create_code(variableDefinition),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 07
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(functionCall),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 14
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(expression),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 15
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(arrayTypeName),
    create_code(expressionList),
    create_code(indexAccess),
    create_code(indexedParameterList),
    create_code(inheritanceSpecifier),
    create_code(mapping),
    create_code(memberAccess),
    create_code(nameValueList),
    create_code(newExpression),
    create_code(parameterList),
    create_code(return),
    create_code(stateVariableDeclaration),
    create_code(tupleExpression),
    create_code(typeNameList),
    create_code(usingForDeclaration),
    create_code(variableDeclaration),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 16
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(eventDefinition),
    create_code(functionCallArguments),
    create_code(functionTypeName),
    create_code(modifierInvocation),
    create_code(structDefinition),
    create_code(variableDefinition),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 17
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(functionCall),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 21
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(doWhileStatement),
    create_code(forStatement),
    create_code(ifStatement),
    create_code(whileStatement),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 22
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(block),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 31
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(doWhileStatement),
    create_code(forStatement),
    create_code(ifStatement),
    create_code(whileStatement),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 32
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(block),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 41
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(functionalAssemblyExpression),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 42
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(assemblyAssignment),
    create_code(assemblyLocalBinding),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 43
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(inlineAssemblyBlock),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 44
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(inlineAssemblyStatement),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 51
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(functionalAssemblyExpression),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 52
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(assemblyAssignment),
    create_code(assemblyLocalBinding),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 53
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(inlineAssemblyBlock),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 54
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(inlineAssemblyStatement),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 61
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(block),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 62
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(modifierDefinition),
    create_code(functionDefinition),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 63
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(contractDefinition),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level 64
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    create_code(sourceUnit),

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Level ???
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    ok.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ArrayTypeName = TypeName '[' Expression? ']'
%% -----------------------------------------------------------------------------
%% TypeName = ... ArrayTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(arrayTypeName = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
        lists:append([
            lists:nth(rand:uniform(TypeName_Length), TypeName),
            "[",
            lists:nth(rand:uniform(Expression_Length), Expression),
            "]"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AssemblyAssignment = ( Identifier ':=' FunctionalAssemblyExpression ) | ( '=:' Identifier )%%
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... AssemblyAssignment ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(assemblyAssignment = Rule) ->
    ?CREATE_CODE_START,
    [{functionalAssemblyExpression, FunctionalAssemblyExpression}] = dets:lookup(?CODE_TEMPLATES, functionalAssemblyExpression),
    FunctionalAssemblyIdentifier_Length = length(FunctionalAssemblyExpression),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [
        case rand:uniform(2) rem 2 of
            1 -> lists:append([
                lists:nth(rand:uniform(Identifier_Length), Identifier),
                ":=",
                lists:nth(rand:uniform(FunctionalAssemblyIdentifier_Length), FunctionalAssemblyExpression)
            ]);
            _ -> ":=" ++
            lists:nth(rand:uniform(Identifier_Length), Identifier)
        end
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AssemblyLabel = Identifier ':'
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... AssemblyLabel ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(assemblyLabel = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [lists:nth(rand:uniform(Identifier_Length), Identifier) ++
        ":"
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AssemblyLocalBinding = 'LET' Identifier ':=' FunctionalAssemblyExpression -----------------------------------------------------------------------------
%% AssemblyItem = ... AssemblyAssignment ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(assemblyLocalBinding = Rule) ->
    ?CREATE_CODE_START,
    [{functionalAssemblyExpression, FunctionalAssemblyExpression}] = dets:lookup(?CODE_TEMPLATES, functionalAssemblyExpression),
    FunctionalAssemblyIdentifier_Length = length(FunctionalAssemblyExpression),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [
        lists:append([
            "Let ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            ":=",
            lists:nth(rand:uniform(FunctionalAssemblyIdentifier_Length), FunctionalAssemblyExpression)
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Block = '{' Statement* '}'
%% -----------------------------------------------------------------------------
%% Statement = ... Block ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(block = Rule) ->
    ?CREATE_CODE_START,
    [{statement, Statement}] = dets:lookup(?CODE_TEMPLATES, statement),
    Statement_Length = length(Statement),

    Code =
        ["{}"] ++
        [
            lists:append([
                "{",
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement)
                    ]);
                    3 -> lists:append([
                        lists:nth(rand:uniform(Statement_Length), Statement),
                        " ",
                        lists:nth(rand:uniform(Statement_Length), Statement)
                    ]);
                    _ ->
                        lists:nth(rand:uniform(Statement_Length), Statement)
                end,
                "}"
            ])
            || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
        ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BooleanLiteral = 'true' | 'false'
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... BooleanLiteral ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(booleanLiteral = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "True",
        "False"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Break = 'break'
%% -----------------------------------------------------------------------------
%% Statement = ... Break ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(break = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Break;"
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Byte = 'byte' | 'bytes' | 'bytes1' | 'bytes2' | 'bytes3' | 'bytes4' | 'bytes5' | 'bytes6' | 'bytes7' | 'bytes8' | 'bytes9' | 'bytes10' | 'bytes11' | 'bytes12' | 'bytes13' | 'bytes14' | 'bytes15' | 'bytes16' | 'bytes17' | 'bytes18' | 'bytes19' | 'bytes20' | 'bytes21' | 'bytes22' | 'bytes23' | 'bytes24' | 'bytes25' | 'bytes26' | 'bytes27' | 'bytes28' | 'bytes29' | 'bytes30' | 'bytes31' | 'bytes32'
%% -----------------------------------------------------------------------------
%% ElementaryTypeName = ... Byte ..
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression ...        reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(byte = Rule) ->
    ?CREATE_CODE_START,

    Code = ?BYTE,
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(elementaryTypeName, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Continue = 'continue'
%% -----------------------------------------------------------------------------
%% Statement = ... Continue ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(continue = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Continue;"
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ContractDefinition = ( 'CONTRACT' | 'LIBRARY' | 'INTERFACE' ) Identifier
%%                        ( 'IS' InheritanceSpecifier (',' InheritanceSpecifier )* )?
%%                        '{' ContractPart* '}'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(contractDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{contractPart, ContractPart}] = dets:lookup(?CODE_TEMPLATES, contractPart),
    ContractPart_Length = length(ContractPart),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{inheritanceSpecifier, InheritanceSpecifier}] = dets:lookup(?CODE_TEMPLATES, inheritanceSpecifier),
    InheritanceSpecifier_Length = length(InheritanceSpecifier),

    Code = [
        lists:append([
            case rand:uniform(4) rem 4 of
                1 -> "Contract ";
                2 -> "Library ";
                _ -> "Interface "
            end,
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            case rand:uniform(4) rem 4 of
                1 -> [];
                _ -> " Is " ++
                case rand:uniform(3) rem 3 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier),
                        ",",
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier),
                        ",",
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier),
                        ",",
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier)
                    ]);
                    _ ->
                        lists:nth(rand:uniform(InheritanceSpecifier_Length), InheritanceSpecifier)
                end
            end,
            "{",
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart)
                ]);
                3 -> lists:append([
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart),
                    " ",
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart)
                ]);
                _ ->
                    lists:nth(rand:uniform(ContractPart_Length), ContractPart)
            end,
            "}"
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DecimalNumber = [0-9]+
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(decimalNumber = Rule) ->
    ?CREATE_CODE_START,

    DecimalNumberBase = [
        "0",
        "1",
        "0101",
        "103",
        "00107",
        "113",
        "000127",
        "131",
        "137",
        "139",
        "1521",
        "1622",
        "1723",
        "1824",
        "9999",
        "10001",
        "21357",
        "31753",
        "53135",
        "65535",
        "654321",
        "3134199",
        "87654197",
        "373456193",
        "41987654191",
        "4334567891181",
        "471110987654179",
        "53345678910111173",
        "5913121110987654167",
        "613456789101112131163",
        "67151413121110987654157"
    ],

    Code = lists:append([
        DecimalNumberBase,
        [integer_to_list(17 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(19 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(23 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(29 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(31 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(37 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(41 * list_to_integer(N)) || N <- DecimalNumberBase],
        [integer_to_list(43 * list_to_integer(N)) || N <- DecimalNumberBase]
    ]),
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DoWhileStatement = 'DO' Statement 'WHILE' '(' Expression ')'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(doWhileStatement = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{statement, Statement}] = dets:lookup(?CODE_TEMPLATES, statement),
    Statement_Length = length(Statement),

    Code = [
        lists:append([
            "Do ",
            lists:nth(rand:uniform(Statement_Length), Statement),
            " While (",
            lists:nth(rand:uniform(Expression_Length), Expression),
            ");"
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ElementaryTypeName = 'address' | 'bool' | 'string' | 'var'
%%                    | Int | Uint | Byte | Fixed | Ufixed
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression ...        reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(elementaryTypeName = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Address",
        "Bool",
        "String",
        "Var"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EnumDefinition = 'enum' Identifier '{' EnumValue? (',' EnumValue)* '}'
%% -----------------------------------------------------------------------------
%% ContractPart = ... EnumDefinition ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(enumDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{enumValue, EnumValue}] = dets:lookup(?CODE_TEMPLATES, enumValue),
    EnumValue_Length = length(EnumValue),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [
        lists:append([
            "Enum ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            "{",
            case rand:uniform(5) rem 5 of
                1 -> lists:append([
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue)
                ]);
                3 -> lists:append([
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue),
                    ",",
                    lists:nth(rand:uniform(EnumValue_Length), EnumValue)
                ]);
                4 -> lists:nth(rand:uniform(EnumValue_Length), EnumValue);
                _ -> ""
            end,
            "}"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EventDefinition = 'event' Identifier IndexedParameterList 'anonymous'? ';'
%% -----------------------------------------------------------------------------
%% ContractPart = ... EventDefinition ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(eventDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{indexedParameterList, IndexedParameterList}] = dets:lookup(?CODE_TEMPLATES, indexedParameterList),
    IndexedParameterList_Length = length(IndexedParameterList),

    Code = [
        lists:append([
            "Event ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            " ",
            lists:nth(rand:uniform(IndexedParameterList_Length), IndexedParameterList),
            case rand:uniform(2) rem 2 of
                1 -> " Anonymous";
                _ -> []
            end,
            ";"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Expression
%%  = Expression ('++' | '--')
%%  | NewExpression
%%  | IndexAccess
%%  | MemberAccess
%%  | FunctionCall
%%  | '(' Expression ')'
%%  | ('!' | '~' | 'delete' | '++' | '--' | '+' | '-') Expression
%%  | Expression '**' Expression
%%  | Expression ('*' | '/' | '%') Expression
%%  | Expression ('+' | '-') Expression
%%  | Expression ('<<' | '>>') Expression
%%  | Expression '&' Expression
%%  | Expression '^' Expression
%%  | Expression '|' Expression
%%  | Expression ('<' | '>' | '<=' | '>=') Expression
%%  | Expression ('==' | '!=') Expression
%%  | Expression '&&' Expression
%%  | Expression '||' Expression
%%  | Expression '?' Expression ':' Expression
%%  | Expression ('=' | '|=' | '^=' | '&=' | '<<=' | '>>=' | '+=' | '-=' | '*=' | '/=' | '%=') Expression
%%  | PrimaryExpression
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(expression = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),

    Code = [
        case rand:uniform(41) rem 41 of
            1 ->
                lists:nth(rand:uniform(Expression_Length), Expression) ++ " ++ ";
            2 ->
                lists:nth(rand:uniform(Expression_Length), Expression) ++ " -- ";
            3 -> lists:append([
                "(",
                lists:nth(rand:uniform(Expression_Length), Expression),
                ")"
            ]);
            4 -> "!" ++ lists:nth(rand:uniform(Expression_Length), Expression);
            5 -> "~" ++ lists:nth(rand:uniform(Expression_Length), Expression);
            6 ->
                "Delete " ++ lists:nth(rand:uniform(Expression_Length), Expression);
            7 ->
                " ++ " ++ lists:nth(rand:uniform(Expression_Length), Expression);
            8 ->
                " -- " ++ lists:nth(rand:uniform(Expression_Length), Expression);
            9 ->
                " + " ++ lists:nth(rand:uniform(Expression_Length), Expression);
            10 ->
                " - " ++ lists:nth(rand:uniform(Expression_Length), Expression);
            11 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "**",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            12 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "*",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            13 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "/",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            14 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "%",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            15 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                " + ",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            16 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                " - ",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            17 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "<<",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            18 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                ">>",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            19 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "&",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            20 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "^",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            21 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "|",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            22 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "<",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            23 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                ">",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            24 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "<=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            25 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                ">=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            26 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "==",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            27 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "!=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            28 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "&&",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            29 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "||",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            30 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "?",
                lists:nth(rand:uniform(Expression_Length), Expression),
                ":",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            31 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            32 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "|=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            33 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "^=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            34 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "&=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            35 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "<<=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            36 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                ">>=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            37 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "+=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            38 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "-=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            39 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "*=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            40 -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "/=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ]);
            _ -> lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                "%=",
                lists:nth(rand:uniform(Expression_Length), Expression)
            ])
        end
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ExpressionList = '(' ( Expression? ',' )* Expression? ')'
%% -----------------------------------------------------------------------------
%% FunctionCallArguments = ... ExpressionList? ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(expressionList = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),

    Code =
        ["()"] ++
        [
            lists:append([
                "(",
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    3 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    _ -> lists:nth(rand:uniform(Expression_Length), Expression)
                end,
                ")"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(functionCallArguments, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fixed = 'fixed' | ( 'fixed' DecimalNumber 'x' DecimalNumber )
%% -----------------------------------------------------------------------------
%% ElementaryTypeName = ... Fixed ...
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression ...        reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(fixed = Rule) ->
    ?CREATE_CODE_START,
    [{decimalNumber, DecimalNumber}] = dets:lookup(?CODE_TEMPLATES, decimalNumber),
    DecimalNumber_Length = length(DecimalNumber),

    Code =
        [
            lists:append([
                "Fixed",
                case rand:uniform(32) rem 32 of
                    1 -> "8";
                    2 -> "16";
                    3 -> "24";
                    4 -> "32";
                    5 -> "40";
                    6 -> "48";
                    7 -> "56";
                    8 -> "64";
                    9 -> "72";
                    10 -> "80";
                    11 -> "88";
                    12 -> "96";
                    13 -> "104";
                    14 -> "112";
                    15 -> "120";
                    16 -> "128";
                    17 -> "136";
                    18 -> "144";
                    19 -> "152";
                    20 -> "160";
                    21 -> "168";
                    22 -> "176";
                    23 -> "184";
                    24 -> "192";
                    25 -> "200";
                    26 -> "208";
                    27 -> "216";
                    28 -> "224";
                    29 -> "232";
                    30 -> "240";
                    31 -> "248";
                    _ -> "256"
                end,
                "x",
                integer_to_list(list_to_integer(lists:nth(rand:uniform(DecimalNumber_Length), DecimalNumber)) rem 81)
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(elementaryTypeName, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ForStatement = 'FOR' '(' (SimpleStatement)? ';' (Expression)? ';' (ExpressionStatement)? ')' Statement
%% -----------------------------------------------------------------------------
%% Statement = ... ForStatement ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(forStatement = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{expressionStatement, ExpressionStatement}] = dets:lookup(?CODE_TEMPLATES, expressionStatement),
    ExpressionStatement_Length = length(ExpressionStatement),
    [{simpleStatement, SimpleStatement}] = dets:lookup(?CODE_TEMPLATES, simpleStatement),
    SimpleStatement_Length = length(SimpleStatement),
    [{statement, Statement}] = dets:lookup(?CODE_TEMPLATES, statement),
    Statement_Length = length(Statement),

    Code = [
        lists:append([
            "For (",
            case rand:uniform(2) rem 2 of
                1 ->
                    lists:nth(rand:uniform(SimpleStatement_Length), SimpleStatement);
                _ -> ";"
            end,
            case rand:uniform(2) rem 2 of
                1 -> lists:nth(rand:uniform(Expression_Length), Expression);
                _ -> []
            end,
            ";",
            case rand:uniform(2) rem 2 of
                1 ->
                    lists:nth(rand:uniform(ExpressionStatement_Length), ExpressionStatement);
                _ -> []
            end,
            ") ",
            lists:nth(rand:uniform(Statement_Length), Statement)
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FunctionalAssemblyExpression = Identifier '(' AssemblyItem? ( ',' AssemblyItem )* ')'
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... FunctionalAssemblyExpression ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(functionalAssemblyExpression = Rule) ->
    ?CREATE_CODE_START,
    [{assemblyItem, AssemblyItem}] = dets:lookup(?CODE_TEMPLATES, assemblyItem),
    AssemblyItem_Length = length(AssemblyItem),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [
        lists:append([
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            "(",
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                    ",",
                    lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                    ",",
                    lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                    ",",
                    lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                ]);
                3 -> lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem);
                _ -> []
            end,
            ")"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FunctionCall = Expression '(' FunctionCallArguments ')'
%% -----------------------------------------------------------------------------
%% Expression = ... FunctionCall ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(functionCall = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{functionCallArguments, FunctionCallArguments}] = dets:lookup(?CODE_TEMPLATES, functionCallArguments),
    FunctionCallArguments_Length = length(FunctionCallArguments),

    Code = [
        lists:append([
            lists:nth(rand:uniform(Expression_Length), Expression),
            "(",
            lists:nth(rand:uniform(FunctionCallArguments_Length), FunctionCallArguments),
            ")"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FunctionCallArguments = '{' NameValueList? '}'
%%                       | ExpressionList?
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(functionCallArguments = Rule) ->
    ?CREATE_CODE_START,
    [{nameValueList, NameValueList}] = dets:lookup(?CODE_TEMPLATES, nameValueList),
    NameValueList_Length = length(NameValueList),

    Code =
        ["{}"] ++
        [
            lists:append([
                "{ ",
                lists:nth(rand:uniform(NameValueList_Length), NameValueList),
                "}"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FunctionDefinition = 'FUNCTION' Identifier? ParameterList
%%                        ( ModifierInvocation | StateMutability | 'EXTERNAL' | 'PUBLIC' | 'INTERNAL' | 'PRIVATE' )*
%%                        ( 'RETURNS' ParameterList )? ( ';' | Block )
%% -----------------------------------------------------------------------------
%% ContractPart = ... FunctionDefinition ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(functionDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{block, Block}] = dets:lookup(?CODE_TEMPLATES, block),
    Block_Length = length(Block),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{parameterList, ParameterList}] = dets:lookup(?CODE_TEMPLATES, parameterList),
    ParameterList_Length = length(ParameterList),
    [{modifierInvocation, ModifierInvocation}] = dets:lookup(?CODE_TEMPLATES, modifierInvocation),
    ModifierInvocation_Length = length(ModifierInvocation),
    [{stateMutability, StateMutability}] = dets:lookup(?CODE_TEMPLATES, stateMutability),
    StateMutability_Length = length(StateMutability),

    Code =
        [
            lists:append([
                "Function ",
                case rand:uniform(2) rem 2 of
                    1 -> lists:nth(rand:uniform(Identifier_Length), Identifier)
                    ++ " ";
                    _ -> []
                end,
                lists:nth(rand:uniform(ParameterList_Length), ParameterList),
                " ",
                case rand:uniform(7) rem 7 of
                    1 ->
                        lists:nth(rand:uniform(ModifierInvocation_Length), ModifierInvocation)
                        ++ " ";
                    2 ->
                        lists:nth(rand:uniform(StateMutability_Length), StateMutability)
                        ++ " ";
                    3 -> "External ";
                    4 -> "Public ";
                    5 -> "Internal ";
                    6 -> "Private ";
                    _ -> []
                end,
                case rand:uniform(7) rem 7 of
                    1 ->
                        lists:nth(rand:uniform(ModifierInvocation_Length), ModifierInvocation)
                        ++ " ";
                    2 ->
                        lists:nth(rand:uniform(StateMutability_Length), StateMutability)
                        ++ " ";
                    3 -> "External ";
                    4 -> "Public ";
                    5 -> "Internal ";
                    6 -> "Private ";
                    _ -> []
                end,
                case rand:uniform(2) rem 2 of
                    1 -> lists:append([
                        "Returns ",
                        lists:nth(rand:uniform(ParameterList_Length), ParameterList),
                        " "
                    ]);
                    _ -> []
                end,
                case rand:uniform(2) rem 2 of
                    1 -> lists:nth(rand:uniform(Block_Length), Block);
                    _ -> ";"
                end
            ])
            || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
        ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FunctionTypeName = 'FUNCTION' TypeNameList ( 'INTERNAL' | 'EXTERNAL' | StateMutability )*
%%                    ( 'returns' TypeNameList )?
%%
%% StateMutability = 'PURE' | 'CONSTANT' | 'VIEW' | 'PAYABLE'
%% -----------------------------------------------------------------------------
%% TypeName = ... FunctionTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(functionTypeName = Rule) ->
    ?CREATE_CODE_START,
    [{typeNameList, TypeNameList}] = dets:lookup(?CODE_TEMPLATES, typeNameList),
    TypeNameList_Length = length(TypeNameList),

    Code = [
        lists:append([
            "Function ",
            lists:nth(rand:uniform(TypeNameList_Length), TypeNameList),
            case rand:uniform(14) rem 14 of
                1 -> " Internal External Pure Constant View Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                2 -> " External Pure Constant View Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                3 -> " Pure Constant View Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                4 -> " Constant View Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                5 -> " View Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                6 -> " Payable Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                7 -> " Returns " ++
                lists:nth(rand:uniform(TypeNameList_Length), TypeNameList);
                8 -> " Internal External Pure Constant View Payable";
                9 -> " External Pure Constant View Payable";
                10 -> " Pure Constant View Payable";
                11 -> " Constant View Payable";
                12 -> " View Payable";
                13 -> " Payable";
                _ -> []
            end
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HexLiteral = 'hex' ('"' ([0-9a-fA-F]{2})* '"' | '\'' ([0-9a-fA-F]{2})* '\'')
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... HexLiteral ...
%% -----------------------------------------------------------------------------
%% Expression = ... PrimaryExpression ...
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... HexLiteral ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(hexLiteral = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Hex\\\"00\\\"",
        "Hex\\\"ab\\\"",
        "Hex\\\"01ab\\\"",
        "Hex\\\"0123456789abcdef\\\"",
        "Hex\\\"ab\\\"",
        "Hex\\\"01Ab\\\"",
        "Hex\\\"0123456789aBCDEF\\\"",
        "Hex'ab'",
        "Hex'01ab'",
        "Hex'0123456789abcdef'",
        "Hex'ab'",
        "Hex'01Ab'",
        "Hex'0123456789aBCDEF'"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HexNumber = '0x' [0-9a-fA-F]+
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(hexNumber = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "0x00",
        "0xab",
        "0x01ab",
        "0x0123456789abcdef",
        "0xAb",
        "0x01Ab",
        "0x0123456789aBCDEF",
        "0xAB",
        "0x01AB",
        "0x0123456789ABCDEF",
        "0xAB",
        "0x01AB",
        "0x0123456789ABCDEF"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Identifier = [a-zA-Z_$] [a-zA-Z_$0-9]*
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... Identifier ...                      unsolvable parse error
%% -----------------------------------------------------------------------------
%% EnumValue = Identifier
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% == PrimaryExpression = ... Identifier ...                       reduce/reduce
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(identifier = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "_ident1",
        "_ident2",
        "_ident3",
        "_ident4",
        "$ident1",
        "$ident2",
        "$ident3",
        "$ident4",
        "ident1",
        "ident2",
        "ident3",
        "ident4",
        "Ident1",
        "Ident2",
        "Ident3",
        "Ident4",
        "_IDENT1",
        "_IDENT2",
        "_IDENT3",
        "_IDENT4",
        "$IDENT1",
        "$IDENT2",
        "$IDENT3",
        "$IDENT4",
        "IDENT1",
        "IDENT2",
        "IDENT3",
        "IDENT4",
        "IDENT1",
        "IDENT2",
        "IDENT3",
        "IDENT4"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
%%    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    store_code(enumValue, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IdentifierList = '(' ( Identifier? ',' )* Identifier? ')'
%% -----------------------------------------------------------------------------
%% parsing issue:
%% IdentifierList = '(' ( Identifier ',' )* Identifier ')'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(identifierList = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code =
        ["()"] ++
        [
            lists:append([
                "(",
                case rand:uniform(3) rem 3 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(Identifier_Length), Identifier),
                        ",",
                        lists:nth(rand:uniform(Identifier_Length), Identifier),
                        ",",
                        lists:nth(rand:uniform(Identifier_Length), Identifier)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(Identifier_Length), Identifier),
                        ",",
                        lists:nth(rand:uniform(Identifier_Length), Identifier)
                    ]);
                    _ ->
                        lists:nth(rand:uniform(Identifier_Length), Identifier)
                end,
                ")"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IfStatement = 'IF' '(' Expression ')' Statement ( 'ELSE' Statement )?
%% -----------------------------------------------------------------------------
%% Statement = ... IfStatement ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(ifStatement = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{statement, Statement}] = dets:lookup(?CODE_TEMPLATES, statement),
    Statement_Length = length(Statement),

    Code = [
        lists:append([
            "If ( ",
            lists:nth(rand:uniform(Expression_Length), Expression),
            ") ",
            lists:nth(rand:uniform(Statement_Length), Statement),
            case rand:uniform(2) rem 2 of
                1 -> " Else " ++
                lists:nth(rand:uniform(Statement_Length), Statement);
                _ -> []
            end
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ImportDirective = 'import' StringLiteral ('as' Identifier)? ';'
%%                 | 'import' ('*' | Identifier) ('as' Identifier)? 'from' StringLiteral ';'
%%                 | 'import' '{' Identifier ('as' Identifier)? ( ',' Identifier ('as' Identifier)? )* '}' 'from' StringLiteral ';'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(importDirective = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{stringLiteral, StringLiteral}] = dets:lookup(?CODE_TEMPLATES, stringLiteral),
    StringLiteral_Length = length(StringLiteral),

    Code = [
        lists:append([
            "Import ",
            case rand:uniform(10) rem 10 of
                1 -> lists:append([
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                2 ->
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral);
                3 -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                4 -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                5 -> lists:append([
                    "* As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                6 -> "* From " ++
                lists:nth(rand:uniform(StringLiteral_Length), StringLiteral);
                7 -> lists:append([
                    "{",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    "} From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                8 -> lists:append([
                    "{",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    "} From "
                    , lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                9 -> lists:append([
                    "{",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    " As ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    "} From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ]);
                _ -> lists:append([
                    "{",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    "} From ",
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral)
                ])
            end,
            ";"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IndexAccess = Expression '[' Expression? ']'
%% -----------------------------------------------------------------------------
%% Expression = ... IndexAccess ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(indexAccess = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),

    Code =
        [
            case rand:uniform(8) rem 8 of
                1 ->
                    lists:nth(rand:uniform(Expression_Length), Expression) ++ "[]";
                _ -> lists:append([
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    "[",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    "]"
                ])
            end
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IndexedParameterList = '(' ( TypeName 'indexed'? Identifier? (',' TypeName 'indexed'? Identifier?)* )? ')'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(indexedParameterList = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code =
        ["()"] ++
        [
            lists:append([
                "(",
                lists:nth(rand:uniform(TypeName_Length), TypeName),
                case rand:uniform(4) rem 8 of
                    1 -> [];
                    _ -> " Indexed"
                end,
                case rand:uniform(4) rem 8 of
                    1 -> [];
                    _ -> " " ++
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                end,
                ")"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% InheritanceSpecifier = UserDefinedTypeName ( '(' Expression ( ',' Expression )* ')' )?
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(inheritanceSpecifier = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{userDefinedTypeName, UserDefinedTypeName}] = dets:lookup(?CODE_TEMPLATES, userDefinedTypeName),
    UserDefinedTypeName_Length = length(UserDefinedTypeName),

    Code =
        [
            lists:append([
                lists:nth(rand:uniform(UserDefinedTypeName_Length), UserDefinedTypeName),
                "(",
                lists:nth(rand:uniform(Expression_Length), Expression),
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    2 -> lists:append([
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    3 -> "," ++
                    lists:nth(rand:uniform(Expression_Length), Expression);
                    _ -> []
                end,
                ")"
            ])
            || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
        ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% InlineAssemblyBlock = '{' AssemblyItem* '}'
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... InlineAssemblyBlock ..
%% -----------------------------------------------------------------------------
%% Statement = ... InlineAssemblyBlock ..
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(inlineAssemblyBlock = Rule) ->
    ?CREATE_CODE_START,
    [{assemblyItem, AssemblyItem}] = dets:lookup(?CODE_TEMPLATES, assemblyItem),
    AssemblyItem_Length = length(AssemblyItem),

    Code =
        ["{}"] ++
        [
            lists:append([
                "{",
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                    ]);
                    3 -> lists:append([
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem),
                        " ",
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                    ]);
                    _ ->
                        lists:nth(rand:uniform(AssemblyItem_Length), AssemblyItem)
                end,
                "}"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% InlineAssemblyStatement = 'ASSEMBLY' StringLiteral? InlineAssemblyBlock
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(inlineAssemblyStatement = Rule) ->
    ?CREATE_CODE_START,
    [{inlineAssemblyBlock, InlineAssemblyBlock}] = dets:lookup(?CODE_TEMPLATES, inlineAssemblyBlock),
    InlineAssemblyBlock_Length = length(InlineAssemblyBlock),
    [{stringLiteral, StringLiteral}] = dets:lookup(?CODE_TEMPLATES, stringLiteral),
    StringLiteral_Length = length(StringLiteral),

    Code = [
        lists:append([
            "Assembly ",
            case rand:uniform(2) rem 2 of
                1 ->
                    lists:nth(rand:uniform(StringLiteral_Length), StringLiteral) ++
                    " ";
                _ -> []
            end,
            lists:nth(rand:uniform(InlineAssemblyBlock_Length), InlineAssemblyBlock)
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Int = 'int' | 'int8' | 'int16' | 'int24' | 'int32' | 'int40' | 'int48' | 'int56' | 'int64' | 'int72' | 'int80' | 'int88' | 'int96' | 'int104' | 'int112' | 'int120' | 'int128' | 'int136' | 'int144' | 'int152' | 'int160' | 'int168' | 'int176' | 'int184' | 'int192' | 'int200' | 'int208' | 'int216' | 'int224' | 'int232' | 'int240' | 'int248' | 'int256'
%% -----------------------------------------------------------------------------
%% ElementaryTypeName = ... Int ...
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression ...        reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(int = Rule) ->
    ?CREATE_CODE_START,

    Code = ?INT,
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(elementaryTypeName, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mapping = 'mapping' '(' ElementaryTypeName '=>' TypeName ')'
%% -----------------------------------------------------------------------------
%% TypeName = ... Mapping ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(mapping = Rule) ->
    ?CREATE_CODE_START,
    [{elementaryTypeName, ElementaryTypeName}] = dets:lookup(?CODE_TEMPLATES, elementaryTypeName),
    ElementaryTypeName_Length = length(ElementaryTypeName),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
        lists:append([
            "Mapping (",
            lists:nth(rand:uniform(ElementaryTypeName_Length), ElementaryTypeName),
            "=>",
            lists:nth(rand:uniform(TypeName_Length), TypeName),
            ")"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MemberAccess = Expression '.' Identifier
%% -----------------------------------------------------------------------------
%% Expression = ... MemberAccess ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(memberAccess = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code =
        [
            lists:append([
                lists:nth(rand:uniform(Expression_Length), Expression),
                ".",
                lists:nth(rand:uniform(Identifier_Length), Identifier)
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModifierDefinition = 'MODIFIER' Identifier ParameterList? Block
%% -----------------------------------------------------------------------------
%% ContractPart = ... ModifierDefinition ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(modifierDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{block, Block}] = dets:lookup(?CODE_TEMPLATES, block),
    Block_Length = length(Block),
    [{parameterList, ParameterList}] = dets:lookup(?CODE_TEMPLATES, parameterList),
    ParameterList_Length = length(ParameterList),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code =
        [
            lists:append([
                "Modifier ",
                lists:nth(rand:uniform(Identifier_Length), Identifier),
                " ",
                case rand:uniform(2) rem 2 of
                    1 ->
                        lists:nth(rand:uniform(ParameterList_Length), ParameterList) ++
                        " ";
                    _ -> []
                end,
                lists:nth(rand:uniform(Block_Length), Block)
            ])
            || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
        ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ModifierInvocation = Identifier ( '(' ExpressionList? ')' )?
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(modifierInvocation = Rule) ->
    ?CREATE_CODE_START,
    [{expressionList, ExpressionList}] = dets:lookup(?CODE_TEMPLATES, expressionList),
    ExpressionList_Length = length(ExpressionList),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code =
        [
                lists:nth(rand:uniform(Identifier_Length), Identifier) ++
                case rand:uniform(5) rem 5 of
                    1 -> [];
                    2 -> "()";
                    _ -> lists:append([
                        "(",
                        lists:nth(rand:uniform(ExpressionList_Length), ExpressionList),
                        ")"
                    ])
                end
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NameValueList = Identifier ':' Expression ( ',' Identifier ':' Expression )*
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(nameValueList = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code =
        [
            case rand:uniform(8) rem 8 of
                1 -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ]);
                3 -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression),
                    ",",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ]);
                _ -> lists:append([
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ":",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ])
            end
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NewExpression = 'new' TypeName
%% -----------------------------------------------------------------------------
%% Expression = ... NewExpression ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(newExpression = Rule) ->
    ?CREATE_CODE_START,
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
            "New " ++
            lists:nth(rand:uniform(TypeName_Length), TypeName)
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NumberLiteral = ( HexNumber | DecimalNumber ) (' ' NumberUnit)?
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... NumberLiteral ...
%% -----------------------------------------------------------------------------
%% Expression = ... PrimaryExpression ...
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... NumberLiteral ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(numberLiteral = Rule) ->
    ?CREATE_CODE_START,
    [{decimalNumber, DecimalNumber}] = dets:lookup(?CODE_TEMPLATES, decimalNumber),
    DecimalNumber_Length = length(DecimalNumber),
    [{hexNumber, HexNumber}] = dets:lookup(?CODE_TEMPLATES, hexNumber),
    HexNumber_Length = length(HexNumber),
    [{numberUnit, NumberUnit}] = dets:lookup(?CODE_TEMPLATES, numberUnit),
    NumberUnit_Length = length(NumberUnit),

    Code = [
        case rand:uniform(4) rem 4 of
            1 -> lists:append([
                lists:nth(rand:uniform(DecimalNumber_Length), DecimalNumber),
                " ",
                lists:nth(rand:uniform(NumberUnit_Length), NumberUnit)
            ]);
            2 -> lists:nth(rand:uniform(DecimalNumber_Length), DecimalNumber);
            3 -> lists:append([
                lists:nth(rand:uniform(HexNumber_Length), HexNumber),
                " ",
                lists:nth(rand:uniform(NumberUnit_Length), NumberUnit)
            ]);
            _ -> lists:nth(rand:uniform(HexNumber_Length), HexNumber)
        end
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NumberUnit = 'wei' | 'szabo' | 'finney' | 'ether'
%%            | 'seconds' | 'minutes' | 'hours' | 'days' | 'weeks' | 'years'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(numberUnit = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Wei",
        "Szabo",
        "Finney",
        "Ether",
        "Seconds",
        "Minutes",
        "Hours",
        "Days",
        "Weeks",
        "Years"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ParameterList =        '(' ( TypeName            Identifier? (',' TypeName            Identifier?)* )? ')'
%% -----------------------------------------------------------------------------
%% reduce/reduce:
%% ParameterList =        '(' TypeName Identifier (',' TypeName Identifier)* ')'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(parameterList = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code =
%%        reduce/reduce ["()"] ++
    [
        lists:append([
            "(",
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                3 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                _ -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    " ",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ])
            end,
            ")"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PlaceholderStatement = '_'
%% -----------------------------------------------------------------------------
%% Statement = ... PlaceholderStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(placeholderStatement = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "_;"
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRAGMA_DIRECTIVE = ([^;]+;)
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(pragma_directive = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "^1.0.1",
        "^1.0.2",
        "^1.0.3",
        "^1.0.4",
        "^1.0.5",
        "^2.0.1",
        "^2.0.2",
        "^2.0.3",
        "^2.0.4",
        "^2.0.5",
        "^123.456.789",
        "^3.0.0",
        "^3.0.1",
        "^3.0.2",
        "^3.0.3",
        "^3.0.4",
        "^3.0.5"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PragmaDirective = 'pragma' Identifier ([^;]+) ';'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(pragmaDirective = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{pragma_directive, Pragma_directive}] = dets:lookup(?CODE_TEMPLATES, pragma_directive),
    Pragma_directive_Length = length(Pragma_directive),

    Code = [
        lists:append([
            "Pragma ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            " ",
            lists:nth(rand:uniform(Pragma_directive_Length), Pragma_directive),
            ";"
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reference examples from xxx.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(referenceExamples = Rule) ->
    ?CREATE_CODE_START,

    LineSep = io_lib:nl(),

    Code = [
        lists:append([
            LineSep,
            "        // =====================================================================", LineSep,
            "        // from file:       ", File, LineSep,
            "        //      chapter:    ", Chapter, LineSep,
            case SubChapter of
                [] -> [];
                _ ->
                    lists:append(["        //      subchapter: ", SubChapter, LineSep])
            end,
            "        // ---------------------------------------------------------------------", LineSep,
            LineSep,
            string:replace(CodeExample, "\"", "\\\"", all)
        ]) || {File, Chapter, SubChapter, CodeExample} <- ?TESTS_FROM_SOLIDITY_DOCS
    ],
    dets:insert(?CODE_TEMPLATES, {Rule, Code}),
%   ?CREATE_CODE_END;
    ok;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Return = 'return' Expression?
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(return = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),

    Code =
        ["Return;"] ++
        [
            lists:append([
                "Return ",
                lists:nth(rand:uniform(Expression_Length), Expression),
                ";"
            ])
            || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
        ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SourceUnit = (PragmaDirective | ImportDirective | ContractDefinition)*
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(sourceUnit = Rule) ->
    ?CREATE_CODE_START,
    [{contractDefinition, ContractDefinition}] = dets:lookup(?CODE_TEMPLATES, contractDefinition),
    ContractDefinition_Length = length(ContractDefinition),
    [{importDirective, ImportDirective}] = dets:lookup(?CODE_TEMPLATES, importDirective),
    ImportDirective_Length = length(ImportDirective),
    [{pragmaDirective, PragmaDirective}] = dets:lookup(?CODE_TEMPLATES, pragmaDirective),
    PragmaDirective_Length = length(PragmaDirective),

    Code = [
        case rand:uniform(5) rem 5 of
            1 -> lists:append([
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",

                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",

                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",

                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end
            ]);
            2 -> lists:append([
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end
            ]);
            3 -> lists:append([
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end
            ]);
            4 -> lists:append([
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end,
                " ",
                case rand:uniform(3) rem 3 of
                    1 ->
                        lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                    2 ->
                        lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                    _ ->
                        lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                end
            ]);
            _ -> case rand:uniform(3) rem 3 of
                     1 ->
                         lists:nth(rand:uniform(ContractDefinition_Length), ContractDefinition);
                     2 ->
                         lists:nth(rand:uniform(ImportDirective_Length), ImportDirective);
                     _ ->
                         lists:nth(rand:uniform(PragmaDirective_Length), PragmaDirective)
                 end
        end
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Special variations.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(special = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Contract my_contract Is identifier (47++, 11--) {}",
        "Contract my_contract Is identifier (47++,Delete 4711) {}",
        "Contract my_contract Is identifier {}",
        "Contract my_contract {Event identifier1 (Address identifier2, Bool Indexed identifier3);}",
        "Contract my_contract {Event identifier1 (Address, Bool);}",
        "Contract my_contract {Function () {Return [];}}",
        "Contract my_contract {Modifier my_modifier () {Var ();}}",
        "Contract my_contract {Modifier my_modifier {Return ();}}",
        "Contract my_contract {Modifier my_modifier {Return [];}}",
        "Contract my_contract {Modifier my_modifier {Var ();}}",
        "Contract my_contract {Using identifier For Address [];}",
        "Contract my_contract {}",
        "Contract my_contract1 {Using identifier For Address [];} Contract my_contract2 {Using identifier For Address [];}",
        "Import \\\"string1\\\"; Import \\\"string2\\\";",
        "Import {identifier1 As identifier2, identifier2 As identifier4} From \\\"string\\\";",
        "Import {identifier1, identifier2 As identifier3} From \\\"string\\\";",
        "Import {identifier1, identifier2} From \\\"string\\\";",
        "Pragma identifier1 ^1.0.0; Pragma identifier2 ^1.0.0;"
    ],
    dets:insert(?CODE_TEMPLATES, {Rule, Code}),
%   ?CREATE_CODE_END;
    ok;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% StateMutability = 'pure' | 'constant' | 'view' | 'payable'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(stateMutability = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Pure",
        "Constant",
        "View",
        "Payable"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% StateVariableDeclaration = TypeName ( 'PUBLIC' | 'INTERNAL' | 'PRIVATE' | 'CONSTANT' )? Identifier ('=' Expression)? ';'
%% -----------------------------------------------------------------------------
%% ContractPart = ... StateVariableDeclaration ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(stateVariableDeclaration = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
        lists:append([
            lists:nth(rand:uniform(TypeName_Length), TypeName),
            " ",
            case rand:uniform(5) rem 5 of
                1 -> "Public ";
                2 -> "Internal ";
                3 -> "Private ";
                4 -> "Constant ";
                _ -> []
            end,
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            case rand:uniform(2) rem 2 of
                1 -> "=" ++
                lists:nth(rand:uniform(Expression_Length), Expression);
                _ -> []
            end,
            ";"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% StorageLocation = 'memory' | 'storage'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(storageLocation = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Memory",
        "Storage"
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% StringLiteral = '"' ([^"\r\n\\] | '\\' .)* '"'
%% -----------------------------------------------------------------------------
%% AssemblyItem = ... HexLiteral ...
%% -----------------------------------------------------------------------------
%% Expression = ... PrimaryExpression ...
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... HexLiteral ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(stringLiteral = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "\\\"string_1\\\"",
        "\\\"string_2\\\"",
        "\\\"string_3\\\"",
        "\\\"string_4\\\"",
        "\\\"string_5\\\"",
        "\\\"string_1_\\\"",
        "\\\"string_2$\\\"",
        "\\\"string_3$_\\\"",
        "\\\"string_4$_\\\"",
        "\\\"string_5\\\"",
        "\\\"STRING_1\\\"",
        "\\\"STRING_2\\\"",
        "\\\"STRING_3\\\"",
        "\\\"STRING_4\\\"",
        "\\\"STRING_5\\\""
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(assemblyItem, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% StructDefinition = 'struct' Identifier '{'
%%                    ( VariableDeclaration ';' (VariableDeclaration ';')* )? '}'
%% -----------------------------------------------------------------------------
%% ContractPart = ... StructDefinition ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(structDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{variableDeclaration, VariableDeclaration}] = dets:lookup(?CODE_TEMPLATES, variableDeclaration),
    VariableDeclaration_Length = length(VariableDeclaration),

    Code = [
        lists:append([
            "Struct ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            " { ",
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    ";",
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    ";",
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    ";"
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    ";",
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    ";"
                ]);
                3 ->
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration)
                    ++ ";";
                _ ->
                    []
            end,
            "}"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Throw = 'throw'
%% -----------------------------------------------------------------------------
%% Statement = ... Throw ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(throw = Rule) ->
    ?CREATE_CODE_START,

    Code = [
        "Throw;"
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TupleExpression = '(' ( Expression ( ',' Expression )*  )? ')'
%%                   | '[' ( Expression ( ',' Expression )*  )? ']'
%% -----------------------------------------------------------------------------
%% Expression = ... PrimaryExpression ...
%% -----------------------------------------------------------------------------
%% ExpressionStatement = Expression
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... TupleExpression ...
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... ExpressionStatement ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(tupleExpression = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),

    Code =
        [
            lists:append([
                "(",
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    3 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    _ -> lists:nth(rand:uniform(Expression_Length), Expression)
                end,
                ")"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ] ++
        [
            lists:append([
                "[",
                case rand:uniform(4) rem 4 of
                    1 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    2 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    3 -> lists:append([
                        lists:nth(rand:uniform(Expression_Length), Expression),
                        ",",
                        lists:nth(rand:uniform(Expression_Length), Expression)
                    ]);
                    _ -> lists:nth(rand:uniform(Expression_Length), Expression)
                end,
                "]"
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(expression, Code, ?MAX_BASIC, false),
    store_code(expressionStatement, Code, ?MAX_BASIC, false),
    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TypeNameList =         '(' ( TypeName (',' TypeName )* )? ')'
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(typeNameList = Rule) ->
    ?CREATE_CODE_START,
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code =
%%        reduce/reduce ["()"] ++
    [
        lists:append([
            "(",
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName)
                ]);
                2 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName)
                ]);
                3 -> lists:append([
                    lists:nth(rand:uniform(TypeName_Length), TypeName),
                    ",",
                    lists:nth(rand:uniform(TypeName_Length), TypeName)
                ]);
                _ -> lists:nth(rand:uniform(TypeName_Length), TypeName)
            end,
            ")"
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uixed = 'ufixed' | ( 'ufixed' DecimalNumber 'x' DecimalNumber )
%% -----------------------------------------------------------------------------
%% ElementaryTypeName = ... Ufixed ...
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression  ...       reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(uFixed = Rule) ->
    ?CREATE_CODE_START,
    [{decimalNumber, DecimalNumber}] = dets:lookup(?CODE_TEMPLATES, decimalNumber),
    DecimalNumber_Length = length(DecimalNumber),

    Code =
        [
            lists:append([
                "Ufixed",
                case rand:uniform(32) rem 32 of
                    1 -> "8";
                    2 -> "16";
                    3 -> "24";
                    4 -> "32";
                    5 -> "40";
                    6 -> "48";
                    7 -> "56";
                    8 -> "64";
                    9 -> "72";
                    10 -> "80";
                    11 -> "88";
                    12 -> "96";
                    13 -> "104";
                    14 -> "112";
                    15 -> "120";
                    16 -> "128";
                    17 -> "136";
                    18 -> "144";
                    19 -> "152";
                    20 -> "160";
                    21 -> "168";
                    22 -> "176";
                    23 -> "184";
                    24 -> "192";
                    25 -> "200";
                    26 -> "208";
                    27 -> "216";
                    28 -> "224";
                    29 -> "232";
                    30 -> "240";
                    31 -> "248";
                    _ -> "256"
                end,
                "x",
                integer_to_list(list_to_integer(lists:nth(rand:uniform(DecimalNumber_Length), DecimalNumber)) rem 81)
            ])
            || _ <- lists:seq(1, ?MAX_BASIC * 2)
        ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(elementaryTypeName, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uint = 'uint' | 'uint8' | 'uint16' | 'uint24' | 'uint32' | 'uint40' | 'uint48' | 'uint56' | 'uint64' | 'uint72' | 'uint80' | 'uint88' | 'uint96' | 'uint104' | 'uint112' | 'uint120' | 'uint128' | 'uint136' | 'uint144' | 'uint152' | 'uint160' | 'uint168' | 'uint176' | 'uint184' | 'uint192' | 'uint200' | 'uint208' | 'uint216' | 'uint224' | 'uint232' | 'uint240' | 'uint248' | 'uint256'
%% -----------------------------------------------------------------------------
%% ElementaryTypeName = ... Uint ...
%% -----------------------------------------------------------------------------
%% ElementaryTypeNameExpression = ElementaryTypeName               reduce/reduce
%% -----------------------------------------------------------------------------
%% Expression =  ... PrimaryExpression ...                         reduce/reduce
%% -----------------------------------------------------------------------------
%% PrimaryExpression = ... ElementaryTypeNameExpression ...        reduce/reduce
%% -----------------------------------------------------------------------------
%% TypeName = ... ElementaryTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(uInt = Rule) ->
    ?CREATE_CODE_START,

    Code = ?UINT,
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(elementaryTypeName, Code, ?MAX_BASIC, false),
%%    store_code(elementaryTypeNameExpression, Code, ?MAX_BASIC, false),
%%    store_code(expression, Code, ?MAX_BASIC, false),
%%    store_code(primaryExpression, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% UserDefinedTypeName = Identifier ( '.' Identifier )*
%% -----------------------------------------------------------------------------
%% TypeName = ... UserDefinedTypeName ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(userDefinedTypeName = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),

    Code = [
            lists:nth(rand:uniform(Identifier_Length), Identifier) ++
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    ".",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ".",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ".",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                2 -> lists:append([
                    ".",
                    lists:nth(rand:uniform(Identifier_Length), Identifier),
                    ".",
                    lists:nth(rand:uniform(Identifier_Length), Identifier)
                ]);
                3 -> "." ++
                lists:nth(rand:uniform(Identifier_Length), Identifier);
                _ -> []
            end
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    store_code(typeName, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% UsingForDeclaration = 'using' Identifier 'for' ('*' | TypeName) ';'
%% -----------------------------------------------------------------------------
%% ContractPart = ... UsingForDeclaration ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(usingForDeclaration = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
        lists:append([
            "Using ",
            lists:nth(rand:uniform(Identifier_Length), Identifier),
            " For ",
            case rand:uniform(4) rem 4 of
                1 -> "*";
                _ -> lists:nth(rand:uniform(TypeName_Length), TypeName)
            end,
            ";"
        ])
        || _ <- lists:seq(1, ?MAX_CONTRACT_PART * 2)
    ],
    store_code(Rule, Code, ?MAX_CONTRACT_PART, false),
    store_code(contractPart, Code, ?MAX_CONTRACT_PART, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VariableDeclaration = TypeName StorageLocation? Identifier
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(variableDeclaration = Rule) ->
    ?CREATE_CODE_START,
    [{identifier, Identifier}] = dets:lookup(?CODE_TEMPLATES, identifier),
    Identifier_Length = length(Identifier),
    [{storageLocation, StorageLocation}] = dets:lookup(?CODE_TEMPLATES, storageLocation),
    StorageLocation_Length = length(StorageLocation),
    [{typeName, TypeName}] = dets:lookup(?CODE_TEMPLATES, typeName),
    TypeName_Length = length(TypeName),

    Code = [
        lists:append([
            lists:nth(rand:uniform(TypeName_Length), TypeName),
            " ",
            case rand:uniform(3) rem 3 of
                1 -> [];
                _ ->
                    lists:nth(rand:uniform(StorageLocation_Length), StorageLocation)
                    ++ " "
            end,
            lists:nth(rand:uniform(Identifier_Length), Identifier)
        ])
        || _ <- lists:seq(1, ?MAX_BASIC * 2)
    ],
    store_code(Rule, Code, ?MAX_BASIC, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VariableDefinition = ('var' IdentifierList | VariableDeclaration) ( '=' Expression )?
%% -----------------------------------------------------------------------------
%% SimpleStatement = ... VariableDefinition ...
%% -----------------------------------------------------------------------------
%% Statement = ... SimpleStatement ';' ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(variableDefinition = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{identifierList, IdentifierList}] = dets:lookup(?CODE_TEMPLATES, identifierList),
    IdentifierList_Length = length(IdentifierList),
    [{variableDeclaration, VariableDeclaration}] = dets:lookup(?CODE_TEMPLATES, variableDeclaration),
    VariableDeclaration_Length = length(VariableDeclaration),

    Code =
        [
            case rand:uniform(4) rem 4 of
                1 -> lists:append([
                    "Var ",
                    lists:nth(rand:uniform(IdentifierList_Length), IdentifierList),
                    "=",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ]);
                2 -> "Var " ++
                lists:nth(rand:uniform(IdentifierList_Length), IdentifierList);
                3 -> lists:append([
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration),
                    "=",
                    lists:nth(rand:uniform(Expression_Length), Expression)
                ]);
                _ ->
                    lists:nth(rand:uniform(VariableDeclaration_Length), VariableDeclaration)
            end
            || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
        ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(simpleStatement, [C ++ ";" || C <- Code], ?MAX_BASIC, false),
    store_code(statement, [C ++ ";" || C <- Code], ?MAX_STATEMENT, false),
    ?CREATE_CODE_END;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WhileStatement = 'WHILE' '(' Expression ')' Statement
%% -----------------------------------------------------------------------------
%% Statement = ... WhileStatement ...
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_code(whileStatement = Rule) ->
    ?CREATE_CODE_START,
    [{expression, Expression}] = dets:lookup(?CODE_TEMPLATES, expression),
    Expression_Length = length(Expression),
    [{statement, Statement}] = dets:lookup(?CODE_TEMPLATES, statement),
    Statement_Length = length(Statement),

    Code = [
        lists:append([
            "While ( ",
            lists:nth(rand:uniform(Expression_Length), Expression),
            ")",
            lists:nth(rand:uniform(Statement_Length), Statement)
        ])
        || _ <- lists:seq(1, ?MAX_STATEMENT * 2)
    ],
    store_code(Rule, Code, ?MAX_STATEMENT, false),
    store_code(statement, Code, ?MAX_STATEMENT, false),
    ?CREATE_CODE_END.

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Creating Common Test data files.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file_create_ct_all(_Type, _CompleteDescription, _CompactedDetailed, []) ->
    ok;
file_create_ct_all(Type, CompleteDescription, CompactedDetailed, [Rule | Rules]) ->
    file_create_ct(Type, CompleteDescription, CompactedDetailed, Rule),
    file_create_ct_all(Type, CompleteDescription, CompactedDetailed, Rules).

file_create_ct(Type, CompleteDescription, CompactedDetailed, Rule) ->
    [{Rule, Code}] = dets:lookup(?CODE_TEMPLATES, Rule),

    CodeLength = length(Code),
    RuleString = atom_to_list(Rule),

    FileName = lists:append([Type, "_", CompleteDescription, "_", CompactedDetailed, "_", RuleString, "_SUITE"]),
    {ok, File, _} = file:path_open([?PATH_CT], FileName ++ ".erl", [write]),

    erlang:display(io:format("final common tests ===> ~12.. B file_name: ~s ", [CodeLength, FileName ++ ".erl"])),

    {{Current_Year, Current_Month, Current_Day}, _} = calendar:local_time(),

    io:format(File, "~s~n", ["%%%-------------------------------------------------------------------"]),
    io:format(File, "~s~n", [lists:append(["%%% File        : ", FileName, ".erl"])]),
    io:format(File, "~s~n", [lists:append(["%%% Description : Test Suite for rule: ", RuleString, "."])]),
    io:format(File, "~s~n", ["%%%"]),
    io:format(File, "~s~n", ["%%% Created     : " ++ lists:flatten(io_lib:format("~2..0w.~2..0w.~4..0w", [Current_Day, Current_Month, Current_Year]))]),
    io:format(File, "~s~n", ["%%%-------------------------------------------------------------------"]),
    io:format(File, "~s~n", [lists:append(["-module(", FileName, ")."])]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["-export(["]),
    io:format(File, "~s~n", ["    all/0,"]),
    io:format(File, "~s~n", ["    end_per_suite/1,"]),
    io:format(File, "~s~n", ["    init_per_suite/1,"]),

    case CodeLength of
        0 -> io:format(File, "~s~n", ["    suite/0"]);
        _ -> io:format(File, "~s~n", ["    suite/0,"]),
            case CompactedDetailed of
                "compacted" ->
                    io:format(File, "~s~n", [lists:append(["    test_compacted/1"])]);
                _ -> file_write_ct_export(1, File, CodeLength)
            end
    end,

    io:format(File, "~s~n", ["])."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["-include_lib(\"common_test/include/ct.hrl\")."]),
    io:format(File, "~s~n", ["-include_lib(\"eunit/include/eunit.hrl\")."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", ["%% COMMON TEST CALLBACK FUNCTIONS - SUITE"]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["suite() ->"]),
    io:format(File, "~s~n", ["    ["]),
    io:format(File, "~s~n", [lists:append(["        {timetrap, {minutes, ", integer_to_list(?TIMETRAP_MINUTES), "}}"])]),
    io:format(File, "~s~n", ["    ]."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["init_per_suite(Config) ->"]),
    io:format(File, "~s~n", ["    Config."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["end_per_suite(_Config) ->"]),
    io:format(File, "~s~n", ["    ok."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", ["%% COMMON TEST CALLBACK FUNCTIONS - ALL"]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["all() ->"]),
    io:format(File, "~s~n", ["    ["]),

    case CodeLength of
        0 -> ok;
        _ -> case CompactedDetailed of
                 "compacted" ->
                     io:format(File, "~s~n", [lists:append(["        test_compacted"])]);
                 _ -> file_write_ct_all(1, File, CodeLength)
             end
    end,

    io:format(File, "~s~n", ["    ]."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", ["%% TEST CASES"]),
    io:format(File, "~s~n", ["%%--------------------------------------------------------------------"]),
    io:format(File, "~s~n", [""]),

    case CodeLength of
        0 -> ok;
        _ -> case CompactedDetailed of
                 "compacted" ->
                     io:format(File, "~s~n", [lists:append(["test_compacted(_Config) ->"])]);
                 _ -> ok
             end,
            file_write_ct(1, Type, CompleteDescription, CompactedDetailed, File, Code)
    end.

file_write_ct(_Current, _Type, _CompleteDescription, CompactedDetailed, File, []) ->
    case CompactedDetailed of
        "compacted" -> io:format(File, "~s~n", ["    ok."]);
        _ -> ok
    end,
    file:close(File);
file_write_ct(Current, Type, CompleteDescription, CompactedDetailed, File, [H | T]) ->
    case CompactedDetailed of
        "compacted" ->
            io:format(File, "~s~n", [lists:append([
                "    ",
                case Type of
                    "performance" -> "{ok, _} = syparse:source_to_pt";
                    _ -> "syparse_test:common_test_source"
                end,
                "(\"",
                case CompleteDescription of
                    "contract_" -> lists:append([
                        "Contract my_contract {",
                        H,
                        "}"
                    ]);
                    "statement" -> lists:append([
                        "Contract my_contract { Modifier my_modifier {",
                        H,
                        "}}"
                    ]);
                    _ -> H
                end,
                "\"),"
            ])]);
        _ ->
            io:format(File, "~s~n", [lists:append(["test_", integer_to_list(Current), "(_Config) ->"])]),
            io:format(File, "~s~n", [lists:append([
                "    ",
                case Type of
                    "performance" -> "{ok, _} = syparse:source_to_pt";
                    _ -> "syparse_test:common_test_source"
                end,
                "(\"",
                case CompleteDescription of
                    "contract_" -> lists:append([
                        "Contract my_contract {",
                        H,
                        "}"
                    ]);
                    "statement" -> lists:append([
                        "Contract my_contract { Modifier my_modifier {",
                        H,
                        "}}"
                    ]);
                    _ -> H
                end,
                "\")."
            ])]),
            io:format(File, "~s~n", [""])
    end,
    file_write_ct(Current + 1, Type, CompleteDescription, CompactedDetailed, File, T).

file_write_ct_all(Current, File, Target)
    when Current == Target ->
    io:format(File, "~s~n", [lists:append(["        test_", integer_to_list(Current)])]);
file_write_ct_all(Current, File, Target) ->
    io:format(File, "~s~n", [lists:append(["        test_", integer_to_list(Current), ","])]),
    file_write_ct_all(Current + 1, File, Target).

file_write_ct_export(Current, File, Target)
    when Current == Target ->
    io:format(File, "~s~n", [lists:append(["    test_", integer_to_list(Current), "/1"])]);
file_write_ct_export(Current, File, Target) ->
    io:format(File, "~s~n", [lists:append(["    test_", integer_to_list(Current), "/1,"])]),
    file_write_ct_export(Current + 1, File, Target).

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Creating EUnit data files.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

file_create_eunit_all(_Type, _CompleteDescription, []) ->
    ok;
file_create_eunit_all(Type, CompleteDescription, [Rule | Rules]) ->
    file_create_eunit(Type, CompleteDescription, Rule),
    file_create_eunit_all(Type, CompleteDescription, Rules).

file_create_eunit(Type, CompleteDescription, Rule) ->
    [{Rule, Code}] = dets:lookup(?CODE_TEMPLATES, Rule),

    RuleStrimg = atom_to_list(Rule),

    FileName = lists:append([Type, "_", CompleteDescription, "_", RuleStrimg, ".tst"]),
    {ok, File, _} = file:path_open([?PATH_EUNIT], FileName, [write]),

    erlang:display(io:format("final eunit  tests ===> ~12.. B file_name: ~s ", [length(Code), FileName])),

    io:format(File, "~s~n", ["%%-*- mode: erlang -*-"]),
    io:format(File, "~s~n", ["%%-*- coding: utf-8 -*-"]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["% Manual testing."]),
    io:format(File, "~s~n", ["[{tests, []}]."]),
    io:format(File, "~s~n", [""]),
    io:format(File, "~s~n", ["%%"]),
    io:format(File, "~s~n", ["%% Tests for rule: " ++ RuleStrimg]),
    io:format(File, "~s~n", ["%%"]),
    io:format(File, "~s~n", [""]),

    file_write_eunit(CompleteDescription, File, Code).

file_write_eunit(_CompleteDescription, File, []) ->
    file:close(File);
file_write_eunit(CompleteDescription, File, [H | T]) ->
    io:format(File, "~s~n", [lists:append([
        "\"",
        case CompleteDescription of
            "contract_" -> lists:append([
                "Contract my_contract {",
                H,
                "}"
            ]);
            "statement" -> lists:append([
                "Contract my_contract { Modifier my_modifier {",
                H,
                "}}"
            ]);
            _ -> H
        end,
        "\"."
    ])]),
    file_write_eunit(CompleteDescription, File, T).

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Store generated code in helper table.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

store_code(Rule, Code, Max, Strict) ->
    erlang:display(io:format("store Code         ===> ~12.. B rule: ~s ", [length(Code), atom_to_list(Rule)])),

    case Max == 0 of
        true ->
            erlang:display(io:format("store CodeNew      ===> ~12.. B rule: ~s ", [0, atom_to_list(Rule)])),
            ?debugFmt("~ncode lines         ===> ~12.. B rule: ~s ~n", [0, atom_to_list(Rule)]);
        _ ->
            CodeUnique = ordsets:to_list(ordsets:from_list(Code)),
            CodeUnique_Length = length(CodeUnique),
            CodeUniqueSorted = lists:sort(?F_RANDOM, CodeUnique),
            CodeUniqueLimited = case CodeUnique_Length > Max of
                                    true ->
                                        lists:sublist(CodeUniqueSorted, 1, Max);
                                    _ -> CodeUnique
                                end,
            CodeTotal = case dets:lookup(?CODE_TEMPLATES, Rule) of
                            [{Rule, CodeOld}] ->
                                lists:sort(?F_RANDOM, ordsets:to_list(ordsets:from_list(lists:append([CodeOld, CodeUniqueLimited]))));
                            _ -> CodeUniqueLimited
                        end,
            CodeTotal_Length = length(CodeTotal),
            CodeNew = case Strict andalso CodeTotal_Length > Max of
                          true ->
                              [lists:nth(rand:uniform(CodeTotal_Length), CodeTotal) || _ <- lists:seq(1, Max)];
                          _ -> CodeTotal
                      end,
            dets:insert(?CODE_TEMPLATES, {Rule, CodeNew}),
            erlang:display(io:format("store CodeNew      ===> ~12.. B rule: ~s ", [length(CodeNew), atom_to_list(Rule)])),
            ?debugFmt("~ncode lines         ===> ~12.. B rule: ~s ~n", [length(CodeNew), atom_to_list(Rule)])
    end.
