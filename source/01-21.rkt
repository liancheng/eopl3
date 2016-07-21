#lang eopl

(require rackunit)

;; begin
(define (product sos1 sos2)
  (flat-map (lambda (e1)
              (map (lambda (e2)
                     (list e1 e2))
                   sos2))
            sos1))

(define (flat-map proc lst)
  (if (null? lst)
    '()
    (append (proc (car lst))
            (flat-map proc (cdr lst)))))

(check-equal? (product '(a b c) '(x y))
              '((a x) (a y) (b x) (b y) (c x) (c y)))
;; end
