#lang racket
(define (same-parity . n)
  (if (null? n) (list)
        (real-same-parity (car n) (list) n)))
(define (real-same-parity first output . input)
   (if (null? (car input)) output
        (if (= (remainder (car (car input)) 2) (remainder first 2))
               (real-same-parity first (append output (list (car (car input)))) (cdr (car input)))
               (real-same-parity first output (cdr (car input)))
        )
    )
)
(same-parity 1 2 3 4 5 6 7)