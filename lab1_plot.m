image = imread('football.jpg');
close all;
imshow(image);
Red = image(:,:,1);
Green = image(:,:,2);
Blue = image(:,:,3);
[yRed, x] = imhist(Red);
[yGreen, x] = imhist(Green);
[yBlue, x] = imhist(Blue);
plot(x, yRed, 'r', x, yGreen, 'g', x, yBlue, 'b');
xlabel('Intensità');
ylabel('Frequenza');
title('Istogrammi dei Canali RGB');
legend('Rosso', 'Verde', 'Blu');
grid on;

