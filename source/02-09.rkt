#lang eopl

(require "02-05.rkt"
         "02-08.rkt"
         rackunit)

(provide has-binding?)

;; begin
(define (has-binding? env s)
  (cond [(empty-env? env) #f]
        [(eqv? s (caar env)) #t]
        [else (has-binding? (cdr env) s)]))
;; end

(check-true (has-binding?
              (extend-env 'a 1
                          (extend-env 'b 2
                                      (extend-env 'c 3
                                                  (empty-env))))
              'c))

(let [(env (extend-env 'a 1
                       (extend-env 'b 2
                                   (extend-env 'c 3
                                               (empty-env)))))]
  (check-true (has-binding? env 'c))
  (check-false (has-binding? env 'd)))
