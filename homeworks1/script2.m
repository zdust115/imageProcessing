%addpath("MATLAB/ImageProcessing/Materiale/On thresholding");
img = imread("croatia.jpg");


%binaryImg = img < thresh;

%applico un filtro di smoothing per ridurre il rumore, in questo caso
%applico una matrice 5x5
filter= fspecial("average", 10);
smoothedImg= imfilter(img,filter);

% Applica una soglia per segmentare la Croazia
% Modifica il valore della soglia in base all'immagine
thresh = 170; % Soglia da regolare
thresholdedImg = smoothedImg < thresh;

%inverto il filtro per avere un valore alto con l'immagine corrispondente
filtroInvertito = 1 - thresholdedImg;
filtroFinale= uint8(filtroInvertito);

imgfinale= img.*filtroFinale;


figure;
subplot(2,2,1), imshow(img), title("immagine iniziale");
subplot(2,2,2), imshow(smoothedImg), title ("immagine sfocata");
subplot(2,2,3), imshow(thresholdedImg), title("differenza");
subplot(2,2,4), imshow(imgfinale), title ("immagine finale");

