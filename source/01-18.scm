#lang eopl

(define (swapper s1 s2 slist)
  (map (lambda (sexp)
         (swapper-in-s-sexp s1 s2 sexp))
       slist))

(define (swapper-in-s-sexp s1 s2 sexp)
  (cond
    [(symbol? sexp) (cond
                      [(eqv? s1 sexp) s2]
                      [(eqv? s2 sexp) s1]
                      [else sexp])]
    [else (swapper s1 s2 sexp)]))

(eopl:pretty-print (swapper 'a 'd '(a b c d)))
(eopl:pretty-print (swapper 'a 'd '(a d () c d)))
(eopl:pretty-print (swapper 'x 'y '((x) y (z (x)))))
