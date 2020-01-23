#lang sicp
;; Exercise 1.3
;; Define a procedure that takes three numbers
;; as arguments and returns the sum of the squares
;; of the two larger arguments

(define (square x)
  (* x x) )

(define (sum-sq x y)
  (+ (square x) (square y) ))

(define (sum-sq-largest x y z)
  (cond ((or (and (> y x) (equal? y z)) 
            (and (< x y) (< x z)) ) (sum-sq y z) )
        ((or (and (> x y) (equal? x z))
            (and (< y x) (< y z)) ) (sum-sq x z) )
        ((or (and (> x z) (equal? x y))
            (and (< z x) (< z y)) )  (sum-sq x y) )))