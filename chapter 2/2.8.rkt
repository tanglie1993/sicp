#lang racket
(define (make-interval a b) (cons a b))
(define (lower-bound a) (car a))
(define (upper-bound a) (cdr a))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
  (+ (upper-bound x) (upper-bound y))))
(define (minus-interval x y)
  (make-interval (- (lower-bound y) (upper-bound x))
  (- (upper-bound y) (lower-bound x))))

(add-interval (make-interval 1 2) (make-interval 3 4))
(minus-interval (make-interval 1 2) (make-interval 3 4))