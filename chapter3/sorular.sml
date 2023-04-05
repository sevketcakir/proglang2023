fun double x = x+x;
fun square x = x*x;
val liste = [1,2,3,4,5];
val liste2 = [6, 3, 12, 5, 1, 4, 8];
(* 1 ile parametre olarak verilen n sayısı arasındaki tek sayıların toplamını hesaplayan fonksiyon *)
fun tektopla 1 = 1 | tektopla n = if n mod 2 = 0 then tektopla (n-1) else n + tektopla (n-2);
(* Parametre olarak verilen listedeki elemanların toplamını döndüren fonksiyon *)
fun topla [] = 0 | topla (h::t) = h+topla t;
(* Parametre olarak verilen listenin en küçük elemanını veren fonksiyon *)
fun enkucuk [] = raise Empty | enkucuk [x] = x | enkucuk (b::k) = if b < enkucuk k then b else enkucuk k;
(* Parametre olarak verilen listedeki tek sayıların bulunduğu listeyi döndüren fonksiyon *)
fun teksayilar [] = [] | teksayilar (b::k) = if b mod 2 = 1 then b::teksayilar k else teksayilar k
(* Bir fonksiyon ve bir listeyi parametre olarak alan ve listeyi fonksiyona göre filtreleyen fonksiyon *)
fun even n = n mod 2 = 0
fun odd n = n mod 2 = 1
fun filtrele _ [] = [] | filtrele f (b::k) = if f b then b::filtrele f k else filtrele f k
(* map fonksiyonunu kullanan ve parametre olarak verilen listedeki sayıların karesini alıp liste olarak döndüren fonksiyon *)
fun kare liste = map (fn n => n*n) liste

(* val agac = [12 [5 [3 [] []] [8 [] []]] [25 [14 [] []] []]]; *)