% Lettura immagine
img = imread("map.jpg");
m= size(img,1);
n= size(img,2);

%rumore casuale
density= 0.45;
noise_random = rand (m,n) < density;
noise_image= img;
noise_image(noise_random)=rand()*255;


filter_average= fspecial("average");

subplot(2,2,1), imshow(noise_image), title("originale");

filtered_image = imfilter(noise_image,filter_average);
subplot(2,2,2), imshow(filtered_image), title("prima applicazione");

filtered_image = imfilter(filtered_image,filter_average);
subplot(2,2,3), imshow(filtered_image), title("seconda applicazione");

filtered_image = imfilter(filtered_image,filter_average);
subplot(2,2,4), imshow(filtered_image), title("terza applicazione");
