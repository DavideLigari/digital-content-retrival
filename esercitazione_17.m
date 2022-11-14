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

figure(1);
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

subplot(1, 3, 1)
imshow(original);
set(get(gca, 'Title'), 'String', 'Original Image');

subplot(1, 3, 2)
imshow(immWithNoise);
set(get(gca, 'Title'), 'String', 'noisy Image');

subplot(1, 3, 3)
imshow(im_denoised);
set(get(gca, 'Title'), 'String', 'Denoised Image');