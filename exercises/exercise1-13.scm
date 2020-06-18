#lang sicp
;; Exercise 1.16 -- SICP
;;
;; Design a procedure that evolves an iterative exponentiation
;; process that uses successive squaring and uses a logarithmic
;; number of steps, as does fast-expt.
;;
;; Iterative Solution, grows at R(n)
(define (fast-iter-expt b n)
  (define (iter b n a)
    (if (eq? n 0)
        a
        (iter b (dec n) (* b a))))
  (iter b n 1))
;; Iterative Solution, grows at R(log n)
(define (faster-iter-expt b n)
  (define (iter b n a)
    (cond ((eq? n 0) a)
          ((even? n) (iter (fast-iter-expt b 2) (/ n 2) a))
          ((iter b (dec n) (* b a)))))
  (iter b n 1))