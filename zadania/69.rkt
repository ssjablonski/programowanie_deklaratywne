#lang racket

;6.

(define (sil n)
  (if (< n 2)
      1
      (* n (sil (- n 1)))))

(define (silA n acc)
  (if (< n 2)
      acc
      (silA (- n 1) (* acc n))))

(sil 4)
(silA 4 1)

;7.

(define (fib n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fib (- n 1)) (fib (- n 2)))]))

; (fib 6)

(define (fibHelp n i curr prev)
  (if (= i n) prev
      (fibHelp n (add1 i) (+ curr prev) curr)))

(define (fibA n) (fibHelp n 0 1 0))

; (fibA 6)

; fib 6 0 1 0
; fib 6 1 1 1
; fib 6 2 2 1
; fib 6 3 3 2
; fib 6 4 5 3
; fib 6 5 8 5
; fib 6 6 13 [8]


(define (exp b e)
  (cond
    [(= e 1) b]
    [(odd? e) (* b (exp b (- e 1)))]
    [else (* (exp b (/ e 2)) (exp b (/ e 2)))]))

(exp 2 1)
(exp 2 2)
(exp 2 3)
(exp 2 4)
(exp 2 5)

(define (expHelp b count res)
  (if (= count 0) res
      (expHelp b (- count 1) (* res b))))

(define (expA b e) (expHelp b e 1))

(expA 2 5)

