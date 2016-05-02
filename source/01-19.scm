#lang eopl

(define (list-set lst n x)
  (if (zero? n)
    (cons x (cdr lst))
    (cons
      (car lst)
      (list-set (cdr lst) (- n 1) x))))

(eopl:pretty-print (list-set '(a b c d) 2 '(1 2)))
