#lang eopl

(require "02-01.scm")

;; begin
(define (with-base n thunk)
  (let [(orig-base base)]
    (begin
      (set-base! n)
      (thunk)
      (set-base! orig-base))))

(define (print-factorial base n)
  (with-base
    base
    (lambda ()
      (collect-garbage)
      (eopl:printf
        "Base ~s: ~s! = ~s~%"
        base
        n
        (bigits->integer (factorial (integer->bigits n)))))))
;; end

(for-each (lambda (n)
            (time (print-factorial n 10)))
          '(2 4 8 16 32 64))

(for-each (lambda (n)
            (time (print-factorial 16 n)))
          '(9 10 11))
