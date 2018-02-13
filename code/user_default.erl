%%%-------------------------------------------------------------------
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 2 2018 20:02
%%%-------------------------------------------------------------------
-module(user_default).

-compile([export_all]).

%% P105参照
%% erl_hellを起動してhelp().と入力して返ってきた結果は全て、shell_defaultで定義されたものになります
%% 自分でコマンドを定義したい場合位は、user_defaultというモジュールを作成してください
%% するとそのファイルでで作成された関数は、グローバルに利用できます(意訳)

hello() ->
  "Hello Jpe how are you".

away(Time) ->
  io:format("hoe is away and will be back in ~w minutes~n", [Time]).
