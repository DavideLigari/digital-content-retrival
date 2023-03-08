clear;

[file, path] = uigetfile({'*.tif;*.jpg;*.png;*.jpeg'}, "select an image");
img = imread(strcat(path, file));
img=checkGrey(img);

figure;
imshow(img);
h_rect = drawrectangle();

bm=createMask(h_rect);
bm=logical(bm);
maskedRgbImage = img(bm);

imshow(maskedRgbImage);