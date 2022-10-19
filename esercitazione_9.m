% es 9
% Write a program to compute the root-mean-square error of a compressed- decompressed
% image.
clear;

original=imread("digitalContentRetrival/matlab/tifImage.tiff","tif");
imwrite(original,'/home/liga/Scrivania/unipv/digitalContentRetrival/matlab/compressed.jpeg','jpeg');
compressed=imread("digitalContentRetrival/matlab/compressed.jpeg","jpeg");

diff=original - compressed;
diff= nonzeros(diff);
square=diff.^2;
sum=0;
n=size(square);
for i=1:n(1)
    sum=sum + square(i);
end
meanSquareError= sum/n(1);
meanSquareError

