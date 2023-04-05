liste = [1..10]
liste2 = [5,2,8,6,5,4,12,3]
-- 1 ile parametre olarak verilen n sayısı arasındaki tek sayıların toplamını hesaplayan fonksiyon
topla 1 = 1
topla n = if odd n then n+topla (n-2) else topla (n-1)
--liste üreteci ile yapımı
topla2 n = sum [x | x<-[1..n], odd x]
-- Parametre olarak verilen listedeki elemanların toplamını döndüren fonksiyon
listetopla [] = 0
listetopla (b:k) = b+listetopla k
-- Parametre olarak verilen listenin en küçük elemanını veren fonksiyon
enkucuk [x] = x
enkucuk (b:k) = min b (enkucuk k)
-- Parametre olarak verilen listedeki tek sayıların bulunduğu listeyi döndüren fonksiyon
teksayilar liste = [x | x <- liste, odd x]

teksayilar2 [] = []
teksayilar2 (b:k) = if odd b then b:teksayilar2 k else teksayilar2 k

teksayilar3 [] = []
teksayilar3 (b:k)
    | odd b = b:teksayilar3 k
    | otherwise = teksayilar3 k
-- Bir fonksiyon ve bir listeyi parametre olarak alan ve listeyi fonksiyona göre filtreleyen fonksiyon
filtrele _ [] = []
filtrele f (b:k)
    | f b = b:filtrele f k
    | otherwise = filtrele f k
-- map fonksiyonunu kullanan ve parametre olarak verilen listedeki sayıların karesini alıp liste olarak döndüren fonksiyon
kare liste = map (\x -> x*x) liste

-- İkili arama ağacı kullanıcı tanımlı veri türü
data BST a = Nil | Node a (BST a) (BST a) deriving (Show)
agac1 = Node 12 (Node 5 (Node 3 Nil Nil) (Node 8 Nil Nil)) (Node 25 (Node 14 Nil Nil) Nil)
--        12
--       /   \
--      5    25
--     / \   /
--    3   8 14 
-- İkili arama ağacında arama yapan fonksiyon
--ara:: BST a -> Bool
ara Nil _ = False
ara (Node deger sol sag) aranacak
    | deger == aranacak = True
    | aranacak < deger = ara sol aranacak
    | otherwise = ara sag aranacak
-- İkili arama ağacına ekleme yapan fonksiyon
ekle Nil eklenecek = Node eklenecek Nil Nil
ekle (Node deger sol sag) eklenecek
    | deger == eklenecek = Node deger sol sag --error "Değer zaten ağaçta mevcut"
    | eklenecek < deger = Node deger (ekle sol eklenecek) sag
    | otherwise = Node deger sol (ekle sag eklenecek)
-- İkili arama ağacından değer silen fonksiyon
sil