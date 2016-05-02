#lang eopl

(define base 10)

(define (zero) '(0))

(define (is-zero? n)
  (and (null? (cdr n))
       (zero? (car n))))

(define (successor n)
  (cond [(null? n)
         '(1)]
        [(< (car n) (- n 1))
         (cons (+ 1 (car n)) (cdr n))]
        [else
          (cons 0 (successor (cdr n)))]))
