#lang racket
(define (cont-frac n d k)
  (cond((= k 1) (/ n d))
  (else (/ n (+ d (cont-frac n d (- k 1))))))
  )

(define (iter-cont-frac n d k result currentIndex)
  (cond((= currentIndex k) result)
       (else (iter-cont-frac n d k (getResult n d result)
                             (+ 1 currentIndex))))
  )

(define (getResult n d result)
  (/ n (+ d result)))
(cont-frac 1 1 100)
(iter-cont-frac 1 1 100 0 0)