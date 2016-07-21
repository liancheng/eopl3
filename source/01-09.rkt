#lang eopl

(require rackunit)

;; begin
(define (remove s los)
  (if (null? los)
    '()
    (if (eqv? (car los) s)
      (remove s (cdr los))
      (cons (car los) (remove s (cdr los))))))
;; end

(check-equal? (remove 'a '(a b a c a d))
              '(b c d))
