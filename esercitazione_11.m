% In order to understand the concept of non-stationarity of the image signal (see for
% reference to figure 7.1 of the book,) write the code which extracts 4 blocks of 32 X 32
% pixels of a preferred image and compute and plot the histograms.
clear;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
image = imread(strcat(path, file));
imSize = size(image);
xLenght = int32(imSize(1) / 4);
yLenght = int32(imSize(2) / 4);

block1 = image(1:xLenght, 1:yLenght, :);
block2 = image(xLenght + 1:(2 * xLenght), yLenght + 1:(2 * yLenght), :);
block3 = image((2 * xLenght) + 1:(3 * xLenght), (2 * yLenght) + 1:(3 * yLenght), :);
block4 = image((3 * xLenght) + 1:imSize(1), (3 * yLenght) + 1:imSize(2), :);

figure(1);

subplot(2, 5, 1);
imshow(image);

subplot(2, 5, 6);
imhist(image);

subplot(2, 5, 2);
imshow(block1);

subplot(2, 5, 7);
imhist(block1);

imshow(block2);

subplot(2, 5, 8);
imhist(block2);

subplot(2, 5, 4);
imshow(block3);

subplot(2, 5, 9);
imhist(block3);

subplot(2, 5, 5);
imshow(block4);

subplot(2, 5, 10);
imhist(block4);
