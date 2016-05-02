#lang eopl

(require rackunit)

(define (flatten slist)
  (cond [(null? slist) '()]
        [(list? (car slist)) (append (flatten (car slist))
                                     (flatten (cdr slist)))]
        [else (cons (car slist)
                    (flatten (cdr slist)))]))

(check-equal? (flatten '(a b c)) '(a b c))
(check-equal? (flatten '((a) () (b ()) () (c))) '(a b c))
(check-equal? (flatten '((a b) c (((d)) e))) '(a b c d e))
(check-equal? (flatten '(a b (() (c)))) '(a b c))
