#lang racket

(define (delete x l)
  (if (= x (first l))
      (rest l)
      (cons (first l) (delete x (rest l)))))

; 1 2 3 4 5

; delete (3 '(1 2 3 4 5))
; (cons 1 delete(2 3 4 5))
; (cons 1 (cons 2 delete(3 4 5)))
; (cons 1 (const 2 (cons )))
(delete 3 '(1 2 3 4 5))

(define (count x l)
  (cond [(empty? l) 0]
        [(= x (first l))
         (+ 1 (count x (rest l)))]
        [else (count x (rest l))]))

(count 2 '(1 22 3 4))

(define (filter pred l)
  (cond [(empty? l) '()]
        [(pred (first l))
         (cons (first l) (filter pred (rest l)))]
        [else (filter pred (rest l))])
  )

(filter list? '((4 3) 7 (1 2 3) 10))
; (filter even? '(4 3 5 6))
; (cons 4 (filter even? (3 5 6)))
; (cons 4 (cons ))

(define (inorder t)
  (if (null? t) '()
      (append (inorder (cadr t)) (list (car t)) (inorder (caddr t)))
      ))

(inorder '(4 (3 () ()) (2 (9 () ()) (7 () ()))))