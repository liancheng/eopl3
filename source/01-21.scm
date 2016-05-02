#lang eopl

(define (product sos1 sos2)
  (flat-map (lambda (e1)
              (map (lambda (e2)
                     (list e1 e2))
                   sos2))
            sos1))

(define (flat-map proc lst)
  (if (null? lst)
    '()
    (append (proc (car lst))
            (flat-map proc (cdr lst)))))

(eopl:pretty-print (product '(a b c) '(x y)))
