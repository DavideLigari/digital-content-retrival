% ES 15. With  reference  to  figure  7.8  of  the  book,  write
% the  code to  extract  4  bands  of  the  wavelet
% and compute the histogram on a preferred image.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
original = checkGrey(original);
[cA, cH, cV, cD] = dwt2(original, 'db2');


figure(1);

% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));
subplot(2, 2, 1)
imshow(imadjust(mat2gray(cA)));
set(get(gca, 'Title'), 'String', 'approximation image');

subplot(2, 2, 2)
imshow(imadjust(mat2gray(cH)));
set(get(gca, 'Title'), 'String', 'horizontal image');

subplot(2, 2, 3)
imshow(imadjust(mat2gray(cV)));
set(get(gca, 'Title'), 'String', 'vertical image');

subplot(2, 2, 4)
imshow(imadjust(mat2gray(cD)));
set(get(gca, 'Title'), 'String', 'diagonal image');

figure(2)
imhist(cV)
