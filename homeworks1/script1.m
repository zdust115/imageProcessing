% Caricare l'immagine
img = imread('cameraman.tif'); 
% Visualizzare l'immagine
imshow(img);


%la sintassi : divide righe e colonne, in questo modo per ogni riga
%sottraiamo la colonna con la colonna successiva della stessa riga, fino
%all'ultima colonna in cui termina l'immagine
img_diff = img(:, 1:end-1) - img(:, 2:end);

imshow(img_diff);