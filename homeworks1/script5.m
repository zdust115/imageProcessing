img1= imread("Digit_all.bmp");
maskB = imread("DigitMaskB.bmp");
maskC = imread("DigitMaskC.bmp");

figure;
subplot(2,3,1), imshow(img1), title ("immagine 1");
subplot(2,3,2), imshow(maskB), title ("mask B");
subplot(2,3,3), imshow(maskC), title ("mask C");

dif= img1-maskB;
sum= dif + maskC;
subplot(2,3,4), imshow(dif), title ("dif");
subplot(2,3,5), imshow(sum), title ("sum");