close all
clc
clear

f = imread('shapes.tif');

h = strel('square',20);

subplot(2,2,1), imshow(f), title ('original');
subplot(2,2,2), imshow(imopen(f,h)), title ('opening');
subplot(2,2,3), imshow(imclose(f,h)), title ('closing');
subplot (2,2,4), imshow (imclose(imopen(f,h),h)), title ("closing dell'opening");