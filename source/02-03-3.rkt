#lang eopl

(require "02-03-2.scm")

(define (diff-tree-plus n m)
  (diff n (diff (zero) m)))

(check-diff-tree=? (diff-tree-plus (zero) (one))
                   (one))

(check-diff-tree=? (diff-tree-plus (integer->diff-tree 1024)
                                   (integer->diff-tree 2048))
                   (integer->diff-tree 3072))
