#lang racket
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (list '* (caddr exp) (list '** (cadr exp) (- (caddr exp) 1)))
          (deriv (cadr exp) var)
          
          )
         )
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(** x 3) 'x)