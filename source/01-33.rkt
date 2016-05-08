#lang eopl

(require "01-31.scm"
         rackunit)

(define (mark-leaves-with-red-depth tree)
  (let mark [(n 0) (node tree)]
    (cond [(leaf? node) (leaf n)]
          [(eqv? (contents-of node) 'red)
           (interior-node 'red
                          (mark (+ n 1) (lson node))
                          (mark (+ n 1) (rson node)))]
          [else (interior-node (contents-of node)
                               (mark n (lson node))
                               (mark n (rson node)))])))

(check-equal? (mark-leaves-with-red-depth
                (interior-node 'red
                               (interior-node 'bar
                                              (leaf 26)
                                              (leaf 12))
                               (interior-node 'red
                                              (leaf 11)
                                              (interior-node 'quux
                                                             (leaf 117)
                                                             (leaf 14)))))
              '(red (bar 1 1)
                    (red 2
                         (quux 2 2))))
