#lang eopl

(require racket
         rackunit)

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

(let* [(seq0 (number->sequence 1))
       (seq1 (insert-to-left 2 seq0))
       (seq2 (insert-to-right 3 seq1))]
  (check-equal? seq0 '(1 () ()))
  (check-equal? seq1 '(1 (2) ()))
  (check-equal? seq2 '(1 (2) (3)))

  (check-equal? (move-to-left seq2)
                '(2 () (1 3)))

  (check-equal? (move-to-right seq2)
                '(3 (1 2) ()))

  (check-equal? (current-element seq2) 1)
  (check-equal? (current-element (move-to-left seq2)) 2)
  (check-equal? (current-element (move-to-right seq2)) 3)

  (check-exn #rx"move-to-left:.*"
             (lambda () (move-to-left seq0)))

  (check-exn #rx"move-to-right:.*"
             (lambda () (move-to-right seq0)))

  (check-true (at-left-end? seq0))
  (check-true (at-right-end? seq0)))
