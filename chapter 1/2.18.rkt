#lang racket
(define (last l)
  (if (null? (cdr l)) (car l) (last (cdr l))))
(define (reverse input output)
  (if (null? input) output (reverse (cdr input) (append (list (car input)) output))))
(reverse (list 1 2 3 4) (list))