#lang eopl

(require racket
         rackunit)

(define (empty-env)
  (list 'empty-env))

(define (extend-env var val env)
  (list 'extend-env var val env))

;; begin
(define (apply-env env search-var)
  (let apply-env-impl [(env* env)
                       (search-var* search-var)]
    (cond [(eqv? (car env*) 'empty-env)
           (report-no-binding-found search-var* env)]
          [(eqv? (car env*) 'extend-env)
           (let [(saved-var (cadr env*))
                 (saved-val (caddr env*))
                 (saved-env (cadddr env*))]
             (if (eqv? search-var* saved-var)
               saved-val
               (apply-env saved-env search-var*)))]
          [else
            (report-invalid-env env*)])))

(define (report-no-binding-found search-var env)
  (eopl:error 'apply-env "No binding for ~s in environment ~s" search-var env))
;; end

(define (report-invalid-env env)
  (eopl:error 'apply-env "Bad environment: ~s" env))

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a in environment .*")
           (lambda ()
             (apply-env (empty-env) 'a)))
