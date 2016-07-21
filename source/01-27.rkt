#lang eopl

(require rackunit)

;; begin
(define (flatten slist)
  (cond [(null? slist) '()]
        [(list? (car slist)) (append (flatten (car slist))
                                     (flatten (cdr slist)))]
        [else (cons (car slist)
                    (flatten (cdr slist)))]))
;; end

(check-equal? (flatten '(a b c)) '(a b c))
(check-equal? (flatten '((a) () (b ()) () (c))) '(a b c))
(check-equal? (flatten '((a b) c (((d)) e))) '(a b c d e))
(check-equal? (flatten '(a b (() (c)))) '(a b c))
