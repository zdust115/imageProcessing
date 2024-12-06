close all
clear
clc
% leggere book-text.tif, estrarre i caratteri con tratti verticali
% eliminare i caratteri lungo il bordo

f = imread('book-text.tif');

he = imerode(f,ones([50,1]));
g = imreconstruct(he,f); %ricostruisco le barre verticali senza uscire da f partendo da he

%per rimuovere i bordi invece
f_bord = imclearborder(f);
imshow(f_bord);