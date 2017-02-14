#lang racket
(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
             result
             (iter (op result (car rest))
                   (cdr rest))))
  (iter initial sequence))
(define (reverse sequence)
  (fold-left (lambda (x y) (append (list y) x)) null sequence))
(reverse (list 1 2 3 4 5))