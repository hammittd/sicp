#lang sicp
;; Exercise 1.5
;; Ben Bitdiddle has invented a test to determine whether
;; the interpreter he is faced with is using applicative-
;; order or normal-order evaluation. He defines the following
;; two procedures:
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y) )

;; Then he evaluates the expression:
(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses
;; applicative-order evaluation? What behavior will he observe with
;; an interpreter that uses normal-order evaluation? Explain your answer.

;; Normal-order evaluation:
;; This procedure would return 0. An interpreter that uses applicative-order
;; evaluation substitutes operand expressions for parameters until it encounters
;; a value expression of only primitive operators (in this case, a numeral 0)
;; and the performs the evaluation. Because the test (= x 0) is true, and 0 is a
;; primitive operator, the procedure returns 0.

;; Applicative-order evaluation:
;; This procedure would never return. An interpreter that uses
;; applicative-order evaluate evaluates all the arguments passed
;; to the procedure as operands and then applies the given
;; operator to the resulting values. In this case, that means that
;; the second argument passed to (test), (p), invokes p, which simply
;; returns another call to itself instead of a legitimate value.
;; This procedure wouldn't terminate. 