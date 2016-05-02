#lang eopl

(require rackunit)

(define (invert lst)
  (map (lambda (pair)
         (list (cadr pair) (car pair)))
       lst))

(check-equal? (invert '((a 1) (a 2) (a 3)))
              '((1 a) (2 a) (3 a)))
