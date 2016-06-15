-module(song_tests).
-include_lib("eunit/include/eunit.hrl").

zero_bottles_test_future() -> ["No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 0 bottles of beer on the wall."] = song:sing(0).

one_bottle_test() -> ["1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall.","No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 1 bottles of beer on the wall."] = song:sing(1).

two_bottles_test() -> ["2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall.","1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall.","No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 2 bottles of beer on the wall."] = song:sing(2).

three_bottles_test() -> ["3 bottles of beer on the wall, 3 bottles of beer. Take one down and pass it around, 2 bottles of beer on the wall.","2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall.","1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall.","No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 3 bottles of beer on the wall."] = song:sing(3).
