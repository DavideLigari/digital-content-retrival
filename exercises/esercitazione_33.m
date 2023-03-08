% 33. You are requested to create three 3 X3 "images" having only 0 and 1 as elements. These
% images will be the red, green, and blue component images of a 3X3 color image that you
% will display.
% For example, the red image could be created by the statement
% >> r=[0,1,0;0,1,1;0,1,1];
% After you have created the g and b images, use the Matlab statements
% >> rgb_image=cat(3,r,g,b);
% >> imshow(rgb_image);
% to display the image. Look at the image carefully to confirm that you have placed the
% saturated primary colors RGB and CMY in the correct places.
% The resulting image plot is rather small (3 x 3 pixels). Use the magnification feature
% imshow(rgb_image,'InitialMagnification','fit');
% of the imshow command to scale the color image to a larger size for viewing.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

r = [0, 1, 0; 0, 1, 1; 0, 1, 1];
g = [0, 0, 0; 1, 1, 0; 1, 1, 1];
b = [0, 0, 1; 0, 0, 1; 1, 1, 1];

rgb_image = cat(3, r, g, b);

figure(1);
% Maximize figure.
imshow(rgb_image, 'InitialMagnification', 'fit');
