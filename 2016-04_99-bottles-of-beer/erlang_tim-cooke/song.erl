-module(song).
-include_lib("eunit/include/eunit.hrl").
-export([sing/1]).

sing(Bottles) ->
  sing(Bottles, Bottles, []).

sing(0, StartedWith, Acc) -> 
  Acc ++ ["No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, " ++ integer_to_list(StartedWith) ++ " bottles of beer on the wall."];
sing(1, StartedWith, Acc) ->
  sing(0, StartedWith, Acc ++ ["1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall."]);
sing(2, StartedWith, Acc) ->
  sing(1, StartedWith, Acc ++ ["2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall."]);
sing(Bottles, StartedWith, Acc) ->
  sing(Bottles - 1, StartedWith, Acc ++ [integer_to_list(Bottles) ++ " bottles of beer on the wall, " ++ integer_to_list(Bottles) ++ " bottles of beer. Take one down and pass it around, " ++ integer_to_list(Bottles - 1) ++ " bottles of beer on the wall."]).
    
