#lang eopl

(require rackunit)

;; begin
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
;; end

(check-equal? (swapper 'a 'd '(a b c d))
              '(d b c a))

(check-equal? (swapper 'a 'd '(a d () c d))
              '(d a () c a))

(check-equal? (swapper 'x 'y '((x) y (z (x))))
              '((y) x (z (y))))
