#lang racket

; list l without x
(define (delete x l)
  (if (= x (first l))
      (rest l)
      (cons (first l) (delete x (rest l)))))

(delete 3 '(1 2 3 4 5))

; number of occurances of x in list l
(define (count x l)
  (cond [(empty? l) 0]
        [(= x (first l))
         (+ 1 (count x (rest l)))]
        [else (count x (rest l))]))

(count 2 '(1 22 3 4))

;value is the list constaining all elem from l fulfilling pred
(define (filter pred l)
  (cond [(empty? l) '()]
        [(pred (first l))
         (cons (first l) (filter pred (rest l)))]
        [else (filter pred (rest l))])
  )

(filter list? '((4 3) 7 (1 2 3) 10))

; (filter even? '(4 3 5 6))
(cons 4 (filter even? (3 5 6)))
; (cons 4 (cons ))

(define (inorder t)
  (if (null? t) '()
      (append (inorder (cadr t)) (list (car t)) (inorder (caddr t)))
      ))

(define (preorder t)
  (if (null? t) '()
      (append (list (car t)) (preorder (cadr t)) (preorder (caddr t)))
      ))

(define (postorder t)
  (if (null? t) '()
      (append (postorder (cadr t)) (postorder (caddr t)) (list (car t)))
      ))

(inorder '(4 (3 () ()) (2 (9 () ()) (7 () ())))) ; '(3 4 9 2 7)
(preorder '(4 (3 () ()) (2 (9 () ()) (7 () ())))) ; '(4 3 2 9 7)
(postorder '(4 (3 () ()) (2 (9 () ()) (7 () ())))) ; '(3 9 7 2 4)

; inorder(L K P)
; preorder(k l P)
; postorder(L P K)


