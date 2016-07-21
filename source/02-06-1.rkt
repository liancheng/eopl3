#lang eopl

(require racket
         rackunit)

;; begin
(define (empty-env)
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))

(define (extend-env var val env)
  (lambda (search-var)
    (if (eqv? var search-var) val (apply-env env search-var))))

(define (apply-env env search-var)
  (env search-var))
;; end

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
