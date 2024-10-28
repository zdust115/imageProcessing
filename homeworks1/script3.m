img = imread('bottle.tif');

invertedImg= 255 - img;

threshold = 9;

invThreshold = 245;

%escludo il filtro perché cancella troppi dettagli dall'oggetto più piccolo
%(graffetta)

%filter= fspecial("average");
%img= imfilter(img,filter); 
thresholdedImg= img<threshold;
invThresholdImg = invertedImg > invThreshold;

figure; 
subplot(1,3,1), imshow(img), title("immagine");
subplot(1,3,2), imshow(invertedImg), title("immagine invertita");
subplot(1,3,3), imshow(thresholdedImg), title ("immagine tagliata");


