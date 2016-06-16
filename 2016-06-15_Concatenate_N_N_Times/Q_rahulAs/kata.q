/@n: number
ksolve:{[n] r:{$[all 1_(~)prior x[1] cut x 0;x;(x 0;1+x 1)]  } over (string n;1); ("I"$r[1]#r 0; count[r 0] div r 1)}

/ below line generates random number and runs ksolve funtion on it
/ output: number, number which repeats itself, no. of repeatation
(n;ksolve n:10 sv raze (1+rand 5)#enlist  (1+rand 7)?9)
