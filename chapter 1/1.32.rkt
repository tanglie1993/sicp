#lang racket
(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (plus m n) (+ m n))
(define (multiply m n) (* m n))

(define (accumulate combiner term a next b)
  (define (accumulateSingle a result)
    (if (> a b)
        result
        (accumulateSingle (next a) (combiner result (term a)))))
  (accumulateSingle (+ a 1) (term a)))

(define (recursive-accumulate combiner term a next b)
  (cond((= a b) (term a))
    (else (combiner (term b) (recursive-accumulate combiner term a next (- b 1))))
    ))
(accumulate plus cube 1 inc 3)
(accumulate multiply cube 1 inc 3)
(recursive-accumulate plus cube 1 inc 3)
(recursive-accumulate multiply cube 1 inc 3)