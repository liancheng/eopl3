#lang eopl

(require racket rackunit)

;; begin
(define (nth-element lst n)
  (let nth-element-impl ([lst0 lst] [n0 n])
    (if (null? lst0)
      (report-list-too-short lst n)
      (if (zero? n0)
        (car lst0)
        (nth-element-impl (cdr lst0) (- n0 1))))))

(define (report-list-too-short lst n)
  (eopl:error 'nth-element
              "List ~s does not have ~s elements" lst n))
;; end

(check-equal? (nth-element '(a b c) 2)
              'c)

(check-exn (regexp "List \\(a b c\\) does not have 4 elements")
           (lambda () (nth-element '(a b c) 4)))
