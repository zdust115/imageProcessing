clear all
close all
clc

img = imread("board.tif");


a = 0;
b= 20;
noise = uint8(a + b * randn(size(img))); % Rumore gaussiano
degradedImg = img + noise; % Immagine degradata

subplot (2,2,1), imshow(img,[]), title ("originale");

% Calcola l'errore quadratico medio (MSE)
val = immse(img,degradedImg);

subplot (2,2,2), imshow(im2uint8(degradedImg),[]), title ("degradata"), xlabel(val);

%grandezza maschera = 3x3
hRows = 3;
hCols = hRows;

imgArithmetic= spatfilt(degradedImg,"arithmetic",hRows, hCols);
% Calcola l'errore quadratico medio (MSE)
val = immse(img,imgArithmetic);
subplot (2,2,3), imshow(imgArithmetic), title ("media aritmetica"), xlabel(val); 


imgGeometric= spatfilt(degradedImg,"geometric",hRows, hCols);

% Calcola l'errore quadratico medio (MSE)
val = immse(img,imgGeometric);
subplot (2,2,4), imshow(imgGeometric), title ("media geometrica"), xlabel(val);