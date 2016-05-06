#lang eopl

(require "01-24.scm"
         rackunit
         rackunit/text-ui)

(define base 10)

(define (zero) '())

(define (is-zero? n)
  (every? zero? n))

(define (successor n)
  (cond [(is-zero? n)
         '(1)]
        [(< (car n) (- base 1))
         (cons (+ 1 (car n)) (cdr n))]
        [else
          (cons 0 (successor (cdr n)))]))

(define (predecessor n)
  (cond [(= 1 (car n))
         (if (null? (cdr n)) '() (cons 0 (cdr n)))]
        [(> (car n) 0)
         (cons (- (car n) 1) (cdr n))]
        [else
          (cons (- base 1) (predecessor (cdr n)))]))

(define (int->nat n)
  (if (zero? n)
    (zero)
    (successor (int->nat (- n 1)))))

(define (nat->int n)
  (if (is-zero? n)
    0
    (+ 1 (nat->int (predecessor n)))))

(define (plus x y)
  (if (is-zero? x)
    y
    (successor (plus (predecessor x) y))))

(define (multiply x y)
  (cond [(is-zero? x) (zero)]
        [(is-zero? (predecessor x)) y]
        [else
          (plus y (multiply (predecessor x) y))]))

(define (factorial n)
  (if (is-zero? n)
    (successor (zero))
    (multiply n (factorial (predecessor n)))))

(define (with-base n thunk)
  (let [(orig-base base)]
    (begin
      (set! base n)
      (thunk)
      (set! base orig-base))))

(with-base 2 (lambda ()
               (eopl:printf "Base ~s: 10! = ~s~%"
                            base
                            (nat->int (factorial (int->nat 10))))))

(with-base 32 (lambda ()
                (eopl:printf "Base ~s: 10! = ~s~%"
                             base
                             (nat->int (factorial (int->nat 10))))))

(with-base 1024 (lambda ()
                (eopl:printf "Base ~s: 10! = ~s~%"
                             base
                             (nat->int (factorial (int->nat 10))))))

(with-base 16 (lambda ()
                (eopl:printf "Base ~s: 9! = ~s~%"
                             base
                             (nat->int (factorial (int->nat 9))))
                (eopl:printf "Base ~s: 10! = ~s~%"
                             base
                             (nat->int (factorial (int->nat 10))))
                (eopl:printf "Base ~s: 11! = ~s~%"
                             base
                             (nat->int (factorial (int->nat 11))))))

(run-tests
  (test-suite
    "Tests for nat"

    (test-case
      "basic operations"
      (check-equal? (zero) '())

      (check-equal? (is-zero? (zero)) #t)
      (check-equal? (is-zero? '(0 0 0)) #t)
      (check-equal? (is-zero? '()) #t)

      (check-equal? (is-zero? '(0 1)) #f)

      (check-equal? (successor (zero)) '(1))
      (check-equal? (successor (list (- base 1))) '(0 1))
      (check-equal? (successor (successor (zero))) '(2))

      (check-equal? (predecessor (successor (zero))) (zero))
      (check-equal? (predecessor (predecessor '(3))) '(1))
      (check-equal? (predecessor '(0 1)) '(9)))

    (test-case
      "converters"
      (check-equal? (int->nat 1024) '(4 2 0 1))
      (check-equal? (nat->int '(4 2 0 1)) 1024))

    (test-case
      "arithmetic operations"
      (check-equal? (plus (int->nat 2)
                          (int->nat 9))
                    (int->nat 11))

      (check-equal? (plus (int->nat 0)
                          (int->nat 2))
                    (int->nat 2))

      (check-equal? (multiply (int->nat 0)
                              (int->nat 2))
                    (int->nat 0))

      (check-equal? (multiply (int->nat 1)
                              (int->nat 2))
                    (int->nat 2))

      (check-equal? (multiply (int->nat 6)
                              (int->nat 7))
                    (int->nat 42))

      (check-equal? (nat->int (factorial (int->nat 10)))
                    (* 10 9 8 7 6 5 4 3 2 1)))))
