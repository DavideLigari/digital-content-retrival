% ES 19
% Write  the  code  for  computing  two  different  Wavelets  (one  level  decomposition)  and
% compare visually the histograms of the different bands.

% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
image = imread(strcat(path, file));

[cA, cH, cV, cD] = dwt2(image, 'db2');

[cA2, cH2, cV2, cD2] = dwt2(image, 'mb4.2');

figure(1)
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

subplot(2, 4, 1)
imhist((cA))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of db2 wavelet\n Approximation coefficients'));

subplot(2, 4, 2)
imhist((cH))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of db2 wavelet\n  Horizontal detail coefficients'));

subplot(2, 4, 3)
imhist((cV))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of db2 wavelet \n  Vertical detail coefficients'));

subplot(2, 4, 4)
imhist((cD))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of db2 wavelet \n  Diagonal detail coefficients'));

subplot(2, 4, 5)
imhist((cA2))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of mb4.2 wavelet \n Approximation coefficients'));

subplot(2, 4, 6)
imhist((cH2))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of mb4.2 wavelet \n  Horizontal detail coefficients'));

subplot(2, 4, 7)
imhist((cV2))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of mb4.2 wavelet \n  Vertical detail coefficients'));

subplot(2, 4, 8)
imhist((cD2))
set(get(gca, 'Title'), 'String', sprintf('Hystigram of mb4.2 wavelet \n  Diagonal detail coefficients'));
