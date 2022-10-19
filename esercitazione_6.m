% ES 6
% Perform a histogram equalization to improve the visual quality of the image (hints: try
% function histeq). Display the original image and the improved image.
clear;

A=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");

EQ= histeq(A);

figure(1)
subplot(2,2,1);
imshow(A);

subplot(2,2,3);
imhist(A);


subplot(2,2,2);
imshow(EQ);

subplot(2,2,4);
imhist(EQ);

pause;