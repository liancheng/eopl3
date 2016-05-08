#lang eopl

(require racket
         rackunit)

(define (empty-env) '())

(define (extend-env var val env)
  (cond [(null? env)
         (list (cons var val))]
        [(eqv? var (caar env))
         (cons (cons var val)
               (cdr env))]
        [else
          (cons (car env)
                (extend-env var val (cdr env)))]))

(define (apply-env env search-var)
  (cond [(null? env)
         (report-no-binding-found search-var)]
        [(eqv? search-var (caar env))
         (cdar env)]
        [else
          (apply-env (cdr env) search-var)]))

(define (report-no-binding-found search-var)
  (eopl:error 'apply-env "No binding for ~s" search-var))

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
