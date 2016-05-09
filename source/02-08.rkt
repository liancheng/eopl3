#lang eopl

(require "02-05.rkt"
         rackunit)

(provide empty-env?)

(define empty-env? null?)

(check-true (empty-env? (empty-env)))
