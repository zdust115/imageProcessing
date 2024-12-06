close all
clear
clc


A = imread('utk.tif');
B = imread("gt.tif");
subplot(2,3,1),imshow(A), title("A");
subplot(2,3,2),imshow(B), title("B");
