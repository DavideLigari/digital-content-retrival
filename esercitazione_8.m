% es 8
% Write the code to compute the histogram of a grey level image (two channel) and display
% in the same window the image and its histogram. Try the same on a color RGB image, by
% displaying the histograms on the three-color channel.
clear;

imm=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");

in= input('insert the mean and variance of the gaussian noise in the following format, [mean,variance]');
immWithNoise=imnoise(imm,'gaussian',in(1),in(2));

figure(1)

subplot(1,2,1);
title('image');
imshow(imm);

subplot(1,2,2);
imshow(immWithNoise);

