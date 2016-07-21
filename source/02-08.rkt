#lang eopl

(require "02-05.rkt"
         rackunit)

(provide empty-env?)

;; begin
(define empty-env? null?)
;; end

(check-true (empty-env? (empty-env)))
