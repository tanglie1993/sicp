#lang racket
(define (square-tree x)
  (cond ((null? x) x)
        ((not (pair? x)) (* x x))
        (else (cons (square-tree (car x))
                 (square-tree (cdr x))))))
(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree (list x))
