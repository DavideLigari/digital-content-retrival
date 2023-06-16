% es 8
% Write the code to compute the histogram of a grey level image (two channel) and display
% in the same window the image and its histogram. Try the same on a color RGB image, by
% displaying the histograms on the three-color channel.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tif;*.jpg;*.png;*.jpeg'}, "select an image");
imm = imread(strcat(path, file));

in = input('insert the mean and variance of the gaussian noise in the following format, [mean,variance]');
immWithNoise = imnoise(imm, 'gaussian', in(1), in(2));

tmp = size(size(mat));

%if the image is rgb show the histograms of each colours
if (tmp(2) == 3)
    figure(1)
    % Maximize figure.
    set(gcf, 'Position', get(0, 'Screensize'));

    subplot(2, 1, 1);
    title('image');
    imshow(imm);
    subplot(2, 1, 2);
    imhist(imm);

    figure(2)
    subplot(2, 3, 2);
    imshow(immWithNoise);
    subplot(2, 3, 4);

    imhist(immWithNoise(:, :, 1));
    myHist = findobj(gca, 'Type', 'Stem');
    % Change the color to red
    myHist.Color = [1 0 0];
    subplot(2, 3, 5);
    imhist(immWithNoise(:, :, 2));
    myHist = findobj(gca, 'Type', 'Stem');
    % Change the color to green
    myHist.Color = [0 1 0];
    subplot(2, 3, 6);
    imhist(immWithNoise(:, :, 1));
else
    figure(1)
    % Maximize figure.
    set(gcf, 'Position', get(0, 'Screensize'));

    subplot(2, 2, 1);
    title('image');
    imshow(imm);

    subplot(2, 2, 3);
    imhist(imm);

    subplot(2, 2, 2);
    title('image');
    imshow(immWithNoise);

    subplot(2, 2, 4);
    imhist(immWithNoise);
end
