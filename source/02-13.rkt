#lang eopl

(require racket
         rackunit)

;; begin
(define (empty-env)
  (cons (lambda (search-var)
          (report-no-binding-found search-var))
        (lambda () #t)))

(define (extend-env saved-var saved-val saved-env)
  (cons (lambda (search-var)
          (if (eqv? search-var saved-var)
            saved-val
            (apply-env saved-env search-var)))
        (lambda () #f)))

(define (apply-env env search-var)
  ((car env) search-var))

(define (empty-env? env)
  ((cdr env)))

(define (report-no-binding-found search-var)
  (eopl:error 'apply-env "No binding for ~s" search-var))
;; end

(check-true (empty-env? (empty-env)))

(check-false (empty-env? (extend-env 'a 1 (empty-env))))

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
