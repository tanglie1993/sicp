#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (append1 seq1 seq2)
(accumulate cons seq2 seq1))
(append1 (list 1 2 3) (list 3 4 6 7))
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 x)) 0 sequence))
(length (list 3 4 6 7 8))

