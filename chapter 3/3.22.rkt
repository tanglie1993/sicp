(define (make-queue)
    (let ((front-ptr '())
          (rear-ptr '()))
        (define (insert-queue! item)
            (if (null? front-ptr)
                    (begin
                        (set! front-ptr (list item))
                        (set! rear-ptr front-ptr)
                        front-ptr)
                    (begin
                        (set-cdr! rear-ptr (list item))
                        (set! rear-ptr (cdr rear-ptr))
                        front-ptr)))
        (define (delete-queue!)
            (set! front-ptr (cdr front-ptr))
                    front-ptr)
        (define (dispatch m)
            (cond ((eq? m 'insert-queue!)
                    insert-queue!)
                  ((eq? m 'delete-queue!)
                    (delete-queue!))))
        dispatch))

(define q (make-queue))
((q 'insert-queue!) 'a)
((q 'insert-queue!) 'b)
((q 'insert-queue!) 'c)
((q 'insert-queue!) 'd)
(q 'delete-queue!)