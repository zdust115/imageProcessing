% Lettura immagine
img = imread("etna.jpg");

% Parametri per il rumore gaussiano
m = 0;
var_gauss = 0.02;
noise_image = imnoise(img, "gaussian", m, var_gauss);

% Filtro media
filtro_media = fspecial("average");
img_media = imfilter(noise_image, filtro_media);

% Filtro gaussiano
filtro_gauss = fspecial("gaussian");
img_gauss = imfilter(noise_image, filtro_gauss);

% Filtro mediana applicato ai tre canali
img_mediana = noise_image; % Inizializzo la matrice per mantenere la dimensione
for c = 1:3
    img_mediana(:, :, c) = medfilt2(noise_image(:, :, c), [3, 3]); % Finestra 3x3
end

%img_mediana = ordfilt2(noise_image,5, ones(3,3));  %è un altro modo di
%scrivere il filtro mediana, ma anche questo necessita di distinguere i tre
%canali

% Dimensioni dell'immagine
altezza = size(img, 1);
larghezza = size(img, 2);

meta_altezza = floor(altezza / 2);
meta_larghezza = floor(larghezza / 2);

% Divide img in quadranti
quadrante_1 = img(1:meta_altezza, 1:meta_larghezza, :);                   % Alto-sinistra
quadrante_2 = img_media(1:meta_altezza, meta_larghezza+1:end, :);         % Alto-destra
quadrante_3 = img_gauss(meta_altezza+1:end, 1:meta_larghezza, :);         % Basso-sinistra
quadrante_4 = img_mediana(meta_altezza+1:end, meta_larghezza+1:end, :);   % Basso-destra

% Combina i quadranti
superiore = [quadrante_1, quadrante_2];
inferiore = [quadrante_3, quadrante_4];
immagine_finale = [superiore; inferiore];

% Mostra l'immagine finale
imshow(immagine_finale);
