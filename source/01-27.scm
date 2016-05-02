#lang eopl

(define (flatten slist)
  (cond [(null? slist) '()]
        [(list? (car slist)) (append (flatten (car slist))
                                     (flatten (cdr slist)))]
        [else (cons (car slist)
                    (flatten (cdr slist)))]))

(eopl:pretty-print (flatten '(a b c)))
(eopl:pretty-print (flatten '((a) () (b ()) () (c))))
(eopl:pretty-print (flatten '((a b) c (((d)) e))))
(eopl:pretty-print (flatten '(a b (() (c)))))
