%% -----------------------------------------------------------------------------
%%
%% syparse_generator.hrl: Solidity - test data generator.
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

-define(BYTE,
    [
        "byte",
        "bytes",
        "bytes1",
        "bytes2",
        "bytes3",
        "bytes4",
        "bytes5",
        "bytes6",
        "bytes7",
        "bytes8",
        "bytes9",
        "bytes10",
        "bytes11",
        "bytes12",
        "bytes13",
        "bytes14",
        "bytes15",
        "bytes16",
        "bytes17",
        "bytes18",
        "bytes19",
        "bytes20",
        "bytes21",
        "bytes22",
        "bytes23",
        "bytes24",
        "bytes25",
        "bytes26",
        "bytes27",
        "bytes28",
        "bytes29",
        "bytes30",
        "bytes31",
        "bytes32"
    ]
).

-define(ALL_CLAUSE_CT_PERFORMANCE, [
    sourceUnit
]).

-define(ALL_CLAUSE_CT_RELIABILITY, [
    contractDefinition,
    importDirective,
    pragmaDirective
]).

-define(ALL_CLAUSE_CT_RELIABILITY_CONTRACT_PART, [
    enumDefinition,
    eventDefinition,
    functionDefinition,
    modifierDefinition,
    stateVariableDeclaration,
    structDefinition,
    usingForDeclaration
]).

-define(ALL_CLAUSE_CT_RELIABILITY_STATEMENT, [
    block,
    break,
    continue,
    doWhileStatement,
    forStatement,
    ifStatement,
    inlineAssemblyStatement,
    placeholderStatement,
    return,
    simpleStatement,
    throw,
    whileStatement
]).

-define(ALL_CLAUSE_EUNIT, [
%%%% Level 01 ..........................
%%    booleanLiteral,
%%    break,
%%    byte,
%%    continue,
%%    decimalNumber,
%%    hexLiteral,
%%    hexNumber,
%%    identifier,
%%    int,
%%    numberUnit,
%%    placeholderStatement,
%%    pragma_directive,
%%    stateMutability,
%%    storageLocation,
%%    stringLiteral,
%%    throw,
%%    uInt
%%%% Level 02 ..........................
%%    assemblyLabel,
%%    enumDefinition,
%%    fixed,
%%    identifierList,
%%    importDirective,
%%    numberLiteral,
%%    uFixed,
%%    userDefinedTypeName
%%%% Level 03 ..........................
%%    elementaryTypeName,
%%    pragmaDirective
%%%% Level 04 ..........................
%%    expression
%%%% Level 05 ..........................
%%    arrayTypeName,
%%    expressionList,
%%    indexAccess,
%%    indexedParameterList,
%%    inheritanceSpecifier,
%%    mapping,
%%    memberAccess,
%%    nameValueList,
%%    newExpression,
%%    parameterList,
%%    return,
%%    stateVariableDeclaration,
%%    tupleExpression,
%%    typeNameList,
%%    usingForDeclaration,
%%    variableDeclaration
%%%% Level 06 ..........................
%%    eventDefinition,
%%    functionCallArguments,
%%    functionTypeName,
%%    modifierInvocation,
%%    structDefinition,
%%    variableDefinition
%%%% Level 07 ..........................
%%    functionCall
%%%% Level 21 ..........................
%%    doWhileStatement,
%%    forStatement,
%%    ifStatement,
%%    whileStatement
%%%% Level 22 ..........................
%%    block
%%%% Level 41 ..........................
%%    functionalAssemblyExpression
%%%% Level 42 ..........................
%%    assemblyAssignment,
%%    assemblyLocalBinding
%%%% Level 43 ..........................
%%    inlineAssemblyBlock
%%%% Level 44 ..........................
%%    inlineAssemblyStatement
%%%% Level 62 ..........................
%%    modifierDefinition,
%%    functionDefinition
%%%% Level 63 ..........................
%%    contractDefinition
%%%% Level 64 ..........................
%%    sourceUnit
]).

-define(ALL_CLAUSE_EUNIT_CONTRACT_PART, [
    enumDefinition,
    eventDefinition,
    functionDefinition,
    modifierDefinition,
    stateVariableDeclaration,
    structDefinition,
    usingForDeclaration
]).

-define(ALL_CLAUSE_EUNIT_STATEMENT, [
    block,
    break,
    continue,
    doWhileStatement,
    forStatement,
    ifStatement,
    inlineAssemblyStatement,
    placeholderStatement,
    return,
    simpleStatement,
    throw,
    whileStatement
]).

-define(CODE_TEMPLATES, code_templates).

-define(CREATE_CODE_END,
    [_CodeFirst | _] = Code,
    {_, _MemorySize} = erlang:process_info(self(), memory),
    ?debugFmt("~ntime (ms)          ===  ~12.. B rule: ~s ~n", [erlang:monotonic_time(1000) - _Start, atom_to_list(Rule)]),
    ?debugFmt("~nmemory (bytes)     ===  ~12.. B rule: ~s ~n", [_MemorySize, atom_to_list(Rule)]),
    ?debugFmt("~ncode size (bytes) <===  ~12.. B rule: ~s ~n", [length(_CodeFirst), atom_to_list(Rule)]),
    ok
).

-define(CREATE_CODE_START,
    [garbage_collect(Pid) || Pid <- processes()],
    _Start = erlang:monotonic_time(1000)
).

-define(F_RANDOM, fun(X, Y) -> erlang:phash2(X) < erlang:phash2(Y) end).

-define(INT,
    [
        "int",
        "int8",
        "int16",
        "int24",
        "int32",
        "int40",
        "int48",
        "int56",
        "int64",
        "int72",
        "int80",
        "int88",
        "int96",
        "int104",
        "int112",
        "int120",
        "int128",
        "int136",
        "int144",
        "int152",
        "int160",
        "int168",
        "int176",
        "int184",
        "int192",
        "int200",
        "int208",
        "int216",
        "int224",
        "int232",
        "int240",
        "int248",
        "int256"
    ]
).

-define(MAX_BASIC, 250).
-define(MAX_CONTRACT_PART, ?MAX_BASIC * 4).
-define(MAX_STATEMENT, ?MAX_BASIC * 8).

-define(PATH_CT, "test").
-define(PATH_EUNIT, "test").

-define(TESTS_FROM_SOLIDITY_DOCS, [
%%  {"file name" , "section name", "title", "code"}
    % --------------------------------------------------------------------------
    {"Contracts", "Visibility and Getters", "Getter Functions",
        "
pragma solidity ^0.4.0;

contract Complex {
   struct Data {
       uint a;
       bytes3 b;
       mapping (uint => uint) map;
   }
   mapping (uint => mapping(bool => Data[])) public data;
}
"},
    % --------------------------------------------------------------------------
    {"Contracts", "Interfaces", "",
        "
pragma solidity ^0.4.11;

interface Token {
   function transfer(address recipient, uint amount);
}
"}
]).


-define(TIMETRAP_MINUTES, 10).

-define(UINT,
    [
        "uint",
        "uint8",
        "uint16",
        "uint24",
        "uint32",
        "uint40",
        "uint48",
        "uint56",
        "uint64",
        "uint72",
        "uint80",
        "uint88",
        "uint96",
        "uint104",
        "uint112",
        "uint120",
        "uint128",
        "uint136",
        "uint144",
        "uint152",
        "uint160",
        "uint168",
        "uint176",
        "uint184",
        "uint192",
        "uint200",
        "uint208",
        "uint216",
        "uint224",
        "uint232",
        "uint240",
        "uint248",
        "uint256"
    ]
).
