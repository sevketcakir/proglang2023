(define liste '(1 2 3 4 5))
(define liste2 '(5 9 12 2 3 6 8))
;1'den n'e kadar olarn sayıların toplamı
(define topla (lambda (n)
                (if (= n 1) 1
                    (+ n (topla (- n 1)))
                    )
                ))
; 1’den verilen n sayısına kadar olan tek sayıların toplamını bulan fonksiyon
(define tektopla (lambda (n) (
                      cond ((= n 1) 1)
                      ((even? n) (tektopla (- n 1)))
                      (else (+ n (tektopla (- n 1))))
                      )))
; Listedeki en küçük değeri bulan fonksiyon
; (define (f n) (+ n 1))
(define (enkucuk L) (
                     if (null? (cdr L)) (car L)
                        (
                         if (< (car L) (enkucuk (cdr L)))
                            (car L)
                            (enkucuk (cdr L))
                         )
                     ))
(define (enkucuk2 L) (
                     if (null? (cdr L)) (car L)
                        (
                         min (car L) (enkucuk2 (cdr L)))
                         )
                     )
; enkucuk fonksiyonu let ile tekrar yazılacak...
(define (enkucuk3 L) (
                     if (null? (cdr L)) (car L)
                        (
                         let ((enk (enkucuk3 (cdr L)))) (
                                                        if (< (car L) enk) (car L) enk
                                                        ))
                     ))
; Listedeki elemanların toplamını hesaplayan fonksiyon
(define (listetopla L) (
                   if (null? L) 0
                      (+ (car L) (listetopla (cdr L)))
                   ))
; Listedeki çift sayıların kareleri toplamını hesaplayan fonksiyon
(define (ciftkaretoplam L)
  (
   cond
    ((null? L) 0)
    ((even? (car L)) (+ (* (car L) (car L)) (ciftkaretoplam (cdr L))))
    (else (ciftkaretoplam (cdr L)))
   )
  )
; Listedeki tek sayıları filtreleyen(kabul eden) fonksiyon
(define (teksayilar L)
  (
   cond
    ((null? L) '())
    ((odd? (car L)) (cons (car L) (teksayilar (cdr L))))
    (else (teksayilar (cdr L)))
   )
  )
; Bir fonksiyon ve listeyi parametre olarak alan ve verilen fonksiyona göre listeyi filtreleyen fonksiyon
(define (filtrele f L)
  (
   cond
    ((null? L) '())
    ((if (f (car L)) (cons (car L) (filtrele f (cdr L)))
         (filtrele f (cdr L))
         ))
   )
  )
; Bir listedeki elemanların toplamını kuyruk özyinelemeli olarak hesaplayan fonksiyonu yazınız
(define (kotopla L sonuc)
  (
   if (null? L) sonuc
      (kotopla (cdr L) (+ (car L) sonuc))
   )
  )
; Collatz sanısını kuyruk özyinelemeli olarak bulan fonksiyon(1’e ulaşmak için gereken adım sayısı)
; odd -> 3*n+1
; even -> n/2
;10 5 16 8 4 2 1
;25 76 38 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
(define (collatz n sonuc)
  (
   cond
    ((= n 1) (+ 1 sonuc))
    ((even? n) (collatz (quotient n 2) (+ sonuc 1)))
    (else (collatz (+ 1 (* 3 n)) (+ sonuc 1)))
   )
  )

(define (collatzzincir n)
  (
   cond ((= n 1) '(1))
        ((even? n) (cons n (collatzzincir (quotient n 2))))
        (else (cons n (collatzzincir (+ 1 (* 3 n)))))
   )
  )