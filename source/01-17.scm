#lang eopl

(define (down lst)
  (map list lst))

(eopl:pretty-print (down '(1 2 3)))
(eopl:pretty-print (down '(a (more (compliated)) object)))
