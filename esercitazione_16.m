% % Es 16. Write the code for computing the Haar Wavelet
% and use it to extract the horizontal edges
% % (hint: choose an image where horizontal edges
% are evident and predominant).

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
[cA, cH, cV, cD] = dwt2(original, 'haar');

figure(1);
imshow(cH);
set(get(gca, 'Title'), 'String', 'horizontal edges');
