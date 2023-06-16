% ES 6
% Perform a histogram equalization to improve the visual quality of the image (hints: try
% function histeq). Display the original image and the improved image.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

A=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");

EQ= histeq(A);

figure(1)
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));
subplot(2,2,1);
imshow(A);

subplot(2,2,3);
imhist(A);


subplot(2,2,2);
imshow(EQ);

subplot(2,2,4);
imhist(EQ);

pause;