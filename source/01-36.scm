#lang eopl

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

(eopl:pretty-print (number-elements '()))
(eopl:pretty-print (number-elements '(a)))
(eopl:pretty-print (number-elements '(a b c d)))
