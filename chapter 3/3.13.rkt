
(define (append! x y)
  (set-cdr! (cdr x) y)
  x)
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
(cdr x)
(define w (append! x y))
(cdr x)



