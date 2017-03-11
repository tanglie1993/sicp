#lang racket
(define flag 0)
(define (f n)
  (cond (= n 0) ((set! flag 1) 0)
        (= n 1) ((if (= flag 1) 0 1))
        )
  )
(+ (f 0) (f 1))
