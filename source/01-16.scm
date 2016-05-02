#lang eopl

(define (invert lst)
  (map (lambda (pair)
         (list (cadr pair) (car pair)))
       lst))

(eopl:pretty-print (invert '((a 1) (a 2) (a 3))))
