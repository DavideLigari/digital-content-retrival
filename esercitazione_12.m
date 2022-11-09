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
image = checkGrey(original);

imTrasformed = dct2(image);
% Display the transformed image using a logarithmic scale, in order to see
% which frequencies could be filtered
imshow(log(abs(imTrasformed)), []);
colormap parula;
colorbar;
pause;

%the threshold is set by the user
thresh = input("set the threshold ");

%the threshold is set by the user the higher frequencies are eliminated
imUserThreshL = imTrasformed;
imUserThreshL(log(abs(imUserThreshL)) > thresh) = 0;
imUserThreshL = idct2(imUserThreshL);

%the threshold is the mean value, we take only the lower
imThreshMeanL = imTrasformed;
imThreshMeanL(abs(imThreshMeanL) > mean(abs(imThreshMeanL), 'all')) = 0;
imThreshMeanL = idct2(imThreshMeanL);

%the threshold is the max/2 value, we take only the lower
threshM = int8(max(abs(imTrasformed), [], 'all') / 2);
imThreshMaxL = imTrasformed;
imThreshMaxL(abs(imThreshMaxL) > threshM) = 0;
imThreshMaxL = idct2(imThreshMaxL);

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
