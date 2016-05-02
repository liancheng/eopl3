#lang eopl

(define (exists? pred lst)
  (cond [(null? lst) #f]
        [(pred (car lst)) #t]
        [else (exists? pred (cdr lst))]))

(eopl:pretty-print (exists? number? '(a b c 3 e)))
(eopl:pretty-print (exists? number? '(a b c d e)))
