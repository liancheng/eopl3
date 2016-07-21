#lang eopl

(require rackunit)

;; begin
(define (sort/predicate pred loi)
  (define (merge-sort lst)
    (cond [(null? lst) '()]
          [(null? (cdr lst)) lst]
          [else (merge-sort (cons (merge/predicate pred (car lst) (cadr lst))
                                  (merge-sort (cddr lst))))]))
  (car (merge-sort (map list loi))))

(define (merge/predicate pred loi1 loi2)
  (cond [(null? loi1) loi2]
        [(null? loi2) loi1]
        [(pred (car loi1) (car loi2)) (cons (car loi1)
                                            (merge/predicate pred (cdr loi1) loi2))]
        [else (cons (car loi2)
                    (merge/predicate pred loi1 (cdr loi2)))]))
;; end

(check-equal? (sort/predicate < '(8 2 5 2 3))
              '(2 2 3 5 8))

(check-equal? (sort/predicate > '(8 2 5 2 3))
              '(8 5 3 2 2))
