#lang racket
(define call-count 0)
(define (monitored f)
  (define (dispatch m)
    (begin (set! call-count (+ call-count 1))
             (f m)))
    dispatch)
(define (double number) (* 2 number))
((monitored double) 2)
((monitored double) 2)
call-count