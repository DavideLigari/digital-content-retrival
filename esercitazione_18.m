% ES 18. Write  the  code  for  computing  one  of  the  Daubechies    Wavelet  (choose  the  one  you  like),
% discard a certain amount of coefficients and perform the Inverse transform.  Compute the
% root mean squared error between the original image and the reconstructed one.

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

[LoD, HiD, LoR, HiR] = wfilters('db2');
[c1, s1] = wavedec2(original, 5, LoD, HiD);

%the threshold is the mean value, we take only the lower
imThreshMeanL = c1;
imThreshMeanL(abs(imThreshMeanL) < mean(abs(imThreshMeanL), 'all')) = 0;
reconstructedMeanL = uint8(waverec2(imThreshMeanL, s1, LoR, HiR));

%the threshold is the max/2 value, we take only the lower
threshM = int8(max(abs(c1), [], 'all') / 2);
imThreshMaxL = c1;
imThreshMaxL(abs(imThreshMaxL) < threshM) = 0;
reconstructedMaxL = uint8(waverec2(imThreshMaxL, s1, LoR, HiR));

figure(1);
% Maximize figure.
set(gcf, 'Position', get(0,'Screensize'));

subplot(1, 3, 1)
imshow(original);
set(get(gca, 'Title'), 'String', 'Original image');

subplot(1, 3, 2)
imshow(reconstructedMeanL);
set(get(gca, 'Title'), 'String', sprintf('Reconstructed image, threshold is the mean.\n MSE : %.4f', mse(original, reconstructedMeanL)));

subplot(1, 3, 3)
imshow(reconstructedMaxL);
set(get(gca, 'Title'), 'String', sprintf('Reconstructed image, threshold is the max/2.\n MSE : %.4f', mse(original, reconstructedMeanL)));

function mse = mse(A, B)
    diff = A - B;
    diff = nonzeros(diff);
    square = power(diff, 2);
    n = size(square);
    summ = sum(square);
    mse = summ / n(1);
end
