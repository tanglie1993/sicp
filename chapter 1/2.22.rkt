#lang racket
(define (square-list l)
  (sqlist l (list)))
(define (sqlist l output)
  (if (null? l) output
      (sqlist (cdr l) (append output (list (sqr (car l)))))
      )
  )
(define (sqr n) (* n n))
(square-list (list 1 2 3 4))