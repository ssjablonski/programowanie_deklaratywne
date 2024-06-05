#lang racket

; (define (append l m)
;   (if (null? l) m
;       (cons (car l) (append (cdr l) m))
;       )
;   )

; (append '(1 2 3) '(4 5 6))

; zmiena n-ty elem z list l na x
(define (nth-helper n x l acc)
  (cond [(null? l) acc]
        [(= n 1) (append acc (list x) (cdr l))]
        [else (nth-helper (- n 1) x (cdr l) (cons (car l) acc))]
        ))

(define (nth n x l)
  (nth-helper n x l '())
  )

(nth 2 'z '(a b c)) ; '(a z c)


(define (fold f e l)
  (if (null? l) e
      (f (car l) (fold f e (cdr l)))))


(define (exists pred l)
  (fold (lambda (x acc)
          (if (pred x) #t
              acc)
          ) #f l)
  )

(exists even? '(3 3 5 2))


(define (sum g a)
  (if (eq? a 0) (g a)
      (+ (sum g (- a 1)) (g a))
      ))

(sum (lambda (x) (+ x 2)) 3) ; 14
; 5 + 4 + 3 + 2


