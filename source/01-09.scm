#lang eopl

(require rackunit)

(define (remove s los)
  (if (null? los)
    '()
    (if (eqv? (car los) s)
      (remove s (cdr los))
      (cons (car los) (remove s (cdr los))))))

(check-equal? (remove 'a '(a b a c a d))
              '(b c d))
