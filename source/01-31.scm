#lang eopl

(provide leaf
         interior-node
         leaf?
         lson
         rson
         contents-of)

(define (leaf n) n)

(define (interior-node name lson rson)
  (list name lson rson))

(define (leaf? tree)
  (number? tree))

(define lson cadr)

(define rson caddr)

(define (contents-of tree)
  (cond [(leaf? tree) tree]
        [else (car tree)]))
