#lang racket
(define (pascal row col)
  (cond ((= row 0) 1)
        ((= col 0) 1)
        (else (+ (pascal (- row 1) col) (pascal row (- col 1))))
      )
  
)
