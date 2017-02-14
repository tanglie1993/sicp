#lang racket
(define (leaves x)
  (cond ((null? x) (list))
        ((not (pair? x)) (list x))
        (else (append (leaves (car x))
                 (leaves (cdr x))))))
(define x (list 1 (list 2 (list 3 4))))
(leaves (list x x))
