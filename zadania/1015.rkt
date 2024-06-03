#lang racket

;10

(define (sum term next a b)
  ( if(> a b) 0
      (+ (term a) (sum term next (next a) b))))

(define (sum-integers a b)(sum identity add1 a b))
(sum-integers 1 4)

(define (product term next a b)
  (if(> a b) 1
     (* (term a) (product term next (next a) b))))

(define (silnia n) (product identity add1 1 n))

; (silnia 5)

(define (pi n)
  (* 4 (product (lambda (x) (/ (* x (+ x 2)) (* (+ x 1)(+ x 1)))) (lambda (x) (+ x 2)) 2 n)))

; (pi 10)
; (* (pi 1000) 1.0)

(sort (list 1 2 3 4 5 6 7 8 9 10) >)