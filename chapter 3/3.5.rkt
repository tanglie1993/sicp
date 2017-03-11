#lang racket
(define (get-random-coordinate num)
    (cons (/ (random 10000) 10000)  (/ (random 10000) 10000)))
  (define (success coordinate)
    (begin

      (< (+ (* (car coordinate) (car coordinate))
          (* (cdr coordinate) (cdr coordinate)))
       1)
      )
    )

  (define (trial num)
    
    (if (success (get-random-coordinate num))
        true
        false)
    )

(define (estimate-probability current-trial-count total-trial-count succeeded-trial-count)
   (if (= current-trial-count total-trial-count)
       (/ succeeded-trial-count total-trial-count)
       (if (trial current-trial-count)
           (estimate-probability (+ current-trial-count 1) total-trial-count (+ succeeded-trial-count 1))
           (estimate-probability (+ current-trial-count 1) total-trial-count succeeded-trial-count)
       )
    )
   )
  

(define estimate-pi (* 4  (estimate-probability 0 1000 0)))
(define xx get-random-coordinate)
estimate-pi