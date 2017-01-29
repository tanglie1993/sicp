#lang racket
(define (compose f g)
  (lambda (x)(f (g x)))
  )
(define (inc n)
  (+ n 1))
(define (square n)
  (* n n))
((compose square inc) 6)