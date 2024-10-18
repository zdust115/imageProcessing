
I = imread('pout.tif');
%I = mat2gray(I);    %imposto i valori max e min ad 1 e 0, in modo da poterlo utilizzare per imadjust
J = imadjust(I, [min(I(:)), max(I(:))], [0,1]);
figure, imshow (I);
figure, imshow (J);