#lang eopl

(require racket/match
         rackunit)

;; begin
(define (var-exp var) var)

(define (lambda-exp bound-var body)
  `(,bound-var ,body))

(define (app-exp rator rand)
  `(,rator ,rand))

(define (var-exp? exp) (symbol? exp))

(define (lambda-exp? exp)
  (match exp
         [(list (? var-exp?) (? lc-exp?)) #t]
         [_ #f]))

(define (app-exp? exp)
  (match exp
         [(list (? lc-exp?) (? lc-exp?)) #t]
         [_ #f]))

(define (lc-exp? exp)
  (or (var-exp? exp)
      (lambda-exp? exp)
      (app-exp? exp)))

(define (var-exp->var exp) exp)

(define (lambda-exp->bound-var exp)
  (match exp
         [(list bound-var _) bound-var]))

(define (lambda-exp->body exp)
  (match exp
         [(list _ body) body]))

(define (app-exp->rator exp)
  (match exp
         [(list rator _) rator]))

(define (app-exp->rand exp)
  (match exp
         [(list _ rand) rand]))
;; end

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
