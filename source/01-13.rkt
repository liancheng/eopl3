#lang eopl

(require rackunit)

;; begin
(define (subst new old slist)
  (map (lambda (sexp)
         (subst-in-s-exp new old sexp))
       slist))

(define (subst-in-s-exp new old sexp)
  (if (symbol? sexp)
    (if (eqv? sexp old) new sexp)
    (subst new old sexp)))
;; end

(check-equal? (subst 'b 'a '(a (b (c a (d) e))))
              '(b (b (c b (d) e))))
