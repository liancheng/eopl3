#lang eopl

(define (subst new old slist)
  (map (lambda (sexp)
         (subst-in-s-exp new old sexp))
       slist))

(define (subst-in-s-exp new old sexp)
  (if (symbol? sexp)
    (if (eqv? sexp old) new sexp)
    (subst new old sexp)))

(eopl:pretty-print (subst 'b 'a '(a (b (c a (d) e)))))
