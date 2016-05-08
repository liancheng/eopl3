#lang eopl

(require "01-24.scm"
         rackunit
         rackunit/text-ui)

(provide base set-base!
         zero is-zero?
         successor predecessor
         integer->bigits bigits->integer
         plus multiply factorial)

(define base 10)

(define (set-base! n)
  (set! base n))

(define (zero) '())

(define is-zero? null?)

(define (successor n)
  (cond [(is-zero? n)
         '(1)]
        [(< (car n) (- base 1))
         (cons (+ 1 (car n)) (cdr n))]
        [else
          (cons 0 (successor (cdr n)))]))

(define (predecessor n)
  (cond [(= 1 (car n))
         (if (null? (cdr n)) (zero) (cons 0 (cdr n)))]
        [(> (car n) 0)
         (cons (- (car n) 1) (cdr n))]
        [else
          (cons (- base 1) (predecessor (cdr n)))]))

(define (integer->bigits n)
  (if (zero? n)
    (zero)
    (successor (integer->bigits (- n 1)))))

(define (bigits->integer n)
  (if (is-zero? n)
    0
    (+ 1 (bigits->integer (predecessor n)))))

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

(run-tests
  (test-suite
    "Tests for bigits"

    (test-case
      "converters"
      (check-equal? (integer->bigits 1024) '(4 2 0 1))
      (check-equal? (bigits->integer '(4 2 0 1)) 1024))

    (map (lambda (n)
           (let [(original-base base)]
             (around
               (set! base n)

               (test-case
                 "basic operations"
                 (check-equal? (zero) '())

                 (check-equal? (is-zero? (zero)) #t)
                 (check-equal? (is-zero? '()) #t)

                 (check-equal? (is-zero? '(0 1)) #f)

                 (check-equal? (successor (zero))
                               (integer->bigits 1))

                 (check-equal? (successor (list (- base 1)))
                               (integer->bigits base))

                 (check-equal? (successor (successor (zero)))
                               (integer->bigits 2))

                 (check-equal? (predecessor (successor (zero)))
                               (zero))

                 (check-equal? (predecessor (predecessor (integer->bigits 3)))
                               (integer->bigits 1))

                 (check-equal? (predecessor (integer->bigits 10))
                               (integer->bigits 9)))

               (test-case
                 "arithmetic operations"
                 (check-equal? (plus (integer->bigits 2)
                                     (integer->bigits 9))
                               (integer->bigits 11))

                 (check-equal? (plus (integer->bigits 0)
                                     (integer->bigits 2))
                               (integer->bigits 2))

                 (check-equal? (multiply (integer->bigits 0)
                                         (integer->bigits 2))
                               (integer->bigits 0))

                 (check-equal? (multiply (integer->bigits 1)
                                         (integer->bigits 2))
                               (integer->bigits 2))

                 (check-equal? (multiply (integer->bigits 6)
                                         (integer->bigits 7))
                               (integer->bigits 42))

                 (check-equal? (bigits->integer (factorial
                                                  (integer->bigits 10)))
                               (* 10 9 8 7 6 5 4 3 2 1)))

               (set! base original-base))))
         '(2 3 4 8 16 32 1024))))
