#lang racket

(define (fold f e l)
  (if (null? l) e
      (f (car l) (fold f e (cdr l))))
  )

; (define (append l m)
;   (if (null? l) m
;       (cons (car l) (append (cdr l) m)))
;   )

; (append '(1 2 3) '(4 5 6))


; deletes ALL occurances of x in l
(define (delete x l)
  (cond [(null? l) '()]
        [(eq? (car l) x) (delete x (cdr l))]
        [else (cons (car l) (delete x (cdr l)))])
  )

(define (delete-f x l)
  (fold
   (lambda (el acc) (
                     if (eq? x el) acc
                        (cons el acc)

                        )) '() l)
  )

; (delete 2 '(1 2 3 2 4 2))
; (delete-f 2 '(1 2 3 2 4 2))

; changes all occurances of x to y
(define (exchange x y l)
  (cond [(null? l) '()]
        [(eq? (car l) x) (cons y (exchange x y (cdr l)))]
        [else (cons (car l) (exchange x y (cdr l)))])
  )

(exchange 1 7 '(4 1 5 10 1)) ; '(4 7 5 10 7)


; drops elem from l as long as p is met
(define (drop-while p l)
  (if (p (car l)) (drop-while p (cdr l))
      l)
  )

(drop-while even? '(4 6 7 8 10)) ; '(7 8 10)
(drop-while (lambda (x) (< x 8)) '(4 6 7 8 5 7)) ; '(8 5 7)


