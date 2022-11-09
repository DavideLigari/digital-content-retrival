% es 7
% Write the code capable of reducing the number of intensity levels in a image from 256 to
% 2, in integer powers of 2. The desired number of intensity levels needs to be a variable
% input to your program.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

A=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");
A=checkGrey(A);

level = input('insert the desired intensity level, (it must be a number from 1 to 8)');
level= 2^level-1;
step = ceil(255/(level - 1));

new_img = ceil(A./step)*step;

figure(1)
% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));
subplot(2,2,1);
imshow(new_img);

subplot(2,2,3);
imhist(new_img);