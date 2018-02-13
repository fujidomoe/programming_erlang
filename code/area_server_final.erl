%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 21:12
%%%-------------------------------------------------------------------
-module(area_server_final).
-export([start/0, area/2]).

%% spawnとrpcはモジュールの中に隠すことができる
%% こうしておけばクライアントのコードを変えずにサーバの内部を変えることができるなり

start() -> spawn(fun loop/0).

area(Pid, What) ->
  rpc(Pid, What).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Ht}} ->
      From ! {self(), Width * Ht},
      loop();
    {From, {circle, R}} ->
      From ! {self(), 3.14159 * R * R},
      loop();
    {From, Other} ->
      From ! {self(), {error, Other}},
      loop()
  end.

%% Pid = area_server_final:start().
%% area_server_final:area(Pid, {rectangle, 10, 8}).
%% area_server_final:area(Pid, {circle, 4}).

