#lang racket
;(define (map proc items)
;  (if (null? items)
;      nil
;      (cons (proc (car items))
;            (map proc (cdr items)))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-interval n)
    (if (< n 1)
      null
      (append (enumerate-interval (- n 1))
              (list n))))

(define (unique-pairs n)
  (accumulate append null 
    (map
      (lambda (i)
        (map (lambda (j) (list j i))
          (enumerate-interval (- i 1))))
      (enumerate-interval n))))

;(unique-pairs 1)
(enumerate-interval 1)