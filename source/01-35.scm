#lang eopl

(require "01-31.scm")

(define (number-leaves tree)
  (define (number n node)
    (if (leaf? node)
      (list (+ n 1) (leaf n))
      (let* [(lson-result (number n (lson node)))
             (lson-n (car lson-result))
             (new-lson (cadr lson-result))
             (rson-result (number lson-n (rson node)))
             (rson-n (car rson-result))
             (new-rson (cadr rson-result))]
        (list rson-n (interior-node (contents-of node)
                                    new-lson
                                    new-rson)))))
  (cadr (number 0 tree)))

(eopl:pretty-print
  (number-leaves
    (interior-node 'foo
                   (interior-node 'bar
                                  (leaf 26)
                                  (leaf 12))
                   (interior-node 'baz
                                  (leaf 11)
                                  (interior-node 'quux
                                                 (leaf 117)
                                                 (leaf 14))))))
