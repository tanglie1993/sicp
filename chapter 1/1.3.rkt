#lang racket
(define (max a b c)
  (cond ((and (or (> a b)(= a b)) (or (> a c)(= a c))) a)
        ((and (or (> b a)(= b a)) (or (> b c)(= b c))) b)
        (else c)))