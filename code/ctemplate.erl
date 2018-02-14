%%%-------------------------------------------------------------------
%%% @author d-sasaki
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 2 2018 11:19
%%%-------------------------------------------------------------------
-module(ctemplate).
-compile(export_all).

%% 8.8 並行プログラムはどう書く? P123
%% 並行プログラムを書く時、筆者は次のようなコードを基に書き始めることが多い

start() ->
  spawn(fun() -> loop([]) end).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop(X) ->
  receive
    Any ->
      io:format("Received: ~p~n", [Any]),
      loop(X)
  end.

