close all
clear
clc

img = imread('board.tif');
[M,N,C]= size(img);

% pepe, densità 10pc
noise_density = 0.1;
noisyImg = img; 
pepper_noise = rand(size(img)) < noise_density;
noisyImg (pepper_noise) = 0;

subplot(2,3,1), imshow(img), title("original");


% h size
hRows = 3;
hCols = hRows;

Q=1.5; %valore da passare alla contrarmonica
subplot(2,3,4), imshow(noisyImg), title("rumore 1");
imgPepper = spatfilt(noisyImg, "contraharmonic", hRows,hCols,Q);
subplot(2,3,2), imshow(imgPepper), title("filtered pepper image");

% sale, densità 10pc
noise_density = 0.1;
pepper_noise = rand(size(img)) < noise_density;
noisyImg = img; 
noisyImg (pepper_noise) = 255;

% h size
hRows = 3;
hCols = hRows;

Q=-1.5; %valore da passare alla contrarmonica
imgSalt = spatfilt(noisyImg, "contraharmonic", hRows,hCols,Q);
subplot(2,3,3), imshow(imgSalt), title("filtered salt image");
subplot(2,3,5), imshow(noisyImg), title("rumore 2");