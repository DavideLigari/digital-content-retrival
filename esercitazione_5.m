% es 5
% Write the code to compute the histogram of a grey level image (two channel) and display
% in the same window the image and its histogram. Try the same on a color RGB image, by
% displaying the histograms on the three-color channel.
clear;

% RGB image 


A=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");

figure(1)
subplot(1,2,1);
imshow(A);

subplot(1,2,2);
imhist(A);

pause;


% grey level image 

A=imread("digitalContentRetrival/matlab/rgbImage.jpeg","jpeg");
A=checkGrey(A);
figure(2)
subplot(1,2,1);
imshow(A);

subplot(1,2,2);
imhist(A);
pause;


%check if the image is grey level, 
% in case it isn't it returns the grey level image
function mat = checkGrey(mat)
    tmp=size(size(mat));
    if(tmp(2)==3)
        mat=rgb2gray(mat);
    end
end