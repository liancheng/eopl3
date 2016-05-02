#lang eopl

(require "01-28.scm")

(define (sort loi)
  (define (merge-sort lst)
    (cond [(null? lst) '()]
          [(null? (cdr lst)) lst]
          [else (merge-sort (cons (merge (car lst) (cadr lst))
                                  (merge-sort (cddr lst))))]))
  (car (merge-sort (map list loi))))

(eopl:pretty-print (sort '(8 2 5 2 3)))
