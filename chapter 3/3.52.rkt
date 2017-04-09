#lang racket
(require "stream-commons.rkt")

(define x (stream-map show (stream-enumerate-interval 0 10)))
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))

(stream-ref y 7)
(display-stream z)

