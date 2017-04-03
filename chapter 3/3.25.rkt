(define (close-enough? a b)
  (and (< (- a b) 0.01) (> (- a b) -0.01)))
(define (same-key? key records)
  (cond ((null? records) #f)
        ((close-enough? key (caar records)) (car records))
        (else (same-key? key (cdr records)))))
(define (lookup keys table)
  (let ((subtable (same-key? (car keys) (cdr table))))
    (if subtable
        (if (not (list? subtable))
            subtable
            (let ((record (same-key? (cadr keys) (cdr subtable))))
              (if record
                  (cdr record)
                  #f))
            )
        #f)))
(define (insert! keys value table)
  (let ((subtable (same-key? (car keys) (cdr table))))
    (if subtable
        (let ((record (same-key? (cadr keys) (cdr subtable))))
          (if record
              (set-cdr! record value)
              (set-cdr! subtable
                        (cons (cons (cadr keys) value)
                              (cdr subtable)))))
        (set-cdr! table
                  (cons (list (car keys)
                              (cons (cadr keys) value))
                        (cdr table)))))
  'ok)
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (let ((subtable (same-key? (car keys) (cdr local-table))))
        (if subtable
            (let ((record (same-key? (cadr keys) (cdr subtable))))
              (if record
                  (cdr record)
                  #f))
            #f)))
    (define (insert! keys value)
      (let ((subtable (same-key? (car keys) (cdr local-table))))
        (if subtable
            (let ((record (same-key? (cadr keys) (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons (cadr keys) value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list (car keys)
                                  (cons (cadr keys) value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
(define table (make-table))
((table 'insert-proc!) (list 1 1) 2)
((table 'insert-proc!) (list 1 2) 3)
((table 'lookup-proc) (list 1 1))
((table 'lookup-proc) (list 1 2))
((table 'lookup-proc) (list 1.1 2.1))