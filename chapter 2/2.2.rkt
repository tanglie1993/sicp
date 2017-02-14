#lang racket
(define (make-segment start end)(cons start end))
(define (make-point x y)(cons x y))
(define (midpoint-segment segment)
  (cons (midx segment) (midy segment)))
(define (midx segment)(
                       average (car (car segment)) (car (cdr segment))))
(define (midy segment)(
                       average (cdr (car segment)) (cdr (cdr segment))))
(define (average a b)(/ (+ a b) 2))
(midpoint-segment (make-segment (cons 0 0) (cons 1 1)))