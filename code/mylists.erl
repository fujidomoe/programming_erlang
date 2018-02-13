%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 2 2018 12:05
%%% USAGE mylists:map(fun(X) -> 2 * X end, L).
%%%-------------------------------------------------------------------
-module(mylists).
-author("sakura1116").

%% API
-export([sum/1, map/2]).

sum([H|T]) ->
  H + sum(T);

sum([]) ->
  0.

map(_, []) ->
  [];

map(F, [H|T]) ->
  [F(H)| map(F,T)].