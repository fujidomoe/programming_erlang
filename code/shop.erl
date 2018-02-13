%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 2 2018 10:45
%%%-------------------------------------------------------------------
-module(shop).

-export([cost/1]).

cost(oranges) ->
  5;
cost(newspaper) ->
  8;
cost(apples) ->
  2;
cost(pears) ->
  9;
cost(milk)->
  7.