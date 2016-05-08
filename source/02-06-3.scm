#lang eopl

(require racket
         rackunit)

(define (empty-env) (cons '() '()))

(define (extend-env var val env)
  (let [(vars (car env))
        (vals (cdr env))]
    (cons (cons var vars)
          (cons val vals))))

(define (apply-env env search-var)
  (let* [(vars (car env))
         (vals (cdr env))]
    (cond [(null? vars)
           (report-no-binding-found search-var)]
          [(eqv? search-var (car vars))
           (car vals)]
          [else
            (apply-env (cons (cdr vars)
                             (cdr vals)))])))

(define (report-no-binding-found search-var)
  (eopl:error 'apply-env "No binding for ~s" search-var))

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
