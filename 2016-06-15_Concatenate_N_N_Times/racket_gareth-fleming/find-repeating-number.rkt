#lang racket

(provide find-repeating-number)

(define find-repeating-number
  (case-lambda
    [(num) (find-repeating-number (~a num) 1)]
    [(str n)
     (if (> n (string-length str))
         'no-repeat
         (let ([num (string->number (substring str 0 n))])
           (match (string-append* (make-list num (~a num)))
             [(== str) num]
             [_ (find-repeating-number str (+ 1 n))])))]))
