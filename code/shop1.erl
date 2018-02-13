%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 2 2018 10:52
%%%
%%% usage
%%% shop1:total([{milk, 3},{pears,6}]).
%%%
%%%-------------------------------------------------------------------
-module(shop1).
-export([total/1]).

total([{What, N}| T]) ->
  shop:cost(What) * N + total(T);

total([]) ->
  0.
