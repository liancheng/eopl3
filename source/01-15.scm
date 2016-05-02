#lang eopl

(define (duple n sexp)
  (if (zero? n)
    '()
    (cons sexp (duple (- n 1) sexp))))

(eopl:pretty-print (duple 4 '(foo bar)))
