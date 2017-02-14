#lang racket
(define (reverse input output)
  (if (null? input) output (reverse (cdr input) (append (list (car input)) output))))
(define (deep-reverse input output)
  (if (null? input) output
      (if (pair? (car input))
          (deep-reverse (cdr input) (append (list (deep-reverse (car input) (list))) output))
          (deep-reverse (cdr input) (append (list (car input)) output))))
  )
(deep-reverse (list (list 1 2) (list 3 (list 4 5 6))) (list))