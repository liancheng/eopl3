#lang eopl

(require "01-31.scm")

(define (double-tree tree)
  (cond [(leaf? tree)
         (leaf (* 2 (contents-of tree)))]
        [else
          (interior-node (contents-of tree)
                         (double-tree (lson tree))
                         (double-tree (rson tree)))]))

(eopl:pretty-print (interior-node 'foo
                                  (leaf 1)
                                  (interior-node 'bar
                                                 (leaf 3)
                                                 (leaf 3))))
