%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc 第3章 逐次プログラミング　P28
%%%
%%% @end
%%% Created : 12. 2 2018 10:33
%%%-------------------------------------------------------------------
-module(geometry).

-export([area/1]).
area({rectangle, Width, Ht}) ->
  Width * Ht;

area({circle, R}) ->
  3.14159 * R * R;

area({square, X}) ->
  X * X.