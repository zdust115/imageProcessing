%imfilter e parametri

I = imread('blood1.tif');
figure,imshow(I),title('Original image');

%filtro media, all'aumentare della grandezza aumenta l'effetto blur
f = ones(10,10);
f = f * (1/100); 
%f = ones(10)/100  modo alternativo di fare la media
new_img = imfilter(I,f);
figure, imshow(new_img), title ('Immagine filtrata');


%h = fspecial('type', parameters);
%ci permette di generare diversi filtri, tra cui il filtro media sopra
%il filtro media ha come parametro hsize predefinito 3

h= fspecial('disk');
new_img= imfilter(I,h);
figure, imshow(new_img), title ('filtro circolare');



I=imread('moon.tif');
figure,imshow(I);
title, ('Original image');

h= fspecial('motion',50,45);
blurred=imfilter(I,h);
figure,imshow(blurred);
title,('immagine blurrata');


h=fspecial("average",20);
lunaMedia = imfilter(I,h);
figure,imshow(lunaMedia);
title,('immagine lunaMedia');


%filtro laplaciano esteso
H8 = [1 1 1; 1 -8 1; 1 1 1];

%filtro laplaciano base
H4 = fspecial ('laplacian',0.0);

masch1= imfilter(I,H4);
masch2= imfilter(I,H8);

f1= imsubtract(I,masch1);
f2= imsubtract(I,masch2);

figure,imshow(f1),title('luna h4');
figure,imshow(f2),title('luna h8');


%smoothing con thresholding
I = imread("telescopio.jpg");

h = fspecial("average",15); %creo il filtro media
f1= imfilter(I,h);          %lo applico all'immagine
imshow(f1),title('immagine sfocata');

th = (25/100)*max(f1(:));
g1 = f1>th;
figure(3);
imshow(g1);
title('maschera');

g1= im2uint8(g1);   %converto il tipo della maschera
g1(g1==255)=1;      %abbasso il valore max ad 1
f2= I.*g1;
imshow(f2);
title('finale');

% denoising 

f=double(f);

noisy = f + d * randn(size(f));
K=[3 5 7 9 11];
for k =1: length(K)
   h=fspacial('average', [K(k) K(k)]);
   g=imfilter(noisy,h,'symmetric','same');
   MSE(k) = mean2((f-1).*2);
   figure(1);
   subplot(1,2,1), imshow(f,[]);
   title("Originale");
   subplot(1,2,2), imshow(f,[]);
   title(['K= ',num2str(K(k)), 'MSE = ',num2str(MSE(k))]);
   MSE(k) = imset(f,g);
   %pause
end
figure(2); plot (K,MSE, 'r-*');
%AIUTO 