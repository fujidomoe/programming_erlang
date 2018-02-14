%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 2 2018 11:02
%%%-------------------------------------------------------------------

-module(clock).
-compile(export_all).

start(Time, Fun) ->
  register(clock, spawn(fun() -> tick(Time, Fun) end)).

stop() -> clock ! stop.

tick(Time, Fun) ->
  receive
    stop ->
      void
  after Time ->
    Fun(),
    tick(Time, Fun)
  end.

%% 時計は止めるまで楽しげに時おｗ刻み続けてくれる
%% clock:start(5000, fun() -> io:format("TICK ~p~n",[erlang:now()]) end).
%% clock:stop().
