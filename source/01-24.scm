#lang eopl

(define (every? pred lst)
  (cond [(null? lst) #t]
        [(pred (car lst)) (every? pred (cdr lst))]
        [else #f]))

(eopl:pretty-print (every? number? '(a b c 3 e)))
(eopl:pretty-print (every? number? '(1 2 3 5 4)))
