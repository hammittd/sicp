#lang sicp
;; Exercise 1.10 -- SICP
;; The following procedure computes a mathematical function called Ackerman's function:
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10)
;; 1024
(A 2 4)
;; 65536
(A 3 3)
;; 65536

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
;; f(n) = 2n
;; g(n) = 2^n
;; h(n) = 2^2 ... (n-1) for N > 1