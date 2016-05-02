#lang eopl

(define (list-index pred lst)
  (cond [(null? lst) #f]
        [(pred (car lst)) 0]
        [else
          (let ([index (list-index pred (cdr lst))])
            (if index (+ 1 index) #f))]))

(eopl:pretty-print (list-index number? '(a 2 (1 3) b 7)))
(eopl:pretty-print (list-index symbol? '(a (b c) 17 foo)))
(eopl:pretty-print (list-index symbol? '(1 2 (a b) 3)))
