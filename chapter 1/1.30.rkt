#lang racket
(define (inc n) (+ n 1))
(define (cube n) (* n n n))


(define (iter-sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
(iter-sum cube 1 inc 3)