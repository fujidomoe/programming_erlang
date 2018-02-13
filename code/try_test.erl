%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 13:45
%%%-------------------------------------------------------------------
-module(try_test).

%% API
-export([generate_exception/1, demo1/0, demo2/0, demo3/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'Exit', a};
generate_exception(5) -> erlang:error(a).

demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, nomal, Val}
    catch
      throw:X -> {N, caught, thrown, X};
      exit:X  -> {N, caught, exited, X};
      error:X -> {N, caught, error, X}
  end.

%% この結果とtry..catchの結果を比べると、問題の原因を解析する過程で多くの情報が失われていることがわかる。
demo2() ->
  [ {I, (catch generate_exception(I))}|| I <- [1,2,3,4,5] ].

%% スタックトレース
demo3() ->
  try generate_exception(5)
  catch
    error:X ->
      {X, erlang:get_stacktrace()}
  end.
