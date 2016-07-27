-module(syparse_fold).

-export([fold/5]).

% -define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% arrayTypeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {arrayTypeName, Value1, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "[]", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {arrayTypeName, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ "[" ++ Value2New ++ "]", NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assignment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {assignment, Value1, {assignmentOp, AssignmentOp}, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ AssignmentOp ++ Value2New, NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% binaryOperation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {binaryOperation, Value1, {binaryOp, BinaryOp}, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ BinaryOp ++ Value2New, NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% booleanLiteral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, _Lvl, {booleanLiteral, Value} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elementaryTypeName, identifier, numberUnit, stringLiteral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, _Lvl, {Type, Value} = ST)
    when Type == elementaryTypeName; Type == identifier; Type == numberUnit; Type == stringLiteral ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% expression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {expression, {SubType, _} = Value} = ST)
    when SubType == newExpression;  SubType == primaryExpression ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {expression, {SubType, _, _} = Value} = ST)
    when SubType == indexAccess;  SubType == memberAccess;  SubType == primaryExpression ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {expression, {SubType, _, _, _} = Value} = ST)
    when SubType == functionCall;  SubType == primaryExpression ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {expression, {UnaryOp, _} = Value} = ST)
    when UnaryOp == "!"; UnaryOp == "~"; UnaryOp == "++"; UnaryOp == "--" ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {expression, {_, BinaryOp, _} = Value} = ST)
    when BinaryOp == "**"; BinaryOp == "*"; BinaryOp == " /"; BinaryOp == "&"; BinaryOp == "|";
    BinaryOp == "^"; BinaryOp == "&"; BinaryOp == "<<"; BinaryOp == "<<"; BinaryOp == "+";
    BinaryOp == "-"; BinaryOp == "<="; BinaryOp == ">="; BinaryOp == "<"; BinaryOp == ">";
    BinaryOp == "=="; BinaryOp == "!="; BinaryOp == "&&"; BinaryOp == "||" ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {Type, {SubType, _, _} = Value} = ST)
    when Type == statement, SubType == variableDefinition ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% expressionCommalist
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {Type, Values} = ST)
    when Type == expressionCommalist, is_list(Values) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = lists:foldl(fun(F, {Acc, CtxAcc}) ->
        case F of
            {ListType, _}
                when Type == expressionCommalist, ListType == expression ->
                ?debugFmt("wwe debugging fold/5 ===> ~n F: ~p~n", [F]),
                {SubAcc, CtxAcc1} = fold(FType, Fun, CtxAcc, Lvl + 1, F),
                {Acc ++ case length(Acc) of
                            0 -> [];
                            _ -> ","
                        end ++ SubAcc, CtxAcc1}
        end
                                      end,
        {[], NewCtx},
        Values),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% functionCall
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {functionCall, Value1, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "()", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {functionCall, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, {expressionCommalist, Value2}),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ "(" ++ Value2New ++ ")", NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% indexAccess
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {indexAccess, Value1, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1New ++ "[]", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {indexAccess, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ "[" ++ Value2New ++ "]", NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mapping
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {mapping, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {"mapping(" ++ Value1New ++ "=>" ++ Value2New ++ ")", NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% memberAccess
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {memberAccess, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ "." ++ Value2New, NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% newExpression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {newExpression, Value} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"new " ++ ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% numberLiteral
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, _Lvl, {numberLiteral, Value, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value, NewCtx1},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {numberLiteral, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value2New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value2),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {Value1 ++ " " ++ Value2New, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% primaryExpression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {primaryExpression, Value} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {primaryExpression, Value, "("} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"(" ++ ValueNew ++ ")", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, _Lvl, {return, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {"return;", NewCtx1},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {return, Value} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {"return " ++ ValueNew ++ ";", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% statement, typeName
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, _Lvl, {Type, {SubType, Value}} = ST)
    when Type == statement, SubType == break; Type == statement, SubType == continue;
    Type == statement, SubType == throw ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [_Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    NewCtx1 = case FType of
                  top_down -> NewCtx;
                  bottom_up -> Fun(ST, NewCtx)
              end,
    RT = {Value ++ ";", NewCtx1},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {Type, {SubType, _} = Value} = ST)
    when Type == statement, SubType == return; Type == statement, SubType == variableDefinition;
    Type == typeName, SubType == arrayTypeName; Type == typeName, SubType == elementaryTypeName;
    Type == typeName, SubType == identifier; Type == typeName, SubType == mapping ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {Type, {SubType, _, _} = Value} = ST)
    when Type == statement, SubType == variableDefinition ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unaryOperation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {unaryOperation, {unaryOp, UnaryOp}, Value} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {UnaryOp ++ case UnaryOp of
                         "delete" -> " ";
                         _ -> []
                     end ++ ValueNew, NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variableDeclaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {variableDeclaration, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ " " ++ Value2New, NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variableDefinition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(FType, Fun, Ctx, Lvl, {variableDefinition, Value, []} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {ValueNew, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    RT = {ValueNew ++ ";", NewCtx2},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;
fold(FType, Fun, Ctx, Lvl, {variableDefinition, Value1, Value2} = ST) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n ST: ~p~n", [Lvl, ST]),
    NewCtx = case FType of
                 top_down -> Fun(ST, Ctx);
                 bottom_up -> Ctx
             end,
    {Value1New, NewCtx1} = fold(FType, Fun, NewCtx, Lvl + 1, Value1),
    NewCtx2 = case FType of
                  top_down -> NewCtx1;
                  bottom_up -> Fun(ST, NewCtx1)
              end,
    {Value2New, NewCtx3} = fold(FType, Fun, NewCtx2, Lvl + 1, Value2),
    NewCtx4 = case FType of
                  top_down -> NewCtx3;
                  bottom_up -> Fun(ST, NewCtx3)
              end,
    RT = {Value1New ++ "=" ++ Value2New ++ ";", NewCtx4},
    ?debugFmt("wwe debugging fold/5 ===> ~n RT: ~p~n", [RT]),
    RT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Not yet supported
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fold(_FType, Fun, Ctx, _Lvl, PTree) ->
    ?debugFmt("wwe debugging fold/5 ===> Start ~p~n PTree: ~p~n", [_Lvl, PTree]),
    Fun(PTree, Ctx),
    throw({"Parse tree not supported", PTree}).
