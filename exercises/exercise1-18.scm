#lang sicp
;; Exercise 1.18 -- SICP
;;
;; Using the results of exercise 1.16 and 1.17, define
;; a procedure that generates an iterative process for
;; multiplying two integers in terms of adding, doubling,
;; and halving that uses a logarithmic number of steps.

(define (iterative-logarithmic-* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (define (iter a b n)
    (cond ((eq? b 0) n)
          ((even? b) (iter (double a) (halve b) n))
          ((iter a (dec b) (+ a n)))))
  (iter a b 0))
