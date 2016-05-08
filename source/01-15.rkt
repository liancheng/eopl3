#lang eopl

(require rackunit)

(define (duple n sexp)
  (if (zero? n)
    '()
    (cons sexp (duple (- n 1) sexp))))

(check-equal? (duple 2 'a)
              '(a a))

(check-equal? (duple 3 '(foo bar))
              '((foo bar) (foo bar) (foo bar)))
