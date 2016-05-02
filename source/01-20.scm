#lang eopl

(require rackunit)

(define (count-occurrences s slist)
  (if (null? slist)
    0
    (+ (count-occurrences-in-s-sexp s (car slist))
       (count-occurrences s (cdr slist)))))

(define (count-occurrences-in-s-sexp s sexp)
  (if (symbol? sexp)
    (if (eqv? sexp s) 1 0)
    (count-occurrences s sexp)))

(check-equal? (count-occurrences 'x '((f x) y (((x z) x)))) 3)
(check-equal? (count-occurrences 'x '((f x) y (((x z) () x)))) 3)
(check-equal? (count-occurrences 'w '((f x) y (((x z) x)))) 0)
