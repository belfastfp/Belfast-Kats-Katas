-module(song).
-export([sing/1]).

sing(Bottles) ->
  sing(Bottles, Bottles).

sing(0, StartedWith) -> 
  io:format("Zero bottles~n");
sing(1, StartedWith) ->
  io:format("One bottle~n");
sing(Bottles, StartedWith) ->
  io:format("~B bottles~n", [Bottles]).
    
