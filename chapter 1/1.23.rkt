#lang racket
(define (smallest-divisor n starttime)
  (find-divisor n 2 starttime))
(define (find-divisor n test starttime)
  (cond((> (* test test) n) n)
      ((= (remainder n test) 0) test)
      (else (find-divisor n (next test) starttime))
  )
)
(define (next n) (
                  cond((< n 3) (+ n 1))
                      (else (+ n 2)))
  )
(define (getNextPrime n starttime) (
    cond((= (smallest-divisor n starttime) n)
         (display (- (current-milliseconds) starttime))
         (newline)
         n)
         (else (getNextPrime (+ 1 n) starttime)))
        )
(getNextPrime 1000000000 (current-milliseconds))
(getNextPrime 100000000000 (current-milliseconds))
(getNextPrime 1000000000000 (current-milliseconds))
(getNextPrime 10000000000000 (current-milliseconds))
(getNextPrime 100000000000000 (current-milliseconds))
(getNextPrime 1000000000000000 (current-milliseconds))