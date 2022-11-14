%  ES 31
% Plot on the same figure the psnr and the ssim values computed between the original image
% and ten versions of the same image corrupted by Gaussian noise of increasing energy.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tif;*.jpg;*.png;*.jpeg'}, "select an image");
image = imread(strcat(path, file));

figure(1)
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));

for i = 1:10
    subplot(2, 5, i)
    immWithNoise = imnoise(image, 'gaussian', 0.001 * i, 0.002 * i);
    imshow(immWithNoise);
    set(get(gca, 'Title'), 'String', sprintf('image with a gaussian noise with mean: %0.3f and variance %0.3f \n SSIM : %0.3f', 0.001 * i, 0.002 * i, ssim(immWithNoise, image)));

end
