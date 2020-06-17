#lang sicp
;; Exercise 1.12 -- SICP
;;
;; The following pattern of numbers is called Pascal's triangle.
;; 1
;; 1 1
;; 1 2 1
;; 1 3 3 1
;; 1 4 6 4 1
;;    ...
;;
;; The numbers at the edge of the triangle are all 1,
;; and each number inside the angle is the sum of
;; the two numbers aobve it.
;;
;; Write a procedure that computes the elements of
;; Pascal's triangle by means of a recursive process.

(define (pascal-compute row col)
  (cond ((or (eq? col 1) (eq? row 1)) 1)
        ((eq? col row) 1)
        ((+ (pascal-compute (dec row) col) (pascal-compute (dec row) (dec col)))) ))