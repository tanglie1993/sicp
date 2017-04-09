(require "stream-commons.rkt")

(define (show x)
  (begin (display x)
         (newline))
  x)
(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)

(define (stream-ref s n)
  (if (= n 0)
      (stream-first s)
      (stream-ref (stream-rest s) (- n 1))))
(define (stream-map proc s)
  (if (stream-empty? s)
      empty-stream
      (stream-cons (proc (stream-first s))
                   (stream-map proc (stream-rest s)))))
(define (stream-for-each proc s)
  (if (stream-empty? s)
      'done
      (begin (proc (stream-first s))
             (stream-for-each proc (stream-rest s)))))
(define (display-line x)
(newline)
(display x))
(define (display-stream s)
  (stream-for-each display-line s))
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1) high))))



(define x (stream-map show (stream-enumerate-interval 0 10)))
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(stream-ref y 7)
(display-stream z)

