#lang eopl

(require rackunit)

(define (empty-stack)
  (list #t
        (lambda ()
          (eopl:error 'top "Stack is empty"))
        (lambda ()
          (eopl:error 'pop "Stack is empty"))))

(define (push e stk)
  (list #f
        (lambda () e)
        (lambda () stk)))

(define (empty-stack? stk)
  (list-ref stk 0))

(define (top stk)
  ((list-ref stk 1)))

(define (pop stk)
  ((list-ref stk 2)))

(define (stack=? s1 s2)
  (cond [(empty-stack? s1)
         (empty-stack? s2)]
        [(empty-stack? s2)
         (empty-stack? s1)]
        [else
          (and (eqv? (top s1) (top s2))
               (stack=? (pop s1) (pop s2)))]))

(define-binary-check
  (check-stack=? stack=? actual expected))

(check-true (empty-stack? (empty-stack)))

(check-false (empty-stack? (push 1 (empty-stack))))

(check-eqv? (top (push 1 (empty-stack))) 1)

(check-stack=? (pop (push 1 (empty-stack)))
               (empty-stack))

(check-stack=? (pop (push 2 (push 1 (empty-stack))))
               (push 1 (empty-stack)))
