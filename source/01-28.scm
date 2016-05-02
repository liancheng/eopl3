#lang eopl

(provide merge)

(define (merge loi1 loi2)
  (cond [(null? loi1) loi2]
        [(null? loi2) loi1]
        [(< (car loi1) (car loi2)) (cons (car loi1)
                                         (merge (cdr loi1) loi2))]
        [else (cons (car loi2)
                    (merge loi1 (cdr loi2)))]))

(eopl:pretty-print (merge '(1 4) '(1 2 8)))
(eopl:pretty-print (merge '(35 62 81 90 91) '(3 83 85 90)))
