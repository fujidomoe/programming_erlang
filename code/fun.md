
funを返すfunの表記には多少の慣れが必要なので、どうなっているか少しわかりやすくする為にその表記を詳しく調べてみよう。
「普通の」値を返す関数は次のようになる。
```erlang
1> Double = fun(X) -> (2 * X) end.
#Fun<erl_eval.6.99386804>
2> Double(5).
10
```

括弧の中のfunは`fun(X) ->  * Times end` だ。これは単なるXの関数だが、Timesはどこから北のだえろう？
答えは「外側」のfunからだ。
```erlang
3> Mult = fun(Times) -> (fun(X) -> X * Times end) end .
#Fun<erl_eval.6.99386804>
4> Triple = Mult(3).
#Fun<erl_eval.6.99386804>
5> Triple(5).
15
```
つまり、MultはDoubleを一般化したものだ。この関数は、値を計算するのではなく、関数を返す。
その関数を呼び出すと、必要な値を計算してくれる。
