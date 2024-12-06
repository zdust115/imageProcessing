%applicare erosione per elminiare i dettagli irrilevanti in un'immagine
img = imread('small-squares.tif');

%definisco l'elemento strutturante 
h = strel('square',10);
%erodo l'immagine
fe = imerode(img,h);

fe = imdilate(fe,h); 
imshow(fe)
