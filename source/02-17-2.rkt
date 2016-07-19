#lang eopl

(require racket/match
         rackunit)

(define (var-exp var)
  (cons 'var-exp
        (lambda () var)))

(define (lambda-exp bound-var body)
  (cons 'lambda-exp
        (lambda (field)
          (match field
                 ['bound-var bound-var]
                 ['body body]))))

(define (app-exp rator rand)
  (cons 'app-exp
        (lambda (field)
          (match field
                 ['rator rator]
                 ['rand rand]))))

(define (var-exp? exp)
  (match exp
         [(cons 'var-exp _) #t]
         [_ #f]))

(define (lambda-exp? exp)
  (match exp
         [(cons 'lambda-exp _) #t]
         [_ #f]))

(define (app-exp? exp)
  (match exp
         [(cons 'app-exp _) #t]
         [_ #f]))

(define (lc-exp? exp)
  (or (var-exp? exp)
      (lambda-exp? exp)
      (app-exp? exp)))

(define (var-exp->var exp)
  ((cdr exp)))

(define (lambda-exp->bound-var exp)
  ((cdr exp) 'bound-var))

(define (lambda-exp->body exp)
  ((cdr exp) 'body))

(define (app-exp->rator exp)
  ((cdr exp) 'rator))

(define (app-exp->rand exp)
  ((cdr exp) 'rand))

(let ([a (var-exp 'a)])
  (check-true (var-exp? a))
  (check-eqv? (var-exp->var a) 'a))

(let* ([a (var-exp 'a)]
       [b (var-exp 'b)]
       [lc (lambda-exp a b)])
  (check-true (lambda-exp? lc))
  (check-eqv? (lambda-exp->bound-var lc) a)
  (check-eqv? (lambda-exp->body lc) b))

(let* ([a (var-exp 'a)]
       [b (var-exp 'b)]
       [lc (lambda-exp a b)]
       [app (app-exp lc b)])
  (check-true (app-exp? app))
  (check-eqv? (app-exp->rator app) lc)
  (check-eqv? (app-exp->rand app) b))
