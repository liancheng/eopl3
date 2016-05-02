#lang eopl

(define (up lst)
  (cond [(null? lst) '()]
        [(list? (car lst)) (append (car lst)
                                   (up (cdr lst)))]
        [else (cons (car lst)
                    (up (cdr lst)))]))

(eopl:pretty-print (up '((1 2) (3 4))))
(eopl:pretty-print (up '((x (y)) z)))
