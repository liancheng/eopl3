#lang eopl

(define (remove s los)
  (if (null? los)
    '()
    (if (eqv? (car los) s)
      (remove s (cdr los))
      (cons (car los) (remove s (cdr los))))))

(eopl:pretty-print (remove 'a '(a b a c a d)))
