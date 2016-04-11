-module(bottles).
-export([start/0]).


start() -> pass(99).

pass(-1) -> ok;
pass(N) ->
    line1(N),
    line2(N-1),
    pass(N-1).


bottle_count(0) -> "no";
bottle_count(N) -> integer_to_list(N).

capitalise_first(S) ->
    F = fun([H|T]) -> [string:to_upper(H) | string:to_lower(T)] end,
    string:join(lists:map(F, string:tokens(S, "")), "").

pluralise(1) -> '';
pluralise(_) -> "s".

line1(N) ->
    io:format("~s bottle~s of beer on the wall, ~s bottle~s of beer.~n", [capitalise_first(bottle_count(N)),
                                                                          pluralise(N),
                                                                          bottle_count(N),
                                                                          pluralise(N)]).

line2(-1) ->
    io:format("Go to the store and buy some more, 99 bottles of beer on the wall.~n~n");
line2(N) ->
    io:format("Take one down and pass it around, ~s bottle~s of beer on the wall.~n~n", [bottle_count(N),
                                                                                         pluralise(N)]).
