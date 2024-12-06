close all
clear
clc

f=imread('ten-objects.tif');

[labelled,numero_etichette] = bwlabel(f);


m=ceil(sqrt(numero_etichette));


for i=1:numero_etichette
    subplot(m,m,i),imshow(labelled==i), title("elemento "+i);
end