#lang eopl

(require rackunit)

;; begin
(define (number->sequence n)
  (list n '() '()))

(define (current-element seq)
  (car seq))

(define (move-to-left seq)
  (if (at-left-end? seq)
    (eopl:error 'move-to-left
                "Sequence ~s is already at its left end" seq)
    (let* [(n (car seq))
           (left (cadr seq))
           (right (caddr seq))
           (new-n (car left))
           (new-left (cdr left))
           (new-right (cons n right))]
      (list new-n new-left new-right))))

(define (move-to-right seq)
  (if (at-right-end? seq)
    (eopl:error 'move-to-right
                "Sequence ~s is already at its right end" seq)
    (let* [(n (car seq))
           (left (cadr seq))
           (right (caddr seq))
           (new-n (car right))
           (new-left (cons n left))
           (new-right (cdr right))]
      (list new-n new-left new-right))))

(define (insert-to-left n seq)
  (let* [(current (car seq))
         (left (cadr seq))
         (right (caddr seq))
         (new-left (cons n left))]
    (list current new-left right)))

(define (insert-to-right n seq)
  (let* [(current (car seq))
         (left (cadr seq))
         (right (caddr seq))
         (new-right (cons n right))]
    (list current left new-right)))

(define (at-left-end? seq)
  (null? (cadr seq)))

(define (at-right-end? seq)
  (null? (caddr seq)))
;; end

(let [(seq (number->sequence 1))]
  (check-equal? seq '(1 () ()))
  (check-equal? (insert-to-left 2 seq)
                '(1 (2) ()))
  (check-equal? (insert-to-right 2 seq)
                '(1 () (2))))
