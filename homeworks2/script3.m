img = imread("lena.gif");
m = size(img,1);
n = size(img,2);
img_noise = imnoise(img,"salt & pepper");

imshow(img_noise);

img_order = 1;
subplot(2,3,img_order), imshow(img_noise), title("immagine rumorosa");

for i=3:2:12
    filtered_image = medfilt2(img_noise,[i i]);
    label_img = "maschera " + i;
    img_order = img_order+1;
    error = immse(img,filtered_image); %calcolo l'errore tra immagine originale e filtrata, per comprendere la perdita di dati
    error_string = "MSE: " + num2str(error);
    subplot(2,3,img_order), imshow(filtered_image), title(label_img), text(0,n+20,error_string);
end

medfilt2(img_noise);
