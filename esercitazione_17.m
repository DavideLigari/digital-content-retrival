% ES 17
% Write a code for adding Gaussian noise
% to an image and use the Haar wavelet for denoising
% it.

clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
original=checkGrey(original);

in = input('insert the mean and variance of the gaussian noise in the following format, [mean,variance]');
immWithNoise = imnoise(original, 'gaussian', in(1), in(2));
tmpImm=im2double(immWithNoise);
im_denoised = wdenoise2(tmpImm,2,"Wavelet","haar");
[cA, cH, cV, cD] = dwt2(original, 'haar');
tmp = zeros(size(cH));
im_denoised_v2 = idwt2(cA, tmp, tmp, tmp, 'haar');
figure(1);
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

subplot(1, 4, 1)
imshow(original);
set(get(gca, 'Title'), 'String', 'Original Image');

subplot(1, 4, 2)
imshow((immWithNoise));
set(get(gca, 'Title'), 'String', 'noisy Image');

subplot(1, 4, 3)
imshow(mat2gray(im_denoised));
set(get(gca, 'Title'), 'String', 'Denoised Image');
subplot(1, 4, 4)
imshow(mat2gray(im_denoised_v2));
set(get(gca, 'Title'), 'String', 'Denoised Image v2');
