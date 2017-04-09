#lang racket
(require "stream-commons.rkt")

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs)
                                         fibs))))
(define factorial
    (cons-stream 1 
                 (mul-streams factorial
                              (stream-cdr integers))))