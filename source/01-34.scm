#lang eopl

(define (path n bst)
  (let [(value-of car)
        (lson cadr)
        (rson caddr)]
    (cond [(null? bst)
           (eopl:error 'path "Element ~s not found" n)]
          [(= (value-of bst) n)
           '()]
          [(< n (value-of bst))
           (cons 'left (path n (lson bst)))]
          [else
            (cons 'right (path n (rson bst)))])))

(eopl:pretty-print (path 17 '(14
                              (7 () (12 () ()))
                              (26 (20
                                   (17 () ())
                                   ())
                               (31 () ())))))
