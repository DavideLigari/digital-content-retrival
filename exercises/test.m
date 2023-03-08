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
block_size = 8;
%convert the image to gray level
image = checkGrey(original);
%modifies the size of the image to a multiple of block_size
image = resizeImage(image, block_size);
dim = size(image);

% it creates a random mask and apply it to the image dct
random_image = image;
random_mask = logical(randi([0, 1], block_size, block_size));

for i = 1:+block_size:dim(1)

    for j = 1:+block_size:dim(2)
        tmp = random_image(i:i + block_size - 1, j:j + block_size - 1);
        tmp = dct2(tmp);
        tmp(~random_mask) = 0;
        tmp = idct2(tmp);
        random_image(i:(i + block_size - 1), j:(j + block_size - 1)) = tmp;

    end

end

figure(1);

% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

subplot(2, 3, 1);
imshow(image);
set(get(gca, 'Title'), 'String', 'Original');

subplot(2, 3, 2);
imshow(random_image);
set(get(gca, 'Title'), 'String', 'image with random mask');

subplot(2, 3, 5);
imshow(random_mask);
set(get(gca, 'Title'), 'String', 'random mask');
