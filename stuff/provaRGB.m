[img, map] = imread("bottle.tif");

myrgb= ind2rgb(img, map);
[m,n]= size(img);

threshold = 120;


newimg = ones(m,n)*255;

newimg = newimg.*(img < threshold);


neg = img;

imshow (newimg);

