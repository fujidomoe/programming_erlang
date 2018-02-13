%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 2 2018 12:14
%%%
%%% USAGE
%%% Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears,6}, {milk, 3}].
%%% shop2:total(Buy).
%%%-------------------------------------------------------------------
-module(shop2).
-author("sakura1116").

-export([total/1]).
-import(lists, [map/2, sum/1]).

total(L) ->
  sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).

