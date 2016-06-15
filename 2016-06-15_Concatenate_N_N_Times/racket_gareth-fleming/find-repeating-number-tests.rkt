#lang racket

(require rackunit
	 "find-repeating-number.rkt")
(check-equal? (find-repeating-number 123) 'no-repeat)
(check-equal? (find-repeating-number 7777777) 7)
(check-equal? (find-repeating-number 121212121212121212121212) 12)
