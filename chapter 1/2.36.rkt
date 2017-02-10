#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
  null
  (cons (accumulate op init (getCar seqs))
        (accumulate-n op init (getCdr seqs)))))
(define (getCar seqs)
  (if(null? seqs) (list)
     (append (list (car (car seqs))) (getCar (cdr seqs)))))
(define (getCdr seqs)
  (if(null? seqs) (list)
     (append (list (cdr (car seqs))) (getCdr (cdr seqs)))))
(accumulate-n + 0 (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))