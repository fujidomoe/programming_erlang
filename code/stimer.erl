%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 21:52
%%%-------------------------------------------------------------------
-module(stimer).
-compile(export_all).

start(Time, Fun) -> spawn(fun() -> timer(Time, Fun) end).

cancel(Pid) -> Pid ! cancel.

timer(Time, Fun) ->
  receive
    cancel ->
      void
  after Time ->
    Fun()
  end.

%% N秒後に発火するよ
%% Pid = stimer:start(8000, fun() -> io:format("timer event~n") end).
%% Pid1 = stimer:start(4000, fun() -> io:format("timer event!!~n") end).
%% 上記を叩いた後に5秒以内に下記を叩くとcancelできるよ!
%% stimer:cancel(Pid).

