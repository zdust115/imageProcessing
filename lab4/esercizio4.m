clear
close all
clc

f= imread('noisy-fingerprint.tif');


h=strel('disk',1);

FO = imopen(f,h);
FC = imclose(f,h);
subplot(2,2,1), imshow(f);
subplot(2,2,2), imshow(FO);
subplot(2,2,3), imshow(FC);
subplot(2,2,4), imshow(imclose(FO,h));
