#lang eopl

(require rackunit)

(provide every?)

;; begin
(define (every? pred lst)
  (cond [(null? lst) #t]
        [(pred (car lst)) (every? pred (cdr lst))]
        [else #f]))
;; end

(check-equal? (every? number? '(a b c 3 e)) #f)
(check-equal? (every? number? '(1 2 3 5 4)) #t)
