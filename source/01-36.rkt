#lang eopl

(require rackunit)

;; begin
(define (number-elements lst)
  (if (null? lst) '()
    (g (list 0 (car lst)) (number-elements (cdr lst)))))

(define (g head tail)
  (if (null? tail)
    (list head)
    (let* [(n (car head))
           (next (car tail))
           (new-next (cons (+ n 1) (cdr next)))]
      (cons head (g new-next (cdr tail))))))
;; end

(check-equal? (number-elements '())
              '())

(check-equal? (number-elements '(a))
              '((0 a)))

(check-equal? (number-elements '(a b c d))
              '((0 a) (1 b) (2 c) (3 d)))
