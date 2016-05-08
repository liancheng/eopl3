#lang eopl

(require rackunit
         rackunit/text-ui)

(provide diff zero one
         zero is-zero?
         integer->diff-tree diff-tree->integer
         diff-tree=?
         successor predecessor
         check-diff-tree=?)

(define-datatype diff-tree diff-tree?
                 (one)
                 (diff
                   (lhs diff-tree?)
                   (rhs diff-tree?)))

(define (zero) (diff (one) (one)))

(define (integer->diff-tree n)
  (cond [(= 1 n) (one)]
        [(> n 0) (successor (integer->diff-tree (- n 1)))]
        [else (predecessor (integer->diff-tree (+ n 1)))]))

(define (diff-tree->integer n)
  (cases diff-tree n
         [one () 1]
         [diff (lhs rhs) (- (diff-tree->integer lhs)
                            (diff-tree->integer rhs))]))

(define (diff-tree=? n m)
  (= (diff-tree->integer n) (diff-tree->integer m)))

(define (is-zero? n)
  (cases diff-tree n
         (one () #f)
         (diff (lhs rhs) (diff-tree=? lhs rhs))))

(define (successor n)
  (diff n (diff (zero) (one))))

(define (predecessor n)
  (diff n (one)))

(define-binary-check
  (check-diff-tree=? diff-tree=? actual expected))

(check-true (is-zero? (zero)))

(check-diff-tree=? (predecessor (zero))
                   (integer->diff-tree -1))

(check-diff-tree=? (successor (zero))
                   (one))

(check-true (diff-tree=? (diff (one) (zero))
                         (one)))

(check-diff-tree=? (successor (diff (one) (zero)))
                   (integer->diff-tree 2))

(check-diff-tree=? (predecessor (diff (one) (zero)))
                   (zero))
