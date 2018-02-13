%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 20:39
%%%-------------------------------------------------------------------
-module(area_server0).
-export([loop/0]).

loop() ->
  receive
    {rectangle, Width, Ht} ->
      io:format("Area ot rectangle is ~p~n", [Width * Ht]),
      loop();
    {circle, R} ->
      io:format("Area ot circle is ~p~n", [3.14159 * R * R]),
      loop();
    Other ->
      io:format("I dont know what the area og a ~p is ~n",[Other]),
      loop()
  end.
%% Pid = spawn(fun area_server0:loop/0).
%% Pid ! {rectangle, 6, 10}.
%% Pid ! {circle, 23}.
%% Pid ! {triangle, 2,4,5}.
