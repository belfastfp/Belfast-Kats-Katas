def sing(n: int, song: str=""):

    song_template = "{0} {2} of beer on the wall, {0} {2} of beer. "\
             + " Take one down and pass it around, {1} {3} of beer on the wall. "

    #Mistake here, 0 doesn't get called!
    return song + song_template.format(n, n-1, "bottle", "bottles") if n == 1 else \
        sing(n-1, song + song_template.format(n, n-1, "bottles", "bottle")) if n == 2 else \
        sing(n-1, song + song_template.format(n, n-1, "bottles", "bottles")) if n > 0 else \
        song + "No more bottles of beer on the wall, no more bottles of beer." + \
        " Go the store and buy some more, 99 bottles of beer on the wall."
