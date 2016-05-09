#lang eopl

(require "02-05.rkt"
         "02-08.rkt"
         "02-09.rkt"
         rackunit)

(provide extend-env*)

(define (extend-env* vars vals env)
  (if (null? vars)
    env
    (extend-env* (cdr vars)
                 (cdr vals)
                 (extend-env (car vars)
                             (car vals)
                             env))))

(check-equal? (extend-env* '(a b c) '(1 2 3) (empty-env))
              (extend-env 'c 3
                          (extend-env 'b 2
                                      (extend-env 'a 1
                                                  (empty-env)))))
