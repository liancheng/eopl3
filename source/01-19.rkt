#lang eopl

(require rackunit)

;; begin
(define (list-set lst n x)
  (if (zero? n)
    (cons x (cdr lst))
    (cons
      (car lst)
      (list-set (cdr lst) (- n 1) x))))
;; end

(check-equal? (list-set '(a b c d) 2 '(1 2))
              '(a b (1 2) d))
