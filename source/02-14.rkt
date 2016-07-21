#lang eopl

(require racket
         rackunit)

;; begin
(define (empty-env)
  (list (lambda (search-var)
          (report-no-binding-found search-var))
        (lambda () #t)
        (lambda (search-var) #f)))

(define (extend-env saved-var saved-val saved-env)
  (list (lambda (search-var)
          (if (eqv? search-var saved-var)
            saved-val
            (apply-env saved-env search-var)))
        (lambda () #f)
        (lambda (search-var)
          (if (eqv? search-var saved-var)
            #t
            ((list-ref saved-env 2) search-var)))))

(define (apply-env env search-var)
  ((list-ref env 0) search-var))

(define (empty-env? env)
  ((list-ref env 1)))

(define (has-binding? env search-var)
  ((list-ref env 2) search-var))

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
