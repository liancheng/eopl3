#lang eopl

(require rackunit)

;; begin
(define (up lst)
  (cond [(null? lst) '()]
        [(list? (car lst)) (append (car lst)
                                   (up (cdr lst)))]
        [else (cons (car lst)
                    (up (cdr lst)))]))
;; end

(check-equal? (up '((1 2) (3 4)))
              '(1 2 3 4))

(check-equal? (up '((x (y)) z))
              '(x (y) z))
