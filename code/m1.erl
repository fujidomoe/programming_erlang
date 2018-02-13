%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 18:32
%%%-------------------------------------------------------------------
-module(m1).

%% API
-export([start/0]).

-ifdef(debug).
-define(TRACE(X), io:format("TRACE ~p:~p ~p~n",[?MODULE, ?LINE, X])).
-else.
-define(TRACE(X), void).
-endif.

start() -> loop(5).

loop(0) ->
  void;
loop(N) ->
  ?TRACE(N),
  loop(N - 1).
