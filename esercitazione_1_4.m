% es 2
% Download from Internet a grey level image in the field of visible, discover the resolution
% (n. of pixels), and compute the space necessary to store it, by assuming to code it in the
% pure binary number code. Read the image, display it with a title, and compute the space
% requirements by MATLAB. Help: Feel confident and try the basic following MATLAB built
% in functions: input, imread, whos, figure, title, xlabel, imshow, clear, sizeof. Write an .m fie
% for the execution of the commands in sequence and save it in your working folder. The .m
% file has to be properly commented. Understand the difference between script and user-
% defined function.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;
A=imread("digitalContentRetrival/matlab/image.jpeg","jpeg");
A=checkGrey(A);

tmp=size(A);

res= tmp(1)*tmp(2);

figure(1)
imshow(A);
title("image");

pause;

% es 3
% Convert your image in one of the other file format supported by Matlab and write it on
% disk. Compare the dimensions of the files and try to explain the difference, if any. (hint: see
% function imwrite()).

imwrite(A,'/home/liga/Scrivania/unipv/digitalContentRetrival/matlab/dog.png','png');
B=imread("digitalContentRetrival/matlab/dog.png","png");
size(B)
pause;

diff=A-B;
diff = nonzeros(diff);

% es 4
% Select one pixel of the image by asking the coordinate by a keyboard input, modify it in
% another value (as you like) and display the new image. To see the difference, use the
% magnifier (zoom) tool.
in= input(sprintf('insert coordinates in the interval [1,%d ] for the first , and [1, %d ] for second, es [122,22]',tmp(1),tmp(2)));
A(in)=255;

figure(3)
title(sprintf('image with modified pixel [%d,%d]',in(1),in(2)))
imshow(A);
pause;


% es 5
% Write the code to compute the histogram of a grey level image (two channel) and display
% in the same window the image and its histogram. Try the same on a color RGB image, by
% displaying the histograms on the three-color channel.

figure(4)
title('image');
imshow(A);
title('hystogram');
imhist(A);
