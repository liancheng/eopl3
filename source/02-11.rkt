#lang eopl

(require racket
         rackunit)

;; begin
(define (empty-env) '())

(define (extend-env* vars vals env)
  (cons (cons vars vals) env))

(define (extend-env var val env)
  (extend-env* (list var) (list val) env))

(define (apply-env env search-var)
  (cond [(null? env)
         (report-no-binding-found search-var)]
        [else
          (let apply-ribs [(ribs (car env))]
            (let [(vars (car ribs))
                  (vals (cdr ribs))]
              (cond [(null? vars)
                     (apply-env (cdr env) search-var)]
                    [(eqv? (car vars) search-var)
                     (car vals)]
                    [else
                      (apply-ribs (cons (cdr vars) (cdr vals)))])))]))

(define (report-no-binding-found search-var)
  (eopl:error 'apply-env "No binding for ~s" search-var))
;; end

(check-eqv? (apply-env
              (extend-env 'a 1 (empty-env))
              'a)
            1)

(let [(env (extend-env 'c 3
                       (extend-env 'b 2
                                   (extend-env 'a 1
                                               (empty-env)))))]
  (check-equal? (apply-env env 'a) 1))

(check-exn (regexp "No binding for a")
           (lambda ()
             (apply-env (empty-env) 'a)))
