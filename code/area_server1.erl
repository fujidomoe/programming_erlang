%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 20:52
%%%-------------------------------------------------------------------
-module(area_server1).
-export([loop/0, rpc/2]).

%% rpc (remote procedure call) 遠隔手続き呼び出し
rpc(Pid, Request) ->
  Pid! {self(), Request},
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
      From ! {self(), error, Other},
      loop()
  end.

%% Pid = spawn(fun area_server1:loop/0).
%% area_server1:rpc(Pid, {rectangle, 6, 8}).
%% area_server1:rpc(Pid, {circle, 6}).
%% area_server1:rpc(Pid, socks).

