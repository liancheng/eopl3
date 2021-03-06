#lang eopl

(require rackunit)

;; begin
(define (number->bintree n)
  `(,n () ()))

(define (current-element bintree)
  (car bintree))

(define (move-to-left-son bintree)
  (cadr bintree))

(define (move-to-right-son bintree)
  (caddr bintree))

(define (at-leaf? bintree)
  (null? bintree))

(define (insert-to-left n bintree)
  (let* [(root (car bintree))
         (lhs (move-to-left-son bintree))
         (rhs (move-to-right-son bintree))
         (lhs* `(,n ,lhs ()))]
    `(,root ,lhs* ,rhs)))

(define (insert-to-right n bintree)
  (let* [(root (car bintree))
         (lhs (move-to-left-son bintree))
         (rhs (move-to-right-son bintree))
         (rhs* `(,n ,rhs ()))]
    `(,root ,lhs ,rhs*)))
;; end

(define (print-bintree t)
  (let recurse ([t t] [depth 0])
    (define (print-current-element)
      (let [(indent (make-string depth #\tab))]
        (eopl:printf "~a~a~n" indent (current-element t))))
    (cond [(null? t) '()]
          [else
            (recurse (move-to-right-son t) (+ depth 1))
            (print-current-element)
            (recurse (move-to-left-son t) (+ depth 1))])))

(let* ([t0 (number->bintree 1)]
       [t1 (insert-to-left 2 t0)]
       [t2 (insert-to-right 3 t1)])
  (print-bintree t0)
  (print-bintree t1)
  (print-bintree t2)

  (check-equal? t0 '(1 () ()))
  (check-eqv? (current-element t0) 1)

  (check-equal? t1 '(1 (2 () ()) ()))
  (check-equal? t2 '(1 (2 () ()) (3 () ())))

  (check-equal? (move-to-left-son t2) '(2 () ()))
  (check-equal? (move-to-right-son t2) '(3 () ())))
