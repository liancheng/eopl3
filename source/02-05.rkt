#lang eopl

(require racket rackunit)

(define (empty-env) '())

(define (extend-env var val env)
  (cons (cons var val) env))

(define (apply-env env search-var)
  (cond [(null? env)
         (report-no-binding-found search-var)]
        [(eqv? (caar env) search-var)
         (cdar env)]
        [else
          (apply-env env (cdr env))]))

(define (report-no-binding-found search-var)
  (eopl:error 'apply-env "No binding for ~s" search-var))

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
