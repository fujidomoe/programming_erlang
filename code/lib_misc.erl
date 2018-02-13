%%%-------------------------------------------------------------------
%%% @author sakura1116
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%% 名前は同じだけどアリティが異なる関数
%%%
%%% @end
%%% Created : 12. 2 2018 11:02
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("sakura1116").

-export([sum/1, sum/2, for/3, qsort/1, pythang/1, perms/1, odds_and_evens/1, odds_and_evens_acc/1, odds_and_evens_acc/3, sqrt/1]).

sum(L) ->
  sum(L,0).

sum([], N) ->
  N;

sum([H|T], N) ->
  sum(T, H+N).

for(Max, Max, F) ->
  [F(Max)];

for(I, Max, F) ->
  [F(I)| for(I + 1, Max, F)].

%% クイックソート(実際のプログライミングでは++の使い方は【よくない】とされているが、説明をわかりやすくする為に記述)
qsort([]) ->
  [];
qsort([Pivot|T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).


%% ピタゴラス数 = A*A + B*B = C*C
pythang(N) ->
  [
    {A,B,C} ||
    A <- lists:seq(1,N),
    B <- lists:seq(1,N),
    C <- lists:seq(1,N),
    A+B+C =< N,
    A*A+B*B =:= C*C
  ].

%% アナグラム
%% USAGE
%% lib_misc:perms("123").
perms([]) ->
  [[]];
perms(L) ->
  [ [H|T] || H <- L, T <- perms(L --[H]) ].


%% アキュムレータ
%% 1つの関数で2つのリストを得るにはどうすればよいか

%% このコードで問題なのは、リストを"2回"も辿っている点です
odds_and_evens(L) ->
  Odds  = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.


%% リストを2回辿らないようにするには、次のように書き換えればよい
%% これでリストをたどるのは1回だけになり、奇数の引数と偶数の引数をそれぞれ対応する出力リスト(アキュムレータ)に追加していくことができる
%% [H||filter(H)]方式と比較してアキュムレータを使ったほうが空間効率が良い。
odds_and_evens_acc(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H|Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H|Evens])
  end;

odds_and_evens_acc([], Odds, Evens) ->
  % {Odds, Evens}.
  {lists:reverse(Odds), lists:reverse(Evens)}.

%% エラーメッセージ
sqrt(X) when X < 0 ->
  erlang:error({squareRootNegativeArgument, X});

sqrt(X) ->
  math:sqrt(X).

