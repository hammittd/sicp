#lang sicp
;; Exercise 1.11 -- SICP
;;
;; A function f is defined by the rule that f(n) = n if n < 3 and
;; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3.
;; Write a procedure that computes f by means of a recursive process.
;; Write a procedure that computes f by means of an iterative process.
;;
;; Code:
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))))

(define (f n)
  (define (iter a b c count)
    (if (< count 3)
        a
        (iter (+ a (* 2 b) (* 3 c)) a b (dec count))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))
;; When defining the iterator, we use three variables to store the state of process.
;; a: the new value
;; b: the last value
;; c: the next-to-last value
;; count: the step of the iteration
;; The new value, when n > 3, is n-1 + 2n-2 + 3n-3
;; When calculating a new-value,
;; new-value - 1 will be equal to a in the last iteration
;; new-value - 2 will be equal to b in the last iteration (so this becomes (* 2 b))
;; and new-value - 3 will be equal to c (so this becomes (* 3 c))