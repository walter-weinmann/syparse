%% -----------------------------------------------------------------------------
%%
%% syparse_util.erl: Solidity - parser utilities.
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
-module(syparse_util).

-export([pt_to_source/5]).

-define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% arrayTypeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {arrayTypeName, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "[]", NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {arrayTypeName, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "[", Value2New, "]"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% asIdentifier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {asIdentifier, {Value1, Value2}} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, " as ", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assemblyAssignment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {assemblyAssignment, [], Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {":=" ++ Value2New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {assemblyAssignment, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, ":=", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assemblyItem / contractPart / elementaryTypeNameExpression / enumValue / expressionStatement /
% primaryExpression / typeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {Type, Value} = ST)
    when Type == assemblyItem;
    Type == contractPart;
    Type == elementaryTypeNameExpression;
    Type == enumValue;
    Type == expressionStatement;
    Type == primaryExpression;
    Type == typeName ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assemblyItemCommalist / assemblyItemList / contractDefinitionImportPragmaDirectiveList / 
% contractPartList / enumValueCommalist / expressionList / functionDefinitionVisibilityList /
% identifierDotlist / importIdentifierCommalist / inheritanceSpecifierCommalist / nameValueList/
% parameterCommalist/ statementList / typeNameCommalist / variableDeclarationSemicolonlist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {Type, Values} = ST)
    when (Type == assemblyItemCommalist orelse
    Type == assemblyItemList orelse
    Type == contractDefinitionImportPragmaDirectiveList orelse
    Type == contractPartList orelse
    Type == enumValueCommalist orelse
    Type == expressionList orelse
    Type == functionDefinitionVisibilityList orelse
    Type == identifierDotlist orelse
    Type == importIdentifierCommalist orelse
    Type == indexedParameterCommalist orelse
    Type == inheritanceSpecifierCommalist orelse
    Type == nameValueList orelse
    Type == parameterCommalist orelse
    Type == statementList orelse
    Type == typeNameCommalist orelse
    Type == variableDeclarationSemicolonlist) andalso
    is_list(Values) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValuesNew, NewCtx1} = lists:foldl(fun(F, {Acc, CtxAcc}) ->
        ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n F: ~p~n", [F]),
        case F of
            {assemblyItem, _}
                when Type == assemblyItemCommalist;
                Type == assemblyItemList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> case Type == assemblyItemCommalist of
                                 true -> ",";
                                 _ -> " "
                             end
                    end,
                    SubAcc
                ]), CtxAcc1};
            {contractDefinition, _, _, _, _}
                when Type == contractDefinitionImportPragmaDirectiveList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {contractPart, _} ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {enumValue, _}
                when Type == enumValueCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {expression, _}
                when Type == expressionList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {expression, _, _}
                when Type == expressionList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {expression, _, _, _}
                when Type == expressionList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {expression, _, _, _, _}
                when Type == expressionList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {identifier, _}
                when Type == identifierDotlist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> "."
                    end,
                    SubAcc
                ]), CtxAcc1};
            {{identifier, _} = Identifier, Expression}
                when Type == nameValueList ->
                {IdentifierNew, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, Identifier),
                CtxAcc2 = case FType of
                              top_down -> Fun(ST, CtxAcc1);
                              bottom_up -> CtxAcc1
                          end,
                {ExpressionNew, CtxAcc3} = pt_to_source(FType, Fun, CtxAcc2, Lvl + 1, Expression),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    IdentifierNew,
                    ":",
                    ExpressionNew
                ]), CtxAcc3};
            {importDirective, _, _, _}
                when Type == contractDefinitionImportPragmaDirectiveList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {inheritanceSpecifier, _, _}
                when Type == inheritanceSpecifierCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {pragmaDirective, _, _}
                when Type == contractDefinitionImportPragmaDirectiveList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {statement, _}
                when Type == statementList ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {Acc ++ SubAcc, CtxAcc1};
            {SubType, _}
                when Type == functionDefinitionVisibilityList andalso
                (SubType == identifier orelse
                    SubType == stateMutability) ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {SubType, _, _}
                when Type == functionDefinitionVisibilityList andalso
                (SubType == functionCall orelse
                    SubType == modifierInvocation) ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    SubAcc
                ]), CtxAcc1};
            {typeName, _}
                when Type == typeNameCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            _
                when Type == functionDefinitionVisibilityList andalso
                (F == "constant" orelse
                    F == "external" orelse
                    F == "internal" orelse
                    F == "private" orelse
                    F == "public") ->
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> " "
                    end,
                    F
                ]), CtxAcc};
            {Value1, []}
                when Type == importIdentifierCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, Value1),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {variableDeclaration, _, _, _}
                when Type == variableDeclarationSemicolonlist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {lists:append([Acc, SubAcc, ";"]), CtxAcc1};
            {_, _}
                when Type == importIdentifierCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, {asIdentifier, F}),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {_, _}
                when Type == parameterCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, {parameter, F}),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1};
            {_, _, _}
                when Type == indexedParameterCommalist ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, {indexedParameter, F}),
                {lists:append([
                    Acc,
                    case length(Acc) of
                        0 -> [];
                        _ -> ","
                    end,
                    SubAcc
                ]), CtxAcc1}
        end
                                       end,
        {[], NewCtx},
        Values),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValuesNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assemblyLabel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {assemblyLabel, Value1} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ ":", NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assemblyLocalBinding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {assemblyLocalBinding, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["let ", Value1New, ":=", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {block, Values} = ST)
    when is_list(Values) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValuesNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {statementList, Values}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["{", ValuesNew, "}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% booleanLiteral / break / continue / elementaryTypeName/ hexLiteral / identifier / numberUnit /
% placeHolderStatement / stateMutability / storageLocation / stringLiteral / throw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {Type, Value} = ST)
    when Type == booleanLiteral;
    Type == break;
    Type == continue;
    Type == elementaryTypeName;
    Type == hexLiteral;
    Type == identifier;
    Type == numberUnit;
    Type == placeHolderStatement;
    Type == stateMutability;
    Type == storageLocation;
    Type == stringLiteral;
    Type == throw ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% contractDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {contractDefinition, Value1, Value2, [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([Value1, " ", Value2New, "{}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {contractDefinition, Value1, Value2, [], Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {contractPartList, Value4}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1, " ", Value2New, "{", Value4New, "}"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {contractDefinition, Value1, Value2, Value3, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {inheritanceSpecifierCommalist, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1, " ", Value2New, " is ", Value3New, "{}"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {contractDefinition, Value1, Value2, Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {inheritanceSpecifierCommalist, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, {contractPartList, Value4}),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append([Value1, " ", Value2New, " is ", Value3New, "{", Value4New, "}"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% doWhileStatement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {doWhileStatement, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["do ", string:strip(Value1New, left), " while(", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% enumDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {enumDefinition, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["enum ", Value1New, "{}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {enumDefinition, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {enumValueCommalist, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["enum ", Value1New, "{", Value2New, "}"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% eventDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {eventDefinition, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["event ", Value1New, Value2New, Value3, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% expression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {expression, {elementaryTypeName, _} = Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, {Type, _} = Value} = ST)
    when Type == newExpression; Type == primaryExpression ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, {SubType, _, _} = Value} = ST)
    when SubType == functionCall;
    SubType == indexAccess;
    SubType == memberAccess ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, "(", Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["(", ValueNew, ")"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, [], Value, UnaryOp} = ST)
    when UnaryOp == "++";
    UnaryOp == "--" ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew ++ UnaryOp, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, UnaryOp, Value, []} = ST)
    when UnaryOp == "!";
    UnaryOp == "~";
    UnaryOp == "delete";
    UnaryOp == "++";
    UnaryOp == "--";
    UnaryOp == "+";
    UnaryOp == "-";
    UnaryOp == "," ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([
        case UnaryOp of
            "delete" -> [];
            _ -> " "
        end,
        UnaryOp,
        case UnaryOp of
            "delete" ->
                case string:sub_string(ValueNew, 1, 1) of
                    " " -> [];
                    _ -> " "
                end;
            _ -> []
        end,
        ValueNew
    ]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, Value1, BinaryOp, Value2} = ST)
    when BinaryOp == "**";
    BinaryOp == "*";
    BinaryOp == "/";
    BinaryOp == "%";
    BinaryOp == "+";
    BinaryOp == "-";
    BinaryOp == "<<";
    BinaryOp == ">>";
    BinaryOp == "&";
    BinaryOp == "^";
    BinaryOp == "|";
    BinaryOp == "<";
    BinaryOp == ">";
    BinaryOp == "<=";
    BinaryOp == ">=";
    BinaryOp == "==";
    BinaryOp == "!=";
    BinaryOp == "&&";
    BinaryOp == "||";
    BinaryOp == "=";
    BinaryOp == "|=";
    BinaryOp == "^=";
    BinaryOp == "&=";
    BinaryOp == "<<=";
    BinaryOp == ">>=";
    BinaryOp == "+=";
    BinaryOp == "-=";
    BinaryOp == "*=";
    BinaryOp == "/=";
    BinaryOp == "%=";
    BinaryOp == "," ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([
        Value1New,
        " ",
        BinaryOp,
        case string:sub_string(Value2New, 1, 1) of
            " " -> [];
            _ -> " "
        end,
        Value2New
    ]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {expression, Value1, "?" = TenaryOp, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append([Value1New, TenaryOp, Value2New, ":", Value3New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% forStatement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, [], [], [], Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value4New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value4),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"for (;;)" ++ Value4New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, [], [], Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value3New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value3),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value4),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["for (;;", Value3New, ")", Value4New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, [], Value2, [], Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value4),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["for (;", Value2New, ";)", Value4New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, [], Value2, Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["for (;", Value2New, ";", Value3New, ")", Value4New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, Value1, [], [], Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value4),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["for (", Value1New, ";;)", Value4New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, Value1, [], Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["for (", Value1New, ";;", Value3New, ")", Value4New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, Value1, Value2, [], Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["for (", Value1New, ";", Value2New, ";)", Value4New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {forStatement, Value1, Value2, Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value4New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value4),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    RT = {lists:append(["for (", Value1New, ";", Value2New, ";", Value3New, ")", Value4New]), NewCtx8},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionalAssemblyExpression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {functionalAssemblyExpression, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "()", NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionalAssemblyExpression, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {assemblyItemCommalist, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "(", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionCall
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {functionCall, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([Value1New, "()"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionCall, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "(", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionCallArguments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {functionCallArguments, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"{}", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionCallArguments, {expressionList, _} = Value1} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionCallArguments, {nameValueList, _} = Value1} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["{", Value1New, "}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, [], [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["function ", Value2New, ";"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, [], [], Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value5New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value5),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value2New, Value5New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, [], Value4, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value4),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value2New, " returns", Value4New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, [], Value4, Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value4New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value4),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value5New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value5),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value2New, " returns", Value4New, Value5New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, Value3, [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value2New, Value3New, " ", ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, Value3, [], Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value5New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value5),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value2New, Value3New, " ", Value5New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, Value3, Value4, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value2New, Value3New, " returns", Value4New, ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, [], Value2, Value3, Value4, Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value5New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value5),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    RT = {lists:append(["function ", Value2New, Value3New, " returns", Value4New, Value5New]), NewCtx8},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, [], [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, [], [], Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value5New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value5),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, Value5New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, [], Value4, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, " returns", Value4New, ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, [], Value4, Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value5New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value5),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, " returns", Value4New, Value5New]), NewCtx8},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, Value3, [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, Value3New, " ", ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, Value3, [], Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value5New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value5),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, Value3New, " ", Value5New]), NewCtx8},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, Value3, Value4, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value4New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value4),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, Value3New, " returns", Value4New, ";"]), NewCtx8},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionDefinition, Value1, Value2, Value3, Value4, Value5} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, {functionDefinitionVisibilityList, Value3}),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    {Value4New, NewCtx7} = pt_to_source(FType, Fun, NewCtx6, Lvl + 1, Value4),
    NewCtx8 = case FType of
                  top_down -> NewCtx7;
                  bottom_up -> Fun(ST, NewCtx7)
              end,
    {Value5New, NewCtx9} = pt_to_source(FType, Fun, NewCtx8, Lvl + 1, Value5),
    NewCtx10 = case FType of
                   top_down -> NewCtx9;
                   bottom_up -> Fun(ST, NewCtx9)
               end,
    RT = {lists:append(["function ", Value1New, Value2New, Value3New, " returns", Value4New, Value5New]), NewCtx10},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionTypeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {functionTypeName, Value1, [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"function " ++ Value1New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionTypeName, Value1, [], Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value1New, " returns", Value3New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionTypeName, Value1, Value2, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["function ", Value1New, Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {functionTypeName, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {functionDefinitionVisibilityList, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["function ", Value1New, Value2New, " returns", Value3New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% identifierList
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {identifierList, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"()", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {identifierList, Values} = ST)
    when is_list(Values) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValuesNew, NewCtx1} = lists:foldl(fun(F, {Acc, CtxAcc}) ->
        ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n F: ~p~n", [F]),
        case F of
            44 ->
                {Acc ++ ",", CtxAcc};
            "," ->
                {Acc ++ ",", CtxAcc};
            {identifier, _} ->
                {SubAcc, CtxAcc1} = pt_to_source(FType, Fun, CtxAcc, Lvl + 1, F),
                {Acc ++ SubAcc, CtxAcc1}
        end
                                       end,
        {[], NewCtx},
        Values),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["(", ValuesNew, ")"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ifStatement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {ifStatement, Value1, Value2, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["if (", Value1New, ")", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {ifStatement, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["if(", Value1New, ")", Value2New, "else ", string:strip(Value3New, left)]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% importDirective
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, "*", [], Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value3New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value3),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["import * from ", Value3New, ";"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, "*", Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["import * as ", Value2New, " from ", Value3New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, "{", Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {importIdentifierCommalist, Value2}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["import{", Value2New, "}from ", Value3New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, Value1, [], []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["import ", Value1New, ";"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, Value1, Value2, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["import ", Value1New, " as ", Value2New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, Value1, [], Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["import ", Value1New, " from ", Value3New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {importDirective, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["import ", Value1New, " as ", Value2New, " from ", Value3New, ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indexAccess
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {indexAccess, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "[]", NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {indexAccess, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "[", Value2New, "]"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indexedParameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {indexedParameter, {Value1, Value2, []}} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([
        Value1New,
        case Value2 of
            [] -> [];
            _ -> " "
        end,
        Value2
    ]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {indexedParameter, {Value1, Value2, Value3}} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([
        Value1New,
        case Value2 of
            [] -> [];
            _ -> " "
        end,
        Value2,
        " ",
        Value3New
    ]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indexedParameterList / ParameterList
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {Type, []} = ST)
    when Type == indexedParameterList;
    Type == parameterList ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"()", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {Type, Value} = ST)
    when Type == indexedParameterList;
    Type == parameterList ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {case Type of
                                                                         indexedParameterList ->
                                                                             indexedParameterCommalist;
                                                                         parameterList ->
                                                                             parameterCommalist
                                                                     end, Value}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["(", ValueNew, ")"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inheritanceSpecifier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {inheritanceSpecifier, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {inheritanceSpecifier, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {expressionList, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "(", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inlineAssemblyBlock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {inlineAssemblyBlock, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"{}", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {inlineAssemblyBlock, Value} = ST)
    when is_list(Value) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {assemblyItemList, Value}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["{", ValueNew, "}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% inlineAssemblyStatement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {inlineAssemblyStatement, [], Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"assembly " ++ Value2New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {inlineAssemblyStatement, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["assembly ", Value1New, " ", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mapping
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {mapping, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["mapping(", Value1New, "=>", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% memberAccess
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {memberAccess, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, ".", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modifierDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {modifierDefinition, Value1, [], Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["modifier ", Value1New, Value3New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {modifierDefinition, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append(["modifier ", Value1New, Value2New, Value3New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% modifierInvocation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {modifierInvocation, {identifier, _} = Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {modifierInvocation, {identifier, _} = Value1, "("} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "()", NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {modifierInvocation, {identifier, _} = Value1, Value2} = ST)
    when is_list(Value2) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {expressionList, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "(", Value2New, ")"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% newExpression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {newExpression, Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"new " ++ ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% numberLiteral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {numberLiteral, Value, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {numberLiteral, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([Value1, " ", Value2New]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {parameter, {Value1, []}} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([Value1New]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {parameter, {Value1, Value2}} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, " ", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pragmaDirective
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {pragmaDirective, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["pragma ", Value1New, " ", Value2]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {return, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"return", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {return, Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"return " ++ string:strip(ValueNew, left), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sourceUnit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {sourceUnit, Values} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValuesNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {contractDefinitionImportPragmaDirectiveList, Values}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValuesNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% statement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {Type, {SubType, Value}} = ST)
    when Type == statement, SubType == break;
    Type == statement, SubType == continue;
    Type == statement, SubType == throw ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value ++ ";", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {Type, {SubType, _} = Value} = ST)
    when Type == simpleStatement, SubType == expressionStatement;
    Type == statement, SubType == block;
    Type == statement, SubType == break;
    Type == statement, SubType == continue;
    Type == statement, SubType == inlineAssemblyStatement;
    Type == statement, SubType == placeHolderStatement;
    Type == statement, SubType == return;
    Type == statement, SubType == simpleStatement;
    Type == statement, SubType == throw ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew ++ case Type of
                          statement ->
                              case SubType of
                                  block -> [];
                                  _ -> ";"
                              end;
                          _ -> []
                      end, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {Type, {SubType, _, _} = Value} = ST)
    when Type == expressionStatement, SubType == expression;
    Type == simpleStatement, SubType == variableDefinition;
    Type == statement, SubType == doWhileStatement;
    Type == statement, SubType == inlineAssemblyStatement;
    Type == statement, SubType == whileStatement ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew ++ case Type of
                          statement ->
                              case SubType of
                                  doWhileStatement -> ";";
                                  simpleStatement -> ";";
                                  _ -> []
                              end;
                          _ -> []
                      end, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {Type, {SubType, _, _, _} = Value} = ST)
    when Type == expressionStatement, SubType == expression;
    Type == statement, SubType == ifStatement ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew ++ case Type of
                          statement ->
                              case SubType of
                                  expressionStatement -> ";";
                                  _ -> []
                              end;
                          _ -> []
                      end, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {statement, {forStatement, _, _, _, _} = Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% stateVariableDeclaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {stateVariableDeclaration, Value1, [], Value3, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, " ", Value3New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {stateVariableDeclaration, Value1, [], Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append([Value1New, " ", Value3New, "=", Value4New, ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {stateVariableDeclaration, Value1, Value2, Value3, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, " ", Value2, " ", Value3New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {stateVariableDeclaration, Value1, Value2, Value3, Value4} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value4New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value4),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append([Value1New, " ", Value2, " ", Value3New, "=", Value4New, ";"]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% structDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {structDefinition, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["struct ", Value1New, "{}"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {structDefinition, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, {variableDeclarationSemicolonlist, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["struct ", Value1New, "{", Value2New, "}"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tupleExpression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {tupleExpression, Value1, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {case Value1 of
              "(" -> "()";
              "[" -> "[]"
          end, NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {tupleExpression, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append([
        Value1,
        Value2New,
        case Value1 of
            "(" -> ")";
            "[" -> "]"
        end
    ]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% typeNameList
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, _Lvl, {typeNameList, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"()", NewCtx1},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {typeNameList, Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {typeNameCommalist, Value}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["(", ValueNew, ")"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% userDefinedTypeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {userDefinedTypeName, Value} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, {identifierDotlist, Value}),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% usingForDeclaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {usingForDeclaration, Value1, "*"} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {lists:append(["using ", Value1New, " for *;"]), NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {usingForDeclaration, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["using ", Value1New, " for ", Value2New, ";"]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variableDeclaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {variableDeclaration, Value1, [], Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value3New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value3),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, " ", Value3New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

pt_to_source(FType, Fun, Ctx, Lvl, {variableDeclaration, Value1, Value2, Value3} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    {Value3New, NewCtx5} = pt_to_source(FType, Fun, NewCtx4, Lvl + 1, Value3),
    NewCtx6 = case FType of
                  top_down -> NewCtx5;
                  bottom_up -> Fun(ST, NewCtx5)
              end,
    RT = {lists:append([Value1New, " ", Value2New, " ", Value3New]), NewCtx6},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variableDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {variableDefinition, {identifierList, _} = Value, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"var " ++ ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {variableDefinition, Value, []} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {variableDefinition, {identifierList, _} = Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["var ", Value1New, "=", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;
pt_to_source(FType, Fun, Ctx, Lvl, {variableDefinition, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append([Value1New, "=", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% whileStatement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(FType, Fun, Ctx, Lvl, {whileStatement, Value1, Value2} = ST) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = pt_to_source(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = pt_to_source(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {lists:append(["while (", Value1New, ")", Value2New]), NewCtx4},
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Not yet supported
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pt_to_source(_FType, Fun, Ctx, _Lvl, PTree) ->
    ?debugFmt(?MODULE_STRING ++ ":pt_to_source ===> Start ~p~n PTree: ~p~n", [_Lvl, PTree]),
    Fun(PTree, Ctx),
    throw({"Parse tree not supported", PTree}).
