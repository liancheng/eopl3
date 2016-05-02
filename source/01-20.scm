#lang eopl

(define (count-occurrences s slist)
  (if (null? slist)
    0
    (+ (count-occurrences-in-s-sexp s (car slist))
       (count-occurrences s (cdr slist)))))

(define (count-occurrences-in-s-sexp s sexp)
  (if (symbol? sexp)
    (if (eqv? sexp s) 1 0)
    (count-occurrences s sexp)))

(eopl:pretty-print (count-occurrences 'x '((f x) y (((x z) x)))))
(eopl:pretty-print (count-occurrences 'x '((f x) y (((x z) () x)))))
(eopl:pretty-print (count-occurrences 'w '((f x) y (((x z) x)))))
