#lang sicp
;; Exercise 1.7
;; The good enough test used in computing square roots will not be very effective
;; for finding the square roots
;;
;; Also, in real computers, arithmetic operations are almost always performed with
;; limited precision.
;;
;; This makes our test inadequate for very large numbers. Explain these statements,
;; with examples showing how the test fails for small and large numbers.
;;
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; initial definition of good-enough?
;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

;; test:
;; (sqrt .000000009)
;; > 0.03125009590619131

;; new definition of good-enough?
;; Measuring whether there is a perceptible difference between an
;; initial guess and the improved value
(define (good-enough? guess x)
  (= (improve guess x) guess))