#lang sicp
;; Exercise 1.8
;; Newton's method for finding cube roots is based on the fact
;; that if y is an approximation of the cube root of x, then a better
;; approximation is given by the value:
;; (x/y^2 + 2y) / 3
;; Use this formula to implement a cube-root procedure analogous to the
;; square root procedure.
;;
;; Code:

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (square x)
  (* x x))