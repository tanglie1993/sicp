#lang racket
(define (repeated f currentFunction count)
  (cond((= count 1) currentFunction)
  (else (repeated f (lambda(x)(f (currentFunction x))) (- count 1)))
  )
  )
(define (square n)
  (* n n))
((repeated square square 2) 5)