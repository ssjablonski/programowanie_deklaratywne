#lang racket

(define (member x l)
  (cond [(null? l) #f]
        [(eq? x (car l)) #t]
        [else (member x (cdr l))])
  )

(member 2 '(3 4 5)) ; #f

(define (delete x l)
  (cond [(null? l) '()]
        [(eq? x (car l)) (delete x (cdr l))]
        [else (cons (car l) (delete x (cdr l)))])
  )

; (delete 2 '(1 2 3 2 4 5 2))

(define (fold f e l)
  (if (null? l) e
      (f (car l) (fold f e (cdr l))))
  )

(define (member-f x l)
  (fold (lambda (el acc) (
                          if (eq? el x) #t acc
                             )) #f l)
  )

(member-f 2 '(2 3 4 5))

(define (delete-f x l)
  (fold (lambda (el acc) (
                          if (eq? el x) acc
                             (cons el acc)
                             )) '() l)
  )

; (delete-f 2 '(1 2 3 2 4 5 2))


(define (twice l)
  (if (null? l) '()
      (append (list (car l)) (list (car l)) (twice (cdr l))))
  )

(twice '(4 3 5 6)) ; '(4 4 3 3 5 5 6 6)

(define (sum f r)
  (if (eq? r 0) (f r)
      (+ (f r) (sum f (- r 1))))
  )

(sum (lambda (x) (+ x 2)) 3) ; 14
