#lang eopl

(require rackunit)

(provide leaf interior-node leaf? lson rson contents-of)

;; begin
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
;; end

(check-equal? (leaf 1) 1)

(check-equal? (leaf? (leaf 1)) #t)

(check-equal? (interior-node 'foo (leaf 1) (leaf 2)) '(foo 1 2))

(let [(tree (interior-node 'foo
                           (leaf 1)
                           (leaf 2)))]
  (check-equal? (leaf? tree) #f)
  (check-equal? (lson tree) 1)
  (check-equal? (rson tree) 2)
  (check-equal? (contents-of tree) 'foo)
  (check-equal? (contents-of (lson tree)) 1)
  (check-equal? (contents-of (rson tree)) 2))
