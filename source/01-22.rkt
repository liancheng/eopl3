#lang eopl

(require rackunit)

;; begin
(define (filter-in pred lst)
  (if (null? lst)
    '()
    (let ([head (car lst)]
          [filtered-tail (filter-in pred (cdr lst))])
      (if (pred head)
        (cons head filtered-tail)
        filtered-tail))))

(check-equal? (filter-in number? '(a 2 (1 3) b 7)) '(2 7))
;; end
