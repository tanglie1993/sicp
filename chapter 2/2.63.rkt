#lang racket
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))
(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))


(define (get-tree inputlist initial)
  (if (null? inputlist)
      initial
      (if (null? initial)
          (get-tree (cdr inputlist)
                    (make-tree (car inputlist) '() '()))
          (get-tree (cdr inputlist)
                    (adjoin-set (car inputlist) initial))
          )
      
      )
  )

(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((number? set2) (adjoin-set set2 set1))
        (else (union-set (union-set
               (adjoin-set (entry set2) set1)
               (left-branch set2)) (right-branch set2)))
        )
  )

(define (traversal set)
  (cond ((null? set) null)
        ((number? set) (list set))
        (else (append (list (entry set))
                      (traversal (left-branch set))
                      (traversal (right-branch set))))
        )
  )

(traversal (union-set (get-tree (list 3 2 4 1 5) null) (get-tree (list 3 2 4 7 8) null)))







