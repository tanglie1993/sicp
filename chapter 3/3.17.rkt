(define visited-nodes (list 0))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (visit n)
  (begin
    ;(display n) (newline)
    (append! visited-nodes (list n))
   )
)
(define (visited n)
  (check visited-nodes n))
(define (check nodes n)
  (cond
    ((null? nodes) #f)
    ((eq? (car nodes) n) #t)
    (else (check (cdr nodes) n))
    )
  )
  
(define (count-pairs x)
  (if (not (pair? x))
  0
  (if (and (visited (car x)) (visited (cdr x)))
      (+ (count-pairs (car x))
         (count-pairs (cdr x)))
      (begin
        (visit (car x))
        (visit (cdr x))
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1))
      )
  )
  )
(define a (cons 1 2))
;(count-pairs (cons (cons 1 2) (cons 3 4)))
;(count-pairs (cons 1 (cons a a)))
(count-pairs (cons (cons a a) (cons a a)))