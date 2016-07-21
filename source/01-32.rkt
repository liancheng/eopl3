#lang eopl

(require "01-31.scm"
         rackunit)

;; begin
(define (double-tree tree)
  (cond [(leaf? tree)
         (leaf (* 2 (contents-of tree)))]
        [else
          (interior-node (contents-of tree)
                         (double-tree (lson tree))
                         (double-tree (rson tree)))]))
;; end

(check-equal? (double-tree
                (interior-node 'foo
                               (leaf 1)
                               (interior-node 'bar
                                              (leaf 3)
                                              (leaf 3))))
              '(foo 2 (bar 6 6)))
