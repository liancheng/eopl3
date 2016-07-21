#lang eopl

(require rackunit)

;; begin
(define (down lst)
  (map list lst))
;; end

(check-equal? (down '(1 2 3))
              '((1) (2) (3)))

(check-equal? (down '(a (more (compliated)) object))
              '((a) ((more (compliated))) (object)))
