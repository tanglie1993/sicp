#lang racket
(load "D:/sicp/chapter 2/commons.rkt")

;
;(define (queens board-size)
;  (define (queen-cols k)
;    (if (= k 0)
;        (list empty-board)
;        (filter
;         (lambda (positions) (safe? k positions))
;         (flatmap
;          (lambda (rest-of-queens)
;            (map (lambda (new-row)
;                   (adjoin-position new-row k rest-of-queens))
;                 (enumerate-interval 1 board-size)))
;          (queen-cols (- k 1))))))
;  (queen-cols board-size))
;
;(define empty-board (list))
;(define (adjoin-position new-row k rest-of-queens)
;  (append (list new-row) rest-of-queens))
;(define (safe? size positions)
;  (if (null? positions)
;      true
;      (if (first-safe? positions)
;          (safe? size (cdr positions))
;          false)
;      )
;  )
;(define (first-safe? positions)
;  (if (null? positions)
;      true
;      (and (not (contains positions 0))
;           (not (contains positions 1))
;           (not (contains positions -1))
;           )
;      )
;  )
;
;(define (contains seq increment)
;  (if (null? seq)
;      false
;      (if (not (pair? seq))
;          false
;          (contains3 (cdr seq) (+ (car seq) increment) increment)
;          )
;      )
;  )
;
;(define (contains3 seq number increment)
;  (if (null? seq)
;      false
;      (if (= (car seq) number)
;          true
;          (contains3 (cdr seq) (+ number increment) increment)
;          )
;      )
;  )
;
;;(safe? 8 (list 1 2 3 4 5 6 7 8))
;(safe? 8 (list 6 2 7 1 4 8 5 3))
;(queens 8)
;;(safe? 8 (list 1 5 9))