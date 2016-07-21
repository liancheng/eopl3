#lang eopl

(require rackunit)

;; begin
(define (subst new old slist)
  (if (null? slist)
    '()
    (let ([head (car slist)] [tail (cdr slist)])
      (cons
        (if (symbol? head)
          (if (eqv? head old) new head)
          (subst new old head))
        (subst new old tail)))))
;; end

(check-equal? (subst 'b 'a '(a (b (c a (d) e))))
              '(b (b (c b (d) e))))
