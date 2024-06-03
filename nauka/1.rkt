#lang racket

; '(1 "as" 2 #t) ; tablica

; (define a 1) ; definiowanie zmiennej
; a

; (+ 1 1 a) ; definicja funckji (mozemy dac tyle arg ile chcemy?)
; (- 2 1)

; wlasna funkcja

(define (funkcja arg)
  (+ 1 arg))

(define funkcja2
  (lambda (arg)
    (+ 1 arg)))

; TE DWIE FUNCKJE ROBIA TO SAMO TA PIERWSZA TO SKROCONA WERSJA ZAPISU
; (funkcja 1) ; wywolanie funkcji
; (funkcja2 2)


; (map (lambda (item)
;        (+ item 1))
;      '(1 2 3 4 5))

; ta funkcja wykonuje sie sama ale nie wiem czemu

;if
; (define b 2)
; (if (= b 1)
;     ;then
;     "b to 1"
;     ;else
;     "b to nie 1")

; (define li '(1 2 3 4 5))
; (car li)
; (first li)

; (cdr li)
; (rest li)
; to samo chyba nie ma roznicy

(define (sum li)
  (if (empty? li)
      ;then
      0
      ;else
      (+
       (first li)
       (sum (rest li)))))

; 1 2 3 4 5

; 1.   1 + (sum '(2 3 4 5))
; 2.   1 + 2 + (sum '(3 4 5))
; 3.   1 + 2 + 3 + (sum '(4 5))
; 4.   1 + 2 + 3 + 4 + (sum '(5))
; 5.   1 + 2 + 3 + 4 + 5 + (sum '())
; 6.   1 + 2 + 3 + 4 + 5 + 0

; (sum li)

(define (avg a b)
  (quotient (+ a b) 2))

; (avg 10 5)

; RECURSION

(define (fac N)
  (if (< N 2)
      1
      (* N (fac (- N 1)))))

; (fac 5)

; (define l '(1 2 3 4))

; (first l)

; (list '(1 2 3) '(4 5 6))

; append jako argumenty musi dostac listy!

; (append '(1 2 33) '(4 5 56))

; cons - pierwszy argument bedzie na poczatku listy, drugi argument bedzie reszta

; (cons 3 '(4 5))
; (cons '(1 2) '(3 4))


; filtrowanie

(define (keepEven list)
  (cond [(null? list)
         '()]
        [(= 1 (modulo (first list) 2))
         (keepEven (rest list))]
        [else
         (cons (first list) (keepEven (rest list)))]))

; (keepEven '(1 2 3 4 5 6 7))

; for Each

(define (incrementAll list)
  (cond [(null? list)
         '()]
        [else
         (cons (+ 1 (first list)) (incrementAll (rest list)))]))

; (incrementAll '(1 2 3 4 5))

; (remove 42 '(1 2 42 42))

(define (reverse mylist)
  (if (null? mylist)
      '()
      (append (reverse (rest mylist)) (list (first mylist) ))))


; (reverse '(1 2 3 4))
; 2 3 4 \ 1
; 3 4 \ 2 1
; 4 \ 3 2 1
; 4 3 2 1

(define (flatten L)
  (cond [(null? L) '()]
        [(list? (first L)) (append (flatten (first L)) (flatten (rest L)))]
        [else (cons (first L) (flatten (rest L)))]))

(flatten '(((1) 2) 4))  ; should return '(1 2 4)


; (define (sublists L)
;   (if (null? L) '(())
;       (let ([it (first L)]
;             [lose-it (sublists (rest L))]
;             [use-it (map)])))
;   )

(define (fold f e l)
  (if (null? l)
      e
      (f (first l) (fold f e (rest l)))))

(fold + 0 '(1 2 3 4))
(fold * 1 '(1 2 3 4))
(fold * 3 '(1 2 3 4 ))
(fold * 4 '(1 2 3 4))

; (fold * 1 '(1 2 3 4))
; (* 1 (fold * 1 '(2 3 4)))
; (* 1 (* 2 (fold * 1 '(3 4))))
; (* 1 (* 2 (* 3 (fold * 1 '(4)))))
; (* 1 (* 2 (* 3 (* 4 (fold * 1 '()))))
; (* 1 (* 2 (* 3 (* 4 1))))
; (* 1 (* 2 (* 3 4))
; (* 1 (* 2 12))
; (* 1 24)
; 24

; git a jak damy jako e np 3 to wtedy na ostatnim kroku dajemy 3 i mnozymy wynik przez to wiec jest 3 razy wiekszy niz jakbysmy dali 1