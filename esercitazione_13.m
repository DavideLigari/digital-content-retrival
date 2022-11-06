% ES 13.
% Download a gray-level image (or convert a color image to a grey-level one) compute the
% discrete cosine transform (block 8x8) and plot it at a proper scale. Threshold the values of
% the coefficients of the cosine transform using a zonal masking approach and perform the
% inverse discrete cosine transform. Try several pattern of zonal masking in the 8X8 matrix
% to investigate different strategy of zonal masking.
% Hints: example of Zonal masking for an 4X4 block:
% 1111
% 1110
% 1100
% 1000
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
image = checkGrey(original);
dim = size(image);
imTrasformed = dct2(image);

% it creates a random mask and apply it to the image dct
imTrasformed_random = imTrasformed;
random_mask = logical(randi([0,1],dim(1),dim(2))) ;
imTrasformed_random(~random_mask) = 0;
result_random = idct2(imTrasformed_random);

% create a mask first row all 1, second has 0 in the last column,
% third has 0 in the last 2 columns and so on
imTrasformed_cres = imTrasformed;

cres_mask = false(dim(1), dim(2));

for i = 1:dim(1)

    for j = i:dim(2)
        cres_mask(i, j) = true;
    end

end

imTrasformed_cres(~cres_mask) = 0;
result_cres = idct2(imTrasformed_cres);

figure(1);

subplot(2, 3, 1);
imshow(image);
set(get(gca, 'Title'), 'String', 'Original');

subplot(2, 3, 4);
imshow(image);
set(get(gca, 'Title'), 'String', 'inverse transform');

subplot(2, 3, 2);
imshow(result_random);
set(get(gca, 'Title'), 'String', 'image with random mask');

subplot(2, 3, 5);
imshow(random_mask);
set(get(gca, 'Title'), 'String', 'random mask');

subplot(2, 3, 3);
imshow(result_cres);
set(get(gca, 'Title'), 'String', 'image with crescent mask');


subplot(2, 3, 6);
imshow(cres_mask);
set(get(gca, 'Title'), 'String', 'crescent mask');