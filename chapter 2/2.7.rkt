#lang racket
(define (make-interval a b) (cons a b))
(define (lower-bound a) (car a))
(define (upper-bound a) (cdr a))
(lower-bound (make-interval 3 7))
(upper-bound (make-interval 3 7))