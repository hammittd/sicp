#lang sicp
;; Exercise 1.7
;; The good enough test used in computing square roots will not be very effective
;; for finding the square roots
;;
;;
;;
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause) ))
;; Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;; Delighted, Alyssa uses new-if to rewire the square-root program:

(define (square x)
  (* x x) )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001) )

(define (average x y)
  (/ (+ x y) 2) )

(define (improve guess x)
  (average guess (/ x guess) ))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x )))

(define (sqrt x)
  (sqrt-iter 1.0 x) )

;; The program never terminates.
;; Why? Because our interpreter uses applicative order evaluation.
;; This means that the consequent clause to new-if's else predicate
;; will be evaluated every time it is called. In this case, the else's
;; consequent is another call of sqrt-iter, which includes another call
;; of new-if, and so on until we have a loop that can't stop calling itself.
