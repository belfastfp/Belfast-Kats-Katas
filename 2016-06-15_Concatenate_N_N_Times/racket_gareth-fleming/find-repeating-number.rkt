#lang racket

(provide find-repeating-number)

(define find-repeating-number
  (case-lambda
    [(num) (let ([str (~a num)]) (find-repeating-number str (string-length str) 1))]
    [(str strlen n)
     (if (> n (/ strlen 2))
	 'no-repeat
	 (let ([num (substring str 0 n)]
	       [repeats (quotient strlen n)])
	   (match (string-append* (make-list repeats num))
	     [(== str) (list (string->number num) repeats)]
	     [_ (find-repeating-number str strlen (+ 1 n))])))]))
