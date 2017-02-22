#lang racket
(define (func n numbercount increment)
  (if (<= n 0)
      (list)
      (if (= numbercount 1)
          (list (list n))
      (append
       (prefix 1 (func (- n numbercount) (- numbercount 1) (+ increment 1)) (list))
       (each-each-add 1 (func (- n numbercount) numbercount (+ increment 1))))
      )
      )
  )
(define (prefix num inputlist temp)
  (if(null? inputlist)
     temp
     (prefix num (cdr inputlist)
             (append temp (list (append (list num) (each-add num (car inputlist)))))
      )
   )
)
(define (each-add num inputlist)
  (if (null? inputlist)
      (list)
      (append (list (+ (car inputlist) num)) (each-add num (cdr inputlist)))))

(define (each-each-add num inputlist)
  (if (null? inputlist)
      (list)
      (cons (each-add num (car inputlist)) (each-each-add num (cdr inputlist)))))


(func 12 3 0)