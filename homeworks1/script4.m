img1 = imread("tools_1.jpg");
img2 = imread("tools_2.jpg");
differenze=img1-img2;

%differenze= imbinarize(differenze); %trasforma in valori 0 ed 1
%imgfinale = img2.*uint8(differenze);
imgfinale= 255 - differenze; %con sfondo bianco


figure;

subplot(2,2,1), imshow(img1), title("iniziale1");
subplot(2,2,2), imshow(img2), title("iniziale2");
subplot(2,2,3), imshow(differenze), title("differenze");
subplot(2,2,4), imshow(imgfinale), title("finale");