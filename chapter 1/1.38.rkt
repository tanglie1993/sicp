#lang racket
(define (cont-frac k currentIndex)
  (cond((= k currentIndex) (/ 1 (getD k)))
  (else (/ 1 (+ (getD currentIndex) (cont-frac k (+ currentIndex 1))))))
  )


(define (getD k)
   (cond((= 2 (remainder k 3))
         (* 2 (/ (+ k 1) 3)))
       (else 1)))
(cont-frac 100 1)