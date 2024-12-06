close all 
clear
clc

f=imread('bone.tif');
subplot(2,2,1), imshow(f);
%FS= bwskel(f);
FS= bwmorph(f,"skel",Inf);
subplot(2,2,2), imshow(FS), title ("scheletro");
FS = bwmorph(FS,'spur',5);
subplot(2,2,3), imshow(FS), title ("scheletro tagliato");


subplot(2,2,4), imshow(f~=FS), title ("scheletro sovrapposto");