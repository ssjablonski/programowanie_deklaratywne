#lang racket

(define (fold f e l)
  (if (null? l)
      e
      (f (first l) (fold f e (rest l)))))

(define (length l)
  (fold (lambda (elem acc) (+ 1 acc)) 0 l)
  )

; (define (length l)
;   (if (null? l) 0
;       (+ 1 (length (cdr l)))))

; (length '(1 2 3 4 5))

; (define (reverse l)
;   (if (null? l) '()
;       (append (reverse (cdr l)) (list(car l)))
;       ))

(define (reverse l)
  (fold (lambda (elem acc) (append acc (list elem))) '() l))


; (reverse '(1 2 3 4))
; APPEND ZAWSZE MUSZA BYC LISTY JAKO ARGUMENTY
; (append (reverse 2 3 4) 1)
; (append (append (reverse (3 4 5) 2) 1))

(define (helper n acc)
  (cond [(= acc 1) '(1)]
        [(= (modulo n acc) 0) (append (helper n (- acc 1)) (list acc))]
        [else (helper n (- acc 1))]
        ))

(define (divisors n)
  (helper n n))

; (divisors 9)
; helper 9 9
; (append (helper 9 8) 9)
; (append (helper 9 7) 9)

(define (take-while p l)
  (if (p (car l)) (append (list (car l)) (take-while p (cdr l)))
      '())
  )

(take-while even? '(4 6 7 8 10))
(take-while (lambda (x) (< x 8)) '(4 6 7 8 5 7))