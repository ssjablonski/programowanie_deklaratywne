#lang racket

(define (delete x l)
  (cond [(null? l) '()]
        [(eq? x (car l)) (cdr l)]
        [else (cons (car l) (delete x (cdr l)))])
  )

; (delete 2 '(1 3 4))

(define (count x l)
  (cond [(null? l) 0]
        [(eq? x (car l)) (+ 1 (count x (cdr l)))]
        [else (count x (cdr l))])
  )

; (count 2 '(1 4))

(define (filter pred l)
  (cond [(null? l) '()]
        [(pred (car l)) (cons (car l) (filter pred (cdr l)))]
        [else (filter pred (cdr l))])
  )

; (filter even? '(4 3 5 6))
; (filter list? '((4 3) 7 (1 2 3) 10))

(define (inorder l)
  (if (null? l) '()
      (append (inorder (cadr l)) (list (car l)) (inorder (caddr l))))
  )

(inorder '(4 (3 () ()) (2 (9 () ()) (7 () ()))))
