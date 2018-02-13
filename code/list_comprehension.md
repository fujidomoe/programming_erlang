## リスト内包表記



```
1> L = [1,2,3,4,5].
[1,2,3,4,5]

リストの各要素をそれぞれ2倍したい
2> lists:map(fun(X) -> 2 * X end , L).
[2,4,6,8,10]
3>
だがもっと簡単な方法がある。リスト内包表記を使う方法だ
3> [2*X || X <- L].
[2,4,6,8,10]
4>

Buyをリスト内包表記で個数を2倍にしてみる
4> Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears,6}, {milk, 3}].
[{oranges,4},{newspaper,1},{apples,10},{pears,6},{milk,3}]

5> [ {Name, 2 * Number} || {Name, Number} <- Buy ].
[{oranges,8},{newspaper,2},{apples,20},{pears,12},{milk,6}]


リストの各項目の名前部分を価格で置き換える
6> [{shop:cost(A), B} || {A,B} <- Buy].
[{5,4},{8,1},{2,10},{9,6},{7,3}]

各タプルの値の積を計算してみよう
8> [shop:cost(A)* B || {A,B} <- Buy].
[20,8,20,54,21]

合計!
9> lists:sum([shop:cost(A)* B || {A,B} <- Buy]).
123



```