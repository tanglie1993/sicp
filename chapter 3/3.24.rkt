(define (close-enough? a b)
  (and (< (- a b) 0.01) (> (- a b) -0.01)))
(define (same-key? key records)
  (cond ((null? records) #f)
        ((close-enough? key (caar records)) (car records))
        (else (same-key? key (cdr records)))))
(define (lookup key-1 key-2 table)
  (let ((subtable (same-key? key-1 (cdr table))))
    (if subtable
        (let ((record (same-key? key-2 (cdr subtable))))
          (if record
              (cdr record)
              #f))
        #f)))
(define (insert! key-1 key-2 value table)
  (let ((subtable (same-key? key-1 (cdr table))))
    (if subtable
        (let ((record (same-key? key-2 (cdr subtable))))
          (if record
              (set-cdr! record value)
              (set-cdr! subtable
                        (cons (cons key-2 value)
                              (cdr subtable)))))
        (set-cdr! table
                  (cons (list key-1
                              (cons key-2 value))
                        (cdr table)))))
  'ok)
(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (same-key? key-1 (cdr local-table))))
        (if subtable
            (let ((record (same-key? key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  #f))
            #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (same-key? key-1 (cdr local-table))))
        (if subtable
            (let ((record (same-key? key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
(define table (make-table))
((table 'insert-proc!) 1 1 2)
((table 'insert-proc!) 1 2 3)
((table 'lookup-proc) 1 1)
((table 'lookup-proc) 1 2)
((table 'lookup-proc) 1.001 2.001)
((table 'lookup-proc) 1.1 2.1)