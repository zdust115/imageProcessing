close all
clear
clc

img = imread('board.tif');
img = im2gray(img);
[M,N,C]= size(img);

% pepe, densità 10pc
noise_density = 0.1;
noisyImg = img; %inizializzo l'immagine
pepper_noise = rand(size(img)) < noise_density;
noisyImg (pepper_noise) = 1;

subplot(2,3,1), imshow(img), title("original");


% h size
hRows = 3;
hCols = hRows;

Q=1.5; %valore da passare alla contrarmonica
subplot(2,3,4), imshow(noisyImg), title("rumore 1");
imgSalt = spatfilt(noisyImg, "contraharmonic", hRows,hCols,Q);
subplot(2,3,2), imshow(imgSalt), title("imgSalt");

% sale, densità 10pc
noise_density = 0.1;
pepper_noise = rand(size(img)) < noise_density;
noisyImg = img; %inizializzo l'immagine
noisyImg (pepper_noise) = 1;

% h size
hRows = 3;
hCols = hRows;

Q=-1.5; %valore da passare alla contrarmonica
imgPepper = spatfilt(noisyImg, "contraharmonic", hRows,hCols,Q);
subplot(2,3,3), imshow(imgPepper), title("imgPepper");
subplot(2,3,5), imshow(noisyImg), title("rumore 2");