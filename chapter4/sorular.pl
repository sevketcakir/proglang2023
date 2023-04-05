% Örnek listeler
liste1([5,3,8,12,2,7,6]).
liste2([4,-6,3,7,-11,25,-45,-20]).
liste3([1, 1, 2, 2, 2, 1, 1, 3]).
% Listenin ilk elemanını veren yüklem
ilkeleman([B|K],B).
% Listenin son elemanını veren yüklem
soneleman([S],S) :- !.
soneleman([B|K],Son) :- soneleman(K,Son).
% Listenin sondan bir önceki elemanını veren yüklem
sondanbironce([O1,O0], O1) :- !.
sondanbironce([B|K],Son) :- sondanbironce(K, Son).
% Listedeki en küçük sayıyı veren yüklem
% enkucuk(+Liste:list, -EnKucuk:int)
enkucuk([B],B) :- !.
enkucuk([B|K],EK) :- enkucuk(K, KEK), EK is min(B,KEK).

% min(+A:int,+B:int,-C:int)
min(A,B,A) :- A<B, !.
min(A,B,B) :- A>=B.

enkucuk2([B], B) :- !.
enkucuk2([B|K], EK) :- enkucuk2(K, KEK), min(B, KEK, EK).

% Listedeki elemanların toplamını veren yüklem
% toplam(+Liste:list, -Toplam:int)
toplam([], 0).
toplam([B|K], Toplam) :- toplam(K, KuyrukToplam), Toplam is B+KuyrukToplam.
% Listedeki elemanların karesini veren yüklem
% kare(+Liste:list, -Liste2:list)
kare([], []).
kare([B|K], [B2|K2]) :- kare(K, K2), B2 is B*B.
% Listedeki negatif sayıları filtreleyen yüklem
% negatif(+Liste:list, -Liste2:list)
negatif([],[]).
negatif([B|K],K2) :- B<0, negatif(K, K2), !.
negatif([B|K],[B|K2]) :- B>=0, negatif(K,K2).
% Listede ardışık tekrar eden elemanları eleyen/ayıklayan yüklem
%    ele([1, 1, 2, 2, 2, 1, 1, 3], [1, 2, 1, 3]).
ele([],[]).
ele([T],[T]).
ele([B,B|K],K2) :- ele([B|K], K2), !.
ele([A,B|K],[A|K2]) :- A \= B, ele([B|K], K2).