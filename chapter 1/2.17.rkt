#lang racket
(define (last l)
  (if (null? (cdr l)) (car l) (last (cdr l))))
(last (list 1 2 3 4))