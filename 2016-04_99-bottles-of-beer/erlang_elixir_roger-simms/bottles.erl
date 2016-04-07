-module(bottles).
-export([start/0]).


bottle_count(N) when N > 0 -> integer_to_list(N);
bottle_count(_) -> "no".

capitalise_first(S) ->
    F = fun([H|T]) -> [string:to_upper(H) | string:to_lower(T)] end,
    string:join(lists:map(F, string:tokens(S, "")), "").

pluralise(N) when N /= 1 -> "s";
pluralise(_) -> ''.

line1(N) ->
    io:format("~s bottle~s of beer on the wall, ~s bottle~s of beer.~n", [capitalise_first(bottle_count(N)),
                                                                          pluralise(N),
                                                                          bottle_count(N),
                                                                          pluralise(N)]).

line2(N) when N > 0 ->
    io:format("Take one down and pass it around, ~s bottle~s of beer on the wall.~n~n", [bottle_count(N),
                                                                                         pluralise(N)]);
line2(_) ->
    io:format("Go to the store and buy some more, 99 bottles of beer on the wall.~n~n").


start() -> pass(99).

pass(N) when N < 100 andalso N > -1 ->
    line1(N),
    line2(N-1),
    pass(N-1);

pass(_) -> ok.
