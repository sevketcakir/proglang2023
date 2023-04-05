% Listenin ilk elemanını veren yüklem
ilkeleman([B|K],B).
% Listenin son elemanını veren yüklem
soneleman([S],S) :- !.
soneleman([B|K],Son) :- soneleman(K,Son).
% Listenin sondan bir önceki elemanını veren yüklem
sondanbironce([O1,O0], O1) :- !.
sondanbironce([B|K],Son) :- sondanbironce(K, Son).
% Listedeki en küçük sayıyı veren yüklem
% Listedeki elemanların toplamını veren yüklem
% Listedeki elemanların karesini veren yüklem
% Listedeki negatif sayıları filtreleyen yüklem
% Listede ardışık tekrar eden elemanları eleyen/ayıklayan yüklem
%    ele([1, 1, 2, 2, 2, 1, 1, 3], [1, 2, 1, 3]).
