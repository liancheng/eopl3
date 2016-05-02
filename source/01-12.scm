#lang eopl

(define (subst new old slist)
  (if (null? slist)
    '()
    (let ([head (car slist)] [tail (cdr slist)])
      (cons
        (if (symbol? head)
          (if (eqv? head old) new head)
          (subst new old head))
        (subst new old tail)))))

(eopl:pretty-print (subst 'b 'a '(a (b (c a (d) e)))))
