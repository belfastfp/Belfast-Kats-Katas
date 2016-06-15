#lang racket

(provide find-repeating-number)

(define find-repeating-number
  (case-lambda
    [(num) (let ([str (~a num)]) (find-repeating-number str (string-length str) 1))]
    [(str strlen n)
     (if (> n (/ strlen 2))
	 'no-repeat
	 (let ([num (string->number (substring str 0 n))])
	   (match (string-append* (make-list num (~a num)))
	     [(== str) num]
	     [_ (find-repeating-number str strlen (+ 1 n))])))]))
