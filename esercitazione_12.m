% ES 12
% Download  a  gray-level  image  (or  convert  a  color  image  to  a  grey-level    one)  compute  the
% discrete cosine transform (block 8x8) and plot it at a proper scale. Threshold the values of
% the  coefficients  of  the  cosine  transform  (the  threshold  is  parametric)  and  perform  the
% inverse  discrete  cosine transform.  Try  several  values  of  threshold  (i.e.,  the  mean  value  of
% the coefficients, the maximum value/2, ...) to investigate different strategy of thresholding
% masking.

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
% convert the image to gray level
image = checkGrey(original);
% modifies the size of the image to a multiple of block_size
block_size = 8;
image = resizeImage(image, block_size);
dim = size(image);
% Display the transformed image using a logarithmic scale, in order to see
% which frequencies could be filtered
imTrasformed = dct2(image);
imshow(log(abs(imTrasformed)), []);
colormap parula;
colorbar;

% the threshold is set by the user
thresh = input("set the threshold ");

% The threshold is set by the user the higher frequencies are eliminated.
% This loop take a block of block_sizeXblock_size at once,
% executes on them the dct transform, applies the threshold and
% perform the inverse dct transform
imUserThreshL = image;

for i = 1:+block_size:dim(1)

    for j = 1:+block_size:dim(2)
        tmp = imUserThreshL(i:i + block_size - 1, j:j + block_size - 1);
        tmp = dct2(tmp);
        tmp(log(abs(tmp)) > thresh) = 0;
        tmp = idct2(tmp);
        imUserThreshL(i:(i + block_size - 1), j:(j + block_size - 1)) = tmp;

    end

end

% The threshold is the mean value, we take only the lower.
% This loop take a block of block_sizeXblock_size at once,
% executes on them the dct transform, applies the threshold and
% perform the inverse dct transform
imThreshMeanL = image;

for i = 1:+block_size:dim(1)

    for j = 1:+block_size:dim(2)
        tmp = imThreshMeanL(i:i + block_size - 1, j:j + block_size - 1);
        tmp = dct2(tmp);
        tmp(abs(tmp) > mean(abs(tmp), 'all')) = 0;
        tmp = idct2(tmp);
        imThreshMeanL(i:(i + block_size - 1), j:(j + block_size - 1)) = tmp;

    end

end

% The threshold is the max/2 value, we take only the lower.
% This loop take a block of block_sizeXblock_size at once,
% executes on them the dct transform, applies the threshold and
% perform the inverse dct transform
imThreshMaxL = image;

for i = 1:+block_size:dim(1)

    for j = 1:+block_size:dim(2)
        tmp = imThreshMaxL(i:i + block_size - 1, j:j + block_size - 1);
        threshM = int8(max(abs(tmp), [], 'all') / 2);
        tmp = dct2(tmp);
        tmp(abs(tmp) > threshM) = 0;
        tmp = idct2(tmp);
        imThreshMaxL(i:(i + block_size - 1), j:(j + block_size - 1)) = tmp;

    end

end
figure(1)
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

subplot(1, 4, 1)
imshow(image)
set(get(gca, 'Title'), 'String', 'Original');

subplot(1, 4, 2)
imshow(imUserThreshL)
set(get(gca, 'Title'), 'String', 'User thresh');

subplot(1, 4, 3)
imshow(imThreshMeanL)
set(get(gca, 'Title'), 'String', 'mean thresh');

subplot(1, 4, 4)
imshow(imThreshMaxL)
set(get(gca, 'Title'), 'String', 'max/2 thresh');
